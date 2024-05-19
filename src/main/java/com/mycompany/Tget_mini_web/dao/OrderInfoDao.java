package com.mycompany.Tget_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.Tget_mini_web.dto.OrderInfoDto;

@Mapper
public interface OrderInfoDao {

	void insertOrderInfo(OrderInfoDto orderInfoDto);

}
