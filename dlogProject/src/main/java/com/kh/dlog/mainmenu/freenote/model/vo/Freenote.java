package com.kh.dlog.mainmenu.freenote.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Freenote {
	
	private int freenoteNo;
	private String freenoteTitle;
	private String freenoteContent;
	private String freenoteCategory;
	private String freenoteTopic;
	private String freenotePrivacy;
	private String freenotePrivacyComm;
	private String freenoteCommentYN;
	private int freenoteCount;
	private int freenoteLike;
	private String createDate;
	private String modifyDate;
	private String status;
	private String freenoteWriter;
	private int replyCount;
	private int likeStatus;
	private String memberId;
	private int memberNo;

}
