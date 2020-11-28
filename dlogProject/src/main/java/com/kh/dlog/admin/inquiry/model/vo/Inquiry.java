package com.kh.dlog.admin.inquiry.model.vo;

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
public class Inquiry {
		private int inquiryNo;
		private int inquiryWriter;
		private String inquiryTitle;
		private String inquiryContent;
		private String inquiryType;
		private String inquiryDate;
		private String inquiryStatus;
		private String inquiryAnswer;
		private String inquiryProcess;
		private String inquiryEmail;
		private String memberId;
}
