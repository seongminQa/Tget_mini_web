package com.mycompany.Tget_mini_web.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDetail {
	private String ono;
	private Date dday;
	private String ostatus;
}
