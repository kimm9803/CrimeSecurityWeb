package com.spring.shop.service;

import java.util.List;

import com.spring.shop.vo.CartVo;
import com.spring.shop.vo.ProductVo;

public interface ShopService {

	// 전체 호신용품 
	List<ProductVo> allPdList();

	// 카테고리별 호신용품 리스트
	List<ProductVo> catePdList(int cateCode);
	
	// 상품 상세조회
	ProductVo getView(int pdNum);
	
	// 장바구니 담기
	void addCart(CartVo cartVo);
	
	// 장바구니 리스트
	List<CartVo> getCartList(String memberid);
	
	// 장바구니 삭제
	void deleteCart(String memberid, int cartNum);

	// 장바구니 결제가격 계산
	int calcPayment(String memberid, int cartNum);

	// 장바구니 전체 결제가격 계산
	int calcTotalPayment(String memberid);

	// (장바구니) 단일 상품 구매시 물품 및 가격 정보
	CartVo getCartOne(String memberid, int cartNum);
	
	// UUID 생성
	String generateMerchantUid();
}
