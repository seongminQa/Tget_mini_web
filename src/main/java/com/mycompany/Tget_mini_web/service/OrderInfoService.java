package com.mycompany.Tget_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.Tget_mini_web.dao.OrderInfoDao;
import com.mycompany.Tget_mini_web.dto.CartDto;
import com.mycompany.Tget_mini_web.dto.OrderInfoDto;
import com.mycompany.Tget_mini_web.dto.PagerDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderInfoService {
   @Resource // @Autowired 받아도 됨.
   private OrderInfoDao orderInfoDao; // Dao 주입받기
   
   // 장바구니에 아이템 추가하기
   public void addOrderInfo(OrderInfoDto orderInfoDto) {
	   orderInfoDao.insertOrderInfo(orderInfoDto);
   }

   
   /*public OrderInfoDto getCartList(String mid) {
      List<CartDto> cartList = cartDao.selectByPage(pager);
      return cartList;
   }*/

}