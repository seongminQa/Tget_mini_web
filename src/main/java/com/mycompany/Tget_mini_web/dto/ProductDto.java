package com.mycompany.Tget_mini_web.dto;

import java.util.Date;

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
	private Date pdatestart;
	private Date pdateend;
	private String pseatgrade;
	private int pseatcnt;
	private String paddress;
	private String pgenre;
	
	private MultipartFile pcontentattach;
	private MultipartFile pposterattach;
	private MultipartFile pactorsattach;
}
