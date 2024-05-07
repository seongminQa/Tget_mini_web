package com.mycompany.Tget_mini_web.dto;

import java.sql.Blob;
import java.util.Date;

import lombok.Data;

@Data
public class ProductDto {
	private int pno;
	private String pkind;
	private String ptitle;
	private String pplace;
	private int pprice;
	private Blob pcontent;
	private Blob pposter;
	private Blob pactors;
	private Date pdatestart;
	private Date pdateend;
	private String pseatgrade;
	private int pseatcnt;
	private String paddress;
	private String pgenre;
}
