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
public class SearchCondition {
	
	private int mno;
	private String category;
	private int boardLimit;
	private String sort;
	private String condition;
	private String keyword;

}
