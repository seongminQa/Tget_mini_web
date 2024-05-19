package com.mycompany.Tget_mini_web.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrderInfoDto {
	private String ono;
	private String mid;
	private int pno;
	private int oprice;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date odate;
	private int oamount;
}
