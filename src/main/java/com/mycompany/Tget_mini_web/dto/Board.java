package com.mycompany.Tget_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	private int bno;
	private String bimg;
	private String btitle;
	private String bcontent;
	private String mid;
	private Date bdate;
	private int bhitcount;
	

}
