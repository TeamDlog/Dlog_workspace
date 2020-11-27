package com.kh.dlog.mainmenu.account.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor 
@AllArgsConstructor 
@Setter
@Getter
@ToString
public class Account {
		private int accountNo;
		private int accountWriter;
		private String accountStatus;
		private String accountItem;
		private String accountDetailItem;
		private String accountDivision;
		private int accountMoney;
		private String accountDataIls;
		private String accountDate;
		private String status;
}
