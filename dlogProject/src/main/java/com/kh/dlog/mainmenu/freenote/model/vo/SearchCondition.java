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
	
	private String writer;
	private String title;
	private String topic;
	private String sort;

}
