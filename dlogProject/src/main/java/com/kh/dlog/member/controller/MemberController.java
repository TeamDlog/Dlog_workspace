package com.kh.dlog.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.dlog.common.model.vo.PageInfo;
import com.kh.dlog.common.template.Pagination;
import com.kh.dlog.friend.model.service.FriendService;
import com.kh.dlog.friend.model.vo.Friend;
import com.kh.dlog.member.model.service.MemberService;
import com.kh.dlog.member.model.vo.Member;
import com.kh.dlog.mypage.controlAll.model.service.ControlAllService;
import com.kh.dlog.mypage.controlAll.model.vo.ControlAll;
import com.kh.dlog.template.Coolsms;
import com.kh.dlog.widget.dday.model.service.DdayService;
import com.kh.dlog.widget.dday.model.vo.Dday;
import com.kh.dlog.widget.memo.model.service.MemoService;
import com.kh.dlog.widget.memo.model.vo.Memo;
import com.kh.dlog.widget.timetable.model.Service.TimetableService;
import com.kh.dlog.widget.timetable.model.vo.Timetable;
import com.kh.dlog.widget.voca.model.service.VocaService;
import com.kh.dlog.widget.voca.model.vo.Voca;


@Controller
public class MemberController {
	
	private Calendar today = Calendar.getInstance();
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private ControlAllService caService;
	@Autowired
	private TimetableService tService;
	@Autowired
	private DdayService dService;
	@Autowired
	private FriendService fService;
	@Autowired
	private MemoService meService;
	@Autowired
	private VocaService vService;

	public void widgetSessionUpdate(HttpSession session, int diaryMemberNo) {
		
		// 메모위젯 객체
		Memo memoWidget = meService.selectMemoWidget(diaryMemberNo);
		
		// 위젯관리, 메뉴관리, 테마관리 객체
		ControlAll ca = caService.ControlAllMain(diaryMemberNo+"");
		
		// 시간표 객체리스트
		ArrayList<Timetable> tlist = tService.timetableList(diaryMemberNo);
		
		ArrayList<Dday> dlist = dService.ddayMain(diaryMemberNo+"");
		
		// 시간표 객체리스트에 오늘날짜 추가하는 조건문/반복문
		if(!tlist.isEmpty()) {
			for(Timetable t : tlist) {
				switch(today.get(Calendar.DAY_OF_WEEK)) {
					case 1 : t.setTimetableToDay("일요일"); break;
					case 2 : t.setTimetableToDay("월요일"); break;
					case 3 : t.setTimetableToDay("화요일"); break;
					case 4 : t.setTimetableToDay("수요일"); break;
					case 5 : t.setTimetableToDay("목요일"); break;
					case 6 : t.setTimetableToDay("금요일"); break;
					case 7 : t.setTimetableToDay("토요일"); break;
				}
			}
		}
		
		// 위젯관리, 메뉴관리, 테마관리 객체 세션보관
		session.setAttribute("ca", ca);
		// 디데이 객체리스트 세션에 보관
		session.setAttribute("dlist", dlist);
		// 시간표 객체리스트 세션에 보관
		session.setAttribute("timetableList", tlist);
		// 메모 위젯 객체 세션에 보관
		session.setAttribute("memoWidget", memoWidget);
	}
	
	@RequestMapping("mainpage.me")
	public String mainpage() {
		return "mainpage/mainPage";
	}
	
	@RequestMapping("loginForm.me")
	public String memberLoginForm() {
		return "mainpage/member/memberLoginForm";
	}
	
	@RequestMapping("searchForm.me")
	public String memberSearchForm() {
		return "mainpage/member/memberSearchForm";
	}
	
	@RequestMapping("enrollForm.me")
	public String memberEnrollForm() {
		return "mainpage/member/memberEnrollForm";
	}
	
