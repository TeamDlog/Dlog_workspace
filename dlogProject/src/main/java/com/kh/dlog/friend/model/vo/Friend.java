package com.kh.dlog.friend.model.vo;

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
public class Friend {
	
	// field
	private int friendNo;
	private int friendOwner;
	private String friendNickname;
	private int friendAccepted;
	private String friendStatus;
	private String friendProfile;
	
}
