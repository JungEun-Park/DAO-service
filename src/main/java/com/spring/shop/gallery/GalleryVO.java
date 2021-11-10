package com.spring.shop.gallery;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class GalleryVO {
	private int gi_no;
	private String gi_title;
	private String gi_writer;
	private String gi_content;
	private String gi_file;
	private Date gi_date;
	
}
