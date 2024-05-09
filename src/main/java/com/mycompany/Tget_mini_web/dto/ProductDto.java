package com.mycompany.Tget_mini_web.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDto {
	private int pno;
	private String pkind;
	private String ptitle;
	private String pplace;
	private int pprice;
	private byte[] pcontent;
	private byte[] pposter;
	private byte[] pactors;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date pdatestart;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date pdateend;
	
	private String pseatgrade;
	private int pseatscnt;
	private String paddress;
	private String pgenre;
	
	private MultipartFile pcontentattach;
	private MultipartFile pposterattach;
	private MultipartFile pactorsattach;
	
//	private String pattachname;
	private String pcontentattachtype;
	private String pposterattachtype;
	private String pactorsattachtype;
	
}
