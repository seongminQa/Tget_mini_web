package com.mycompany.Tget_mini_web.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	/*ProductDto productDto;
	MemberDto memberDto;*/
	
	// 상품에 대한 정보
	private String pkind;
	private String ptitle;
	private String pplace;
	private int pprice;
	private int resultprice; // 상품의 가격 * 수량을 계산하여 jsp에 사용할 용도의 필드
	//private byte[] pcontent;
	private byte[] pposter;
   
	/*@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date pdatestart;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date pdateend;*/
   
	private String pseatgrade;
	private int pseatscnt;
	private String paddress;
	private String pgenre;
   
	private MultipartFile pcontentattach;
	private MultipartFile pposterattach;
   
	private String pcontentattachtype;
	private String pposterattachtype;
	
	// 유저에 대한 정보
	private String mname;
	private String mnickname;
	private String mprefergenre;
	
}
