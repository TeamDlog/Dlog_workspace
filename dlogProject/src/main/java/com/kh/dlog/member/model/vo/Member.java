package com.kh.dlog.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Member {

	private int memberNo;
	private String memberName;
	private String memberId;
	private String memberPwd;
	private String email;
	private String phone;
	private String nickname;
	private String profile;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	private String introductionTitle;
	private String introductionContent;
	private int diaryMemberNo;
	
}
