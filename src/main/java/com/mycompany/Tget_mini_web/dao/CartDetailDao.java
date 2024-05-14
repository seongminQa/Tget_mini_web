package com.mycompany.Tget_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.Tget_mini_web.dto.CartDetailDto;

@Mapper
public interface CartDetailDao {
	List<CartDetailDto> getCartDetailList();

	public void insertCartDetail(CartDetailDto cartDetailDto);
}
