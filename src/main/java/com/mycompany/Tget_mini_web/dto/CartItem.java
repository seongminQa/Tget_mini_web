package com.mycompany.Tget_mini_web.dto;

import com.mycompany.Tget_mini_web.dao.ProductDao;

import lombok.Data;

@Data
public class CartItem {
	private ProductDto productDto;  // 객체 불러오기
	private int amount;  // 매수 양
}
