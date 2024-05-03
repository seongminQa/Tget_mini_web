package com.mycompany.Tget_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderInfo {
	private String ono;
	private String mid;
	private int pno;
	private int oprice;
	private Date odate;
	private int oamount;
}
