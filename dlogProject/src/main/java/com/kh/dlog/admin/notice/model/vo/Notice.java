package com.kh.dlog.admin.notice.model.vo;



import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeOriginName;
	private String noticeChangeName;	
	private String noticeDate;
	private String noticeStatus;
	
}
