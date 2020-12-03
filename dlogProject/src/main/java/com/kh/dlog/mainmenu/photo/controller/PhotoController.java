package com.kh.dlog.mainmenu.photo.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.common.template.Pagination;
import com.kh.dlog.friend.model.service.FriendService;
import com.kh.dlog.friend.model.vo.Friend;
import com.kh.dlog.mainmenu.photo.model.service.PhotoService;
import com.kh.dlog.mainmenu.photo.model.vo.Photo;
import com.kh.dlog.member.model.vo.Member;

@Controller
public class PhotoController {
	
	@Autowired
	private PhotoService pService;
	
	@Autowired
	private FriendService fService;
	
	@RequestMapping("enroll.ph")
	public String enrollPhoto() {
		return "mainmenu/photo/photoEnroll";
	}
	
	@RequestMapping(value="insert.ph", method=RequestMethod.POST)
	public String insertPhoto(Photo p, @RequestParam(required=false) List<MultipartFile> upfiles, HttpSession session, Model model) {
		
		ArrayList<Photo> list = p.getList();
		if(!upfiles.get(0).getOriginalFilename().equals("")) {
			for(int i = 0 ; i < upfiles.size() ; i++) {
				String changeName = saveFile(upfiles.get(i), session);
				if(changeName != null) {
					list.get(i).setPhotoOriginName(upfiles.get(i).getOriginalFilename());
					list.get(i).setPhotoChangeName("resources/uploads/" + changeName);
				}
			}
		}
		
		int result = pService.insertPhoto(list);
		if(result > 0) {
			session.setAttribute("alertMsg", "게시판 등록 성공!!");
			return "redirect:selectList.ph";
		}else {
			session.setAttribute("alertMsg", "게시판 등록 실패..");
			return "common/errorPage";
		}
		
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		String savePath = session.getServletContext().getRealPath("/resources/uploads/");
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()*90000+10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	@RequestMapping("delete.ph")
	public String deletePhoto(String[] deleteNums, HttpSession session) {
		int[] intNums = Arrays.stream(deleteNums).mapToInt(Integer::parseInt).toArray();
		int result = pService.deletePhoto(intNums);
		if(result > 0) {
			session.setAttribute("alertMsg", "사진 삭제 성공!!");
			return "redirect:selectList.ph";
		}else {
			session.setAttribute("alertMsg", "사진 삭제 실패..");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("selectList.ph")
	public String selectPhotoList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		int listCount = pService.selectPhotoListCount(m.getMemberNo());
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 12);
		ArrayList<Photo> list = pService.selectPhotoList(m.getMemberNo(), pi);
		model.addAttribute("pi",pi);
		model.addAttribute("list",list);
		
		return "mainmenu/photo/photoMain";
		
	}
	
}
