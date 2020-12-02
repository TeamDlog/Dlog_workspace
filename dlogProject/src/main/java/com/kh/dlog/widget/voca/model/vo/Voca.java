package com.kh.dlog.widget.voca.model.vo;

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
public class Voca {
	
	private int vocaNo;
	private int vocaWriter;
	private String vocaWord;
	private String vocaMean;
	private String keyword;

}
