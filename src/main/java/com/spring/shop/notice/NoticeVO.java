package com.spring.shop.notice;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int b_num;
	private String b_title;
	private String b_writer;
	private String b_content;
	private Date b_date;
	

}
