package com.mycompany.Tget_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.Tget_mini_web.dao.CartDao;
import com.mycompany.Tget_mini_web.dto.CartDto;
import com.mycompany.Tget_mini_web.dto.PagerDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CartService {
   @Resource // @Autowired 받아도 됨.
   private CartDao cartDao; // Dao 주입받기
   
   // 장바구니에 아이템 추가하기
   public void addCartItem(CartDto cartDto) {
      cartDao.insertCartItem(cartDto);
   }

   // 카트 리스트 페이지 당 리스트를 보여주는 메소드
   public List<CartDto> getCartList(PagerDto pager) {
      List<CartDto> cartList = cartDao.selectByPage(pager);
      return cartList;
   }
   
   // 리스트들의 총 행의 수를 반환하는 메소드
   public int getTotalRows() {
      int totalRows = cartDao.count();
      return totalRows;
   }

   // 멤버 객체를 mid로 구분하기
   public CartDto getMember(String mid) {
      CartDto cartDto = cartDao.selectByMid(mid);
      return cartDto;
   }
   
   // 카트 리스트 정보 수정 메소드 **
   public void updateCart(CartDto cartDto) {
      int rowNum = cartDao.updateCart(cartDto);
   }

   // 현재 로그인한 mid를 확인하여 장바구니에 넣은 상품들 불러오기
   public List<CartDto> getCartItemList(String mid) {
      List<CartDto> cartList = cartDao.selectCartItem(mid);
      return cartList;
   }
   
   // 카트 리스트 삭제 메소드
   public void removeCartItem(int cno) {
      cartDao.deleteCartItem(cno);
   }

   public void updateCartItem(CartDto cartDto) {
      cartDao.updateCartItem(cartDto);
      
   }
   
   // 장바구니에서 체크된 상품의 cno에 따라 아이템의 정보를 가져온다.
   public CartDto getCartItem(int cno) {
      CartDto cartDto = cartDao.selectByCno(cno);
      return cartDto;
   }

}