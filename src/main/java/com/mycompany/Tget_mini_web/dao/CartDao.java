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

   // 로그인한 회원이 장바구니에 넣은 상품의 정보 가져오기
   List<CartDto> selectCartItem(String mid);
   
   // 해당 장바구니 번호를 이용하여 삭제
   public void deleteCartItem(int cno);

   public void updateCartItem(CartDto cartDto);

   CartDto selectByCno(int cno); // 주문정보를 보기 위해 장바구니의 cno로 정보를 가져온다

}