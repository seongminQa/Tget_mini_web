package com.mycompany.Tget_mini_web.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDto {
	private int bno;
	private String btitle;
	private String bcontent;
	private String mid;
	private Date bdate;
	private int bhitcount;
	
	private MultipartFile bimg;
	private byte[] bimgdata;
	
	
}
