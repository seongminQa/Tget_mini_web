package com.mycompany.Tget_mini_web.dto;

import java.sql.Blob;
import java.util.Date;

import lombok.Data;

@Data
public class MemberDto {
	private String mid;
	private String mpassword;
	private String mname;
	private String mssn;
	private String memail;
	private String maddress;
	private String mphone;
	private String mnickname;
	private Date msince;
	private String mpreferGenre;
	private String mgrade;
	private Blob mprofileImg;
	private int mtotalPay;
}
