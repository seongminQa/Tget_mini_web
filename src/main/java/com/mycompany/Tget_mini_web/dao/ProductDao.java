package com.mycompany.Tget_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.Tget_mini_web.dto.PagerDto;
import com.mycompany.Tget_mini_web.dto.ProductDto;

@Mapper
public interface ProductDao {
	public int insertProduct(ProductDto productDto);
	public List<ProductDto> selectByPage(PagerDto pager);
	public int count();
	public int updateProduct(ProductDto productDto);
	public int deleteByPno(int pno);
	public ProductDto selectByPno(int pno);
	public ProductDto selectAttachProductData(int pno);
	// 상품 리스트 페이지 작성 중
	public List<ProductDto> selectByProductList();
	public ProductDto selectByProductPno(int pno);
	public ProductDto selectAttachProductContent(int pno);

}
