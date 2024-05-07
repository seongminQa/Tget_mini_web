package com.mycompany.Tget_mini_web.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDto {
	private String mid;
	private String mpassword;
	private String mname;
	private String mssn;
	private String memail;
	private String mphone;
	private String mnickname;
	private Date msince;
	private String mprefergenre;
	private String mgrade;
	private MultipartFile mprofileImg;
	private int mtotalpay;
	private String mrole;
	private int mno;
	private byte[] mprofileImgData;
	
}
