package com.kh.dlog.notification.model.vo;

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
public class Notification {
	private int notificationNo;
	private String notificationContent;
	private int notificationCategory;
	private String createDate;
	private String status;
	private int memberNo;

}
