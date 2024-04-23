package com.mycompany.Tget_mini_web.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private int pno; // 연극 or 뮤지컬의 고유 번호
	private String pkind; // 연극 or 뮤지컬 분류
	private String pimg; // 연극의 포스터 이미지
	private String ptitle; // 연극의 제목
	private String pgenre; // 연극의 장르
	private String pplace; // 연극 공연 장소
	/*@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date pperiod; // 연극 공연 기간 */
	private String pperiod;
	private int pprice; // 연극의 가격
//	private String[] actors; // 연극 배우들
//	private int pseats;  // 좌석수
//  private int ptotal_amount;  // 연극의 총 판매량	
	
	// 회원관리는 고민중입니다.
}
