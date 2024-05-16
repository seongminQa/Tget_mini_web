package com.mycompany.Tget_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.Tget_mini_web.dao.ProductDao;
import com.mycompany.Tget_mini_web.dto.PagerDto;
import com.mycompany.Tget_mini_web.dto.ProductDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductService {
	@Resource // @Autowired 받아도 됨.
	private ProductDao productDao; // Dao 주입받기

	// 상품 등록
	public void productSignUp(ProductDto productDto) {
		// 비즈니스 로직 처리
		int rowNum = productDao.insertProduct(productDto);
		log.info("rowNum: " + rowNum + ", pno: " + productDto.getPno());
	}
	
	// 페이지 당 상품 리스트
	public List<ProductDto> getProductList(PagerDto pager) {
		List<ProductDto> productList = productDao.selectByPage(pager);
		return productList;
	}
	
	// 상품 리스트
	public List<ProductDto> getShoppingProductList() {
		List<ProductDto> productList = productDao.selectByProductList();
		return productList;
	}
	
	// pno에 맞는 상품 정보 가져오기
	public ProductDto getProductDetail(int pno) {
		ProductDto productDto = productDao.selectByProductPno(pno);
		return productDto;
	}
	
	// 리스트들의 총 행의 수를 반환하는 메소드
	public int getTotalRows() {
		int totalRows = productDao.count();
		return totalRows;
	}

	// DB에 들어있는 상품의 정보 얻어오기 (상품 객체를 pno으로 구분)
	public ProductDto getProduct(int pno) {
		ProductDto productDto = productDao.selectByPno(pno);
		return productDto;
	}
	
	// 상품 정보 수정 메소드
	public void updateProduct(ProductDto productDto) {
		int rowNum = productDao.updateProduct(productDto);
	}
	
	// 상품 삭제 메소드
	public void removeProduct(int pno) {
		int rowNum = productDao.deleteByPno(pno); // rowNum은 삭제된 행수를 얻고싶을 때 넣어주고, 필요없으면 안써도 된다.
		productDao.deleteByPno(pno);
	}
	
	// 상품의 포스터 데이터 받기
	public byte[] getAttachProductData(int pno) {
		ProductDto productDto = productDao.selectAttachProductData(pno);
		return productDto.getPposter();
	}
	public byte[] getAttachProductContent(int pno) {
		ProductDto productDto = productDao.selectAttachProductContent(pno);
		return productDto.getPcontent();
	}
}
