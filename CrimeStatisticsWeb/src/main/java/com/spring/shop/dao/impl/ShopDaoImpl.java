package com.spring.shop.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.shop.dao.ShopDao;
import com.spring.shop.vo.CartVo;
import com.spring.shop.vo.OrderDetailVo;
import com.spring.shop.vo.OrderInfoVo;
import com.spring.shop.vo.ProductVo;

@Repository("shopDao")
public class ShopDaoImpl implements ShopDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String namespace = "Shop";
	
	// 전체 호신용품 리스트
	@Override
	public List<ProductVo> allPdList() {
		return sqlSession.selectList(namespace + ".allPdList");
	}

	// 카테고리별 호신용품 리스트
	@Override
	public List<ProductVo> catePdList(int cateCode) {
		return sqlSession.selectList(namespace + ".catePdList", cateCode);
	}

	// 상품 상세조회
	@Override
	public ProductVo getView(int pdNum) {
		return sqlSession.selectOne(namespace + ".getView", pdNum);
	}

	// 장바구니 담기
	@Override
	public void addCart(CartVo cartVo) {
		sqlSession.insert(namespace + ".addCart", cartVo);
	}

	// 장바구니 리스트
	@Override
	public List<CartVo> getCartList(String memberid) {
		return sqlSession.selectList(namespace + ".getCartList", memberid);
	}

	// 장바구니 삭제
	@Override
	public void deleteCart(String memberid, int cartNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberid", memberid);
		map.put("cartNum", cartNum);
		sqlSession.delete(namespace + ".deleteCart", map);
	}

	// 장바구니 결제가격 계산
	@Override
	public int calcPayment(String memberid, int cartNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberid", memberid);
		map.put("cartNum", cartNum);
		return sqlSession.selectOne(namespace + ".calcPayment", map);
	}

	// 장바구니 전체 결제가격 계산
	@Override
	public int calcTotalPayment(String memberid) {
		return sqlSession.selectOne(namespace + ".calcTotalPayment", memberid);
	}

	// (장바구니) 단일 상품 구매시 물품 및 가격 정보
	@Override
	public CartVo getCartOne(String memberid, int cartNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberid", memberid);
		map.put("cartNum", cartNum);
		return sqlSession.selectOne(namespace + ".getCartOne", map);
	}

	// 주문정보 저장
	@Override
	public void orderSave(OrderInfoVo orderInfoVo) {
		sqlSession.insert(namespace + ".orderSave", orderInfoVo);
	}

	// 주문상세 저장
	@Override
	public void orderDetailSave(OrderDetailVo orderDetailVo, String memberid, String[] cartNums) {
		Map<String, Object> map = new HashMap<>();
		map.put("orderDetailVo", orderDetailVo);
		map.put("memberid", memberid);
		map.put("cartNums", cartNums);
		
	    sqlSession.insert(namespace + ".orderDetailSave", map);
	}
	
	// 주문완료된 장바구니 삭제
	@Override
	public void deleteOrderedCart(String[] cartNums) {
		sqlSession.delete(namespace + ".deleteOrderedCart", cartNums);
	}

	// 장바구니 번호
	@Override
	public int getCartNum(CartVo cartVo) {
		return sqlSession.selectOne(namespace + ".getCartNum", cartVo);
	}

	// 주문상세 가져오기
	@Override
	public List<OrderDetailVo> getOrderDetail(String orderid) {
		return sqlSession.selectList(namespace + ".getOrderDetail", orderid);
	}
}
