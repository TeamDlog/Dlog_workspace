package com.kh.dlog.mainmenu.diary.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Diary {
	private int diaryNo;
	private int diaryWriter;
	private String diaryTitle;
	private String diaryContent;
	private Date diaryDate;
	private String diaryStatus;
	
	
	
}
