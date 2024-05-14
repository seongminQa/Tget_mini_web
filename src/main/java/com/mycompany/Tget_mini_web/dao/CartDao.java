package com.mycompany.Tget_mini_web.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.Tget_mini_web.dto.CartDto;
import com.mycompany.Tget_mini_web.dto.PagerDto;

@Mapper
public interface CartDao {

   List<CartDto> selectByPage(PagerDto pager);

   int count();

   public CartDto selectByMid(String mid);

   public int updateCart(CartDto cartDto);

   public void deleteByCno(String cno);

   public void insertCartItem(CartDto cartDto);

}