package com.kh.dlog.widget.timetable.model.vo;

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
public class Timetable {
	private String timetableNo;
	private String timetableWriter;
	private String timetableDay;
	private String timetableStart;
	private String timetableEnd;
	private String timetableTime;
	private String timetableTitle;
	private String timetableContent;
	private String timetableBackground;
	private String timetableColor;
	private String timetableToDay;
	private int timetableTimeCheck;
}
