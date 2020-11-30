package com.kh.dlog.mainmenu.freenote.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.common.template.Pagination;
import com.kh.dlog.mainmenu.freenote.model.service.FreenoteService;
import com.kh.dlog.mainmenu.freenote.model.vo.Freenote;
import com.kh.dlog.mainmenu.freenote.model.vo.Reply;
import com.kh.dlog.mainmenu.freenote.model.vo.SearchCondition;
import com.kh.dlog.member.model.vo.Member;

@Controller
public class FreenoteController {

	@Autowired
	private FreenoteService fService;
	
	@RequestMapping("list.fn")
	public String selectList() {
		return "mainmenu/freenote/freenoteListView";
	}
	
	@ResponseBody
	@RequestMapping(value="flist.fn", produces="application/json; charset=utf-8")
	public String freenoteList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, SearchCondition sc) {

		int listCount = fService.selectListCount(sc);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, sc.getBoardLimit());
		ArrayList<Freenote> list = fService.selectList(sc, pi);
		ArrayList<String> cateList = fService.selectCategory(sc.getMno());
		
		JSONObject jobj = new JSONObject();
		jobj.put("list", list);
		jobj.put("cateList", cateList);
		jobj.put("pi", pi);
		jobj.put("sc", sc);
		
		return new Gson().toJson(jobj);
	}
	
	@RequestMapping("enrollForm.fn")
	public String enrollForm(Model model) {
		
		// 수정 필요!! 로그인한 회원 번호로!!
		ArrayList<String> cateList = fService.selectCategory(1);
		model.addAttribute("cateList", cateList);
		
		return "mainmenu/freenote/freenoteEnrollForm";
	}
	
	@RequestMapping("insert.fn")
	public String insertFreenote(Freenote fn, Model model, HttpSession session) {
		
		if(fn.getFreenotePrivacy().equals("N")) {
			fn.setFreenotePrivacyComm("N");
			fn.setFreenoteCommentYN("N");
		}
		int result = fService.insertFreenote(fn);

		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 등록되었습니다.");
			// 수정 필요!! 로그인한 회원 번호로!!
			model.addAttribute("mno", 1);
			return "redirect:list.fn";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.fn")
	public String selectFreenote(int fno, Model model, HttpSession session) {
		
		int result = fService.increaseCount(fno);
		
		if(result>0) {
			Freenote fn = fService.selectFreenote(fno, ((Member)session.getAttribute("loginUser")).getMemberNo());
			model.addAttribute("fn", fn);
			return "mainmenu/freenote/freenoteDetailView";			
		}else {
			// 에러페이지
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateForm.fn")
	public String deleteFreenote(int fno, Model model) {
		// 로그인한 회원번호로 수정
		int mno = 1;
		ArrayList<String> cateList = fService.selectCategory(mno);
		Freenote fn = fService.selectFreenote(fno, 0);
		model.addAttribute("cateList", cateList);
		model.addAttribute("fn", fn);
		return "mainmenu/freenote/freenoteUpdateForm";
	}
	
	@RequestMapping("update.fn")
	public String updateFreenote(Freenote fn, Model model, HttpSession session) {
		if(fn.getFreenotePrivacy().equals("N")) {
			fn.setFreenotePrivacyComm("N");
			fn.setFreenoteCommentYN("N");
		}
		
		int result = fService.updateFreenote(fn);
		if(result>0) {
			session.setAttribute("alertMsg", "수정되었습니다.");
			model.addAttribute("fno", fn.getFreenoteNo());
			return "redirect:detail.fn";
		}else {
			//에러페이지
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.fn")
	public ModelAndView deleteFreenote(int fno, HttpSession session, ModelAndView mv) {
		int result = fService.deleteFreenote(fno);
		
		if(result>0) {
			session.setAttribute("alertMsg", "삭제되었습니다.");
			mv.addObject("mno", 1).setViewName("redirect:list.fn");
		}else {
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.fn", produces="application/json; charset=utf-8")
	public String selectReplyList(int fno, int currentPage, HttpSession session) {
		int listCount = fService.selectReplyListCount(fno);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Reply> rlist = fService.selectReplyList(fno, ((Member)session.getAttribute("loginUser")).getMemberNo(), pi);
		ArrayList<Reply> rlist2= fService.selectReplyList2(fno, ((Member)session.getAttribute("loginUser")).getMemberNo());
		
		JSONObject jobj = new JSONObject();
		jobj.put("rlist", rlist);
		jobj.put("rlist2", rlist2);
		jobj.put("replyCount", fService.selectFreenote(fno, 0).getReplyCount());
		jobj.put("pi", pi);
		
		return new Gson().toJson(jobj);
	}
	
	@ResponseBody
	@RequestMapping(value="rinsert.fn", produces="text/html; charset=utf-8")
	public String insertReply(Reply r) {

		if(r.getRefRno()==0) {
			r.setReplyLevel(1);
		}else {
			r.setReplyLevel(2);
		}
		return fService.insertReply(r) + "";
	}
	
	@ResponseBody
	@RequestMapping(value="rdelete.fn", produces="text/html; charset=utf-8")
	public String deleteReply(int rno) {
		return fService.deleteReply(rno) + "";
	}
	
	@ResponseBody
	@RequestMapping(value="likePost.fn", produces="text/html; charset=utf-8")
	public String likePost(int memberNo, int fno) {
		Freenote fn = new Freenote();
		fn.setFreenoteWriter(memberNo+"");
		fn.setFreenoteNo(fno);
		int result = fService.checkLikePost(fn);
		if(result == 0) {
			fService.likePost(fn);
			return "1";
		}else {
			fService.dislikePost(fn);
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="likeReply.fn", produces="text/html; charset=utf-8")
	public String likeReply(int memberNo, int rno) {
		Reply r = new Reply();
		r.setReplyWriter(memberNo+"");
		r.setReplyNo(rno);
		int result = fService.checkLikeReply(r);
		if(result == 0) {
			fService.likeReply(r);
			return "1";
		}else {
			fService.dislikeReply(r);
			return "0";
		}
	}
}













