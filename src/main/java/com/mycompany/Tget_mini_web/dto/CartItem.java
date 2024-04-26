package com.mycompany.Tget_mini_web.dto;

import lombok.Data;

@Data
public class CartItem {
	private Product1 product;  // 객체 불러오기
	private int amount;  // 매수 양
}
