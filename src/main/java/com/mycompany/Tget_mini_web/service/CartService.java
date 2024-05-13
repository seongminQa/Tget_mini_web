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
	
	// 카트 리스트 삭제 메소드
	public void removeMember(String cno) {
		cartDao.deleteByCno(cno);
	}

}
