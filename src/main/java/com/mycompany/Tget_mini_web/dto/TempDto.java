package com.mycompany.Tget_mini_web.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
	장바구니에서 체크한 상품에 대한 정보와 
	결제 버튼을 눌렀을 때, orderInfo 데이터테이블에 저장하기 위해 사용하는 임시 클래스
*/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TempDto {
	private String ono;
	private String mid;
	private int pno;
	private int oprice;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date odate;
	private int oamount;
	private int status;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date completdate;
	
	private String pkind;
	private String ptitle;

}
