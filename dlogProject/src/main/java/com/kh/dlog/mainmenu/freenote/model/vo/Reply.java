package com.kh.dlog.mainmenu.freenote.model.vo;

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
public class Reply {
	
	private int replyNo;
	private String replyContent;
	private int replyLike;
	private String createDate;
	private String modifyDate;
	private String status;
	private int refFno;
	private String replyWriter;
	private int refRno;
	private int replyLevel;
	private int likeStatus;
	private String profile;

}
