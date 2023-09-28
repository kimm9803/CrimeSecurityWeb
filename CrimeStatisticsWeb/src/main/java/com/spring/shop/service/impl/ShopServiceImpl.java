package com.spring.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.dao.ShopDao;
import com.spring.shop.service.ShopService;
import com.spring.shop.vo.CartVo;
import com.spring.shop.vo.ProductVo;

@Service("shopService")
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDao shopDao;
	
	// 전체 호신용품 리스트
	@Override
	public List<ProductVo> allPdList() {
		return shopDao.allPdList();
	}

	// 카테고리별 호신용품 리스트
	@Override
	public List<ProductVo> catePdList(int cateCode) {
		return shopDao.catePdList(cateCode);
	}
	
	// 상품 상세조회
	@Override
	public ProductVo getView(int pdNum) {
		return shopDao.getView(pdNum);
	}

	// 장바구니 담기
	@Override
	public void addCart(CartVo cartVo) {
		shopDao.addCart(cartVo);
	}

	// 장바구니 리스트
	@Override
	public List<CartVo> getCartList(String memberid) {
		return shopDao.getCartList(memberid);
	}

	// 장바구니 삭제
	@Override
	public void deleteCart(String memberid, int cartNum) {
		shopDao.deleteCart(memberid, cartNum);
	}

	// 장바구니 결제가격 계산
	@Override
	public int calcPayment(String memberid, int cartNum) {
		return shopDao.calcPayment(memberid, cartNum);
	}

	// 장바구니 전체 결제가격 계산
	@Override
	public int calcTotalPayment(String memberid) {
		return shopDao.calcTotalPayment(memberid);
	}

	// (장바구니) 단일 상품 구매시 물품 및 가격 정보
	@Override
	public CartVo getCartOne(String memberid, int cartNum) {
		return shopDao.getCartOne(memberid, cartNum);
	}

}
