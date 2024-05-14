package com.mycompany.Tget_mini_web.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.Data;

@Data
public class CartDto {
	private Integer cno;
	private String mid;
	private int pno;
	private String oseatgrade;
	private int oamount;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date odate;
}