	@RequestMapping("pwdUpdateForm.me")
	public String memberPwdUpdateForm() {
		return "mainpage/member/memberPwdUpdateForm";
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String memberId) {
		
		int count = mService.idCheck(memberId);
		
		if(count > 0) {
			return "fail";
		}else {
			return "success";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("pwdCheck.me")
	public String pwdCheck(String memberPwd) {
		
		String regExp = "^(?=.*[a-z])(?=.*[0-9])(?=.*[$@$!%*?&`~'\\\"+=])[a-z[0-9]$@$!%*?&`~'\\\"+=]{8,15}$";
		
		Pattern pSymbol = Pattern.compile(regExp);
		Matcher mSymbol = pSymbol.matcher(memberPwd);
		
		if(mSymbol.find()) {
			return "true";
		}else {
			return "false";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("nicknameCheck.me")
	public String nicknameCheck(String nickname) {
		
		int count = mService.nicknameCheck(nickname);
		
		if(count > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	/*
	@ResponseBody
	@RequestMapping(value="sendSMS.me")
	public String sendSMS(String phoneNumber) {
		
		Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<6; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
	        
	        System.out.println("수신자 번호 : " + phoneNumber);
	        System.out.println("인증번호 : " + numStr);
	       
	        String api_key = "NCSDDMHFZCHOCFLE";
	        String api_secret = "P7GRQDVKXWOBMNYIDFODEA8WIKDEHXCQ";
	        Coolsms coolsms = new Coolsms(api_key, api_secret);

	       
	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", phoneNumber);    // 수신전화번호
	        params.put("from", "01030171804");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	        params.put("type", "SMS");
	        params.put("text", "휴대폰인증 테스트 메시지 : 인증번호는" + "["+numStr+"]" + "입니다.");

	        JSONObject result = coolsms.send(params); // 보내기&전송결과받기 
	        
	        return numStr;
		
	}
	*/
	
	
	@RequestMapping("idSearch.me")
	public void idSearch(Member m, HttpSession session, HttpServletResponse response) throws IOException {
		
		String result = mService.idSearch(m);
		String str ="";
		if(result != null) {
			
			str =  "회원님의 아이디는 " + result + " 입니다.";
			
		}else {
			str = "fail";
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		
	}
	
	@RequestMapping("pwdSearch.me")
	public String pwdSearch(Member m, HttpSession session, Model model) {
		
		String memberNo = mService.pwdSearch(m);
		
		if(memberNo == null) {
			session.setAttribute("searchAlert", "비밀번호를 찾을 수 없습니다.");
			return "mainpage/member/memberSearchForm";
		}else {
			model.addAttribute("memberNo", Integer.parseInt(memberNo));
			return "mainpage/member/memberPwdUpdateForm";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("pwdUpdate.me")
	public String pwdUpdate(Member m, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		
		m.setMemberPwd(encPwd);
		
		int result = mService.pwdUpdate(m);
		
		if(result > 0) {
			
			return "성공적으로 비밀번호가 변경되었습니다.";
			
		}else {
			
			return "fail";
			
		}
		
	}

	@RequestMapping("login.me")
	public String loginMember(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Member m, HttpSession session, Model model) {
		
		Member loginUser = mService.loginMember(m);
		ArrayList<Member> list = mService.selectMemberList();
		
		int mno = loginUser.getMemberNo();
		
		Voca v = vService.randomList(mno);
		
		// friend session 넣기
		int friendListCount = fService.selectFriendListCount(loginUser.getMemberNo());
		PageInfo pi2 = Pagination.getPageInfo(friendListCount, currentPage, 3, 5);
		ArrayList<Friend> friendList = fService.selectFriendList(loginUser.getMemberNo(), pi2);
		Memo memoWidget = meService.selectMemoWidget(loginUser.getMemberNo());
		
		// request friendList
		ArrayList<Friend> requestFriend = fService.requestFriend(loginUser.getMemberNo());
		
		if(loginUser != null /*&& bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())*/) {
			
			if(loginUser.getMemberNo() != 1) {
				
				loginUser.setDiaryMemberNo(loginUser.getMemberNo());
				
				// 위젯관리, 메뉴관리, 테마관리 객체
				session.setAttribute("ca", caService.ControlAllMain(loginUser.getDiaryMemberNo()+""));
				
				// 시간표 객체리스트
				ArrayList<Timetable> tlist = tService.timetableList(loginUser.getDiaryMemberNo());
				
				// 시간표 객체리스트에 오늘날짜 추가하는 조건문/반복문
				if(!tlist.isEmpty()) {
					for(Timetable t : tlist) {
						switch(today.get(Calendar.DAY_OF_WEEK)) {
							case 1 : t.setTimetableToDay("일요일"); break;
							case 2 : t.setTimetableToDay("월요일"); break;
							case 3 : t.setTimetableToDay("화요일"); break;
							case 4 : t.setTimetableToDay("수요일"); break;
							case 5 : t.setTimetableToDay("목요일"); break;
							case 6 : t.setTimetableToDay("금요일"); break;
							case 7 : t.setTimetableToDay("토요일"); break;
						}
					}
				}
				// 디데이 객체리스트 세션에 보관
				session.setAttribute("dlist", dService.ddayMain(loginUser.getDiaryMemberNo()+""));
				// 시간표 객체리스트 세션에 보관
				session.setAttribute("timetableList", tlist);
				// diaryMemberNo 추가한 로그인유저 객체 세션에 보관
				session.setAttribute("loginUser", loginUser);
				
				// friend, memoWidget
				session.setAttribute("pi2",pi2);
				session.setAttribute("friendList",friendList);
				session.setAttribute("requestFriend", requestFriend);
				session.setAttribute("memoWidget", memoWidget);
				
				session.setAttribute("voca", v);
				
				return "redirect:/";
				
			}else {
				
				session.setAttribute("loginUser", loginUser);
				return "redirect:adminMember.me";
				
			}
			
		}else {
			
			session.setAttribute("alertMsg", "로그인실패");
			return "mainpage/member/memberLoginForm";
			
		}
		
	}
	
	
	@RequestMapping("enroll.me")
	public String insertMember(Member m, HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		
		m.setMemberPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg"  , "성공적으로 회원가입되었습니다.");
			return "mainpage/member/memberLoginForm";
		}else {
			session.setAttribute("alertMsg"  , "회원가입에 실패했습니다.");
			return "mainpage/member/memberEnrollForm";
		}
	}
	
	
	@RequestMapping("infoList.my")
	public String infoList(HttpSession session, Model model) {
		
		return "mypage/infoListView";
	}
	
	@ResponseBody
	@RequestMapping(value="sendSMS2.my")
	public String sendSMS2(String phoneNumber) {
		
		Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<6; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
	        
	        System.out.println("수신자 번호 : " + phoneNumber);
	        System.out.println("인증번호 : " + numStr);
	       
	        String api_key = "NCSROFZSPCGLDC64";
	        String api_secret = "77MADTGXDEI4A46TGGYGBJOQSWK0WX4J";
	        Coolsms coolsms = new Coolsms(api_key, api_secret);

	       
	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", phoneNumber);    // 수신전화번호
	        params.put("from", "01077517347");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	        params.put("type", "SMS");
	        params.put("text", "휴대폰인증 테스트 메시지 : 인증번호는" + "["+numStr+"]" + "입니다.");

	        JSONObject result = coolsms.send(params); // 보내기&전송결과받기 
	        
	        return numStr;
		
	}
	
	@RequestMapping("infoUpdateForm.my")
	public String infoUpdateForm(Member m,HttpSession session) {
		
		return "mypage/infoUpdateForm";
	}
	
	
	
	@RequestMapping("infoUpdate.my")
	public String updateMember(String memberPwd, Member m, HttpSession session, Model model, MultipartFile upfile) {
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(bcryptPasswordEncoder.matches(memberPwd, loginUser.getMemberPwd())) {
		
		
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			if(m.getProfile() != null) {
				
				String removeFilePath = session.getServletContext().getRealPath(m.getProfile());//그파일의 물리적경로
				new File(removeFilePath).delete();
			}
			
			String changeName = saveFile(upfile, session); //
			m.setProfile("resources/profiles/" + changeName);
		}
		
		
		
		int result = mService.infoUpdate(m);
		
		if(result > 0) { 
			
			((Member)session.getAttribute("loginUser")).setNickname(m.getNickname());
			((Member)session.getAttribute("loginUser")).setEmail(m.getEmail());
			((Member)session.getAttribute("loginUser")).setPhone(m.getPhone());
			((Member)session.getAttribute("loginUser")).setProfile(m.getProfile());
			session.setAttribute("alertMsg", "성공적으로 정보 변경되었습니다.");
			return "redirect:infoUpdateForm.my";
		}else {
			
			model.addAttribute("errorMsg", "정보 변경 실패");
			return "common/errorPage";
		} 
		
	  }else {
		  model.addAttribute("errorMsg", "비밀번호가 틀렸습니다.");
			return "common/errorPage";
	  }
	}
	//업로드용 
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		String savePath = session.getServletContext().getRealPath("/resources/profiles/"); //물리적인 경로를 알아야 폴더에 업로드가능
		
		//원본면 aa.jpg-> 실제업로드("202022038338483434.jpg") 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));//.부터 끝
		
		String changeName = currentTime + ranNum + ext; //서버에 업로드될 이름
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	@ResponseBody
	@RequestMapping("nameCheck2.my")
	public String nicknameCheck2(String nickname) {
		
		int count = mService.nicknameCheck2(nickname);
		
		if(count > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	

	 @RequestMapping("introList.my")
	 public String introList(HttpSession session, Model model) {
		 
		 return "mypage/introListView";
	 }
	 
	 @RequestMapping("introListMn.my")
	 public String introListMn(HttpSession session, Model model) {
		 
		 return "mypage/introListViewManagement";
	 }
	 
	 
	 
	 @RequestMapping("introEnrollForm.my")
		public String enrollForm() {
		 
		 return "mypage/introEnrollForm";
		}
	 
	 @RequestMapping("introInsert.my")
	 public String introInsert(Member m, HttpSession session, Model model) {
		 
		 System.out.println(m.getIntroductionTitle());
		 System.out.println(m.getIntroductionContent());
		 
		 int result = mService.introInsert(m);
			
		 
			if(result > 0) { 
				((Member)session.getAttribute("loginUser")).setIntroductionTitle(m.getIntroductionTitle());
				((Member)session.getAttribute("loginUser")).setIntroductionContent(m.getIntroductionContent());
				
				//session.setAttribute("loginUser", mService.loginMember(m));
				session.setAttribute("alertMsg", "성공적으로 소개글이 저장되었습니다.");
				return "redirect:introListMn.my";
				
				
			}else {
				
				model.addAttribute("errorMsg", "소개글 저장 실패!");
				return "common/errorPage";
			}
	
	 }
	 
	 @RequestMapping("updatePwdForm.my")
	 	public String updatePwdForm(HttpSession session) {
		 return "mypage/pwdUpdateForm";
	 }
	 
	 @RequestMapping("updatePwd.my")
	 	public String updatePwd(String original, Member m, HttpSession session) {
		 
		
		 Member loginUser = mService.loginMember(m);
		 
		 if(loginUser != null && bcryptPasswordEncoder.matches(original, loginUser.getMemberPwd())) { 
		 
			 String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
				
				
				m.setMemberPwd(encPwd);
				
				int result = mService.updatePwd(m);
				
				if(result > 0) {
					
					((Member)session.getAttribute("loginUser")).setMemberPwd(m.getMemberPwd());
					session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
					return "redirect:updatePwdForm.my";
					
				}else {
					
					session.setAttribute("errorMsg", "비밀번호 변경에 실패했습니다.");
					return "common/errorPage";
					
				}
			 
		 }else {
			 
			 session.setAttribute("errorMsg", "비밀번호 변경에 실패했습니다.");
			return "common/errorPage";
			 
		 }
		  
		 /*
			String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
			
			
			m.setMemberPwd(encPwd);
			
			int result = mService.updatePwd(m);
			
			if(result > 0) {
				
				session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
				return "redirect:updatePwdForm.my";
				
			}else {
				
				session.setAttribute("errorMsg", "비밀번호 변경에 실패했습니다.");
				return "common/errorPage";
				
			}*/
		
	 }
	 
	/* 
	 @GetMapping("updatePwdForm.my")
	 public ModelAndView pwChange() {
	 	return new ModelAndView ("mypage/pwdUpdateForm");
	 }
	 
	//비밀번호 확인 처리 요청
	 @PostMapping("/checkPw")
	 public String checkPw(@RequestBody String memberPwd, HttpSession session) throws Exception {
	 	
	 	loginUser.info("비밀번호 확인 요청 발생");
	 	
	 	String result = null;
	 	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	 	
	 	Member loginUser = (Member)session.getAttribute("loginUser");
	 	loginUser.info("DB 회원의 비밀번호 : " + loginUser.getMemberPwd());
	 	loginUser.info("폼에서 받아온 비밀번호 : " + memberPwd);
	 	
	 	if(bcryptPasswordEncoder.matches(pw, loginUser.getMemberPwd())) {
	 		result = "pwConfirmOK";
	 	} else {
	 		result = "pwConfirmNO";
	 	}
	 	
	 	return result;
	 	
	 }
	 */
	 @RequestMapping("pwdCheck2.my")
	 public String pwdCheck2(String memberPwd) {
		 
		 String regExp = "^(?=.*[a-z])(?=.*[0-9])(?=.*[$@$!%*?&`~'\\\"+=])[a-z[0-9]$@$!%*?&`~'\\\"+=]{8,15}$";
		 
		 Pattern pSymbol = Pattern.compile(regExp);
		 Matcher mSymbol = pSymbol.matcher(memberPwd);
		 
		 if(mSymbol.find()) {
			 return "true";
		 }else {
			return "false";
			}
		 
	 }
	 
	 
	 @RequestMapping("deleteForm.my")
		public String deleteForm(HttpSession session) {
		 
			return "mypage/deleteForm";
		}
	 
	 
	 @RequestMapping("deleteMember.my")
	 public String deleteMember(String memberPwd, HttpSession session, Model model) {
		 
			Member loginUser = (Member)session.getAttribute("loginUser");
			
			if(bcryptPasswordEncoder.matches(memberPwd, loginUser.getMemberPwd())) {
				
				int result = mService.deleteMember(loginUser.getMemberId()); 
				
				
				if(result > 0) { 
					
					session.removeAttribute("loginUser");
					session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다.");
					
					return"redirect:/";
					
					
				}else {
					
					model.addAttribute("errorMsg", "회원탈퇴를 실패했습니다.");
					return "common/errorPage";
					
				}
				
			}else {
				// 비밀번호 틀림!!
				session.setAttribute("alertMsg", "비밀번호가 틀렸습니다.");
				return "redirect:deleteForm.my"; 
			
			}
		
		}
}
	 
	 
