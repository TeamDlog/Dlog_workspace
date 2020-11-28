package com.kh.dlog.admin.report.model.vo;

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
public class Report {
		private int reportNo;
		private String reportWriter;
		private String reportPostType;
		private String reportType;
		private String reportContent;
		private String reportDate;
		private String reportLink;
		private String reportStatus;
		private int reportPostNo;
		private String reportProcess;
		private String memberId;
}
