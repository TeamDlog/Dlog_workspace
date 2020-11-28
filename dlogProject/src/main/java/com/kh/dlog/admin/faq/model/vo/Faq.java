package com.kh.dlog.admin.faq.model.vo;




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
public class Faq {
		private int faqNo;
		private String faqTitle;
		private String faqContent;
		private int faqCount;
		private String faqDate;
		private String faqStatus;
		
}
