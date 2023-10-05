package com.spring.shop.controller;

import java.text.DecimalFormat;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.shop.service.ShopService;
import com.spring.shop.vo.CartVo;
import com.spring.shop.vo.OrderDetailVo;
import com.spring.shop.vo.OrderInfoVo;

@RestController
@RequestMapping("/shop")
public class ShopRestController {

	@Autowired
	private ShopService shopService;

	// 장바구니 담기
	@PostMapping("/view/add-cart")
	public String addCart(CartVo cartVo, HttpSession session) {
		String memberid = (String) session.getAttribute("memberid");
		String result = "";
		if (memberid == null) {
			result = "fail";
		} else {
			cartVo.setMemberid(memberid);
			shopService.addCart(cartVo);
			result = "success";
		}
		return result;
	}

	// 장바구니 삭제
	@PostMapping("/cart-list/delete")
	public void deleteCart(@RequestParam("memberid") String memberid, @RequestParam("cartNum") int cartNum) {
		shopService.deleteCart(memberid, cartNum);
	}

	// 장바구니 선택 삭제
	@PostMapping("/cart-list/select-delete")
	public void deleteSelectCart(@RequestParam("memberid") String memberid, @RequestParam("cartNum") int cartNum) {
		shopService.deleteCart(memberid, cartNum);
	}

	// 전체 결제 가격 계산
	@PostMapping("/calc/all")
	public int calcTotalPayment(@RequestParam("memberid") String memberid) {
		int totalPaymentPrice = shopService.calcTotalPayment(memberid);
		return totalPaymentPrice;
	}

	// 결제 가격 계산
	@PostMapping("/calc")
	public int calcPayment(@RequestParam("memberid") String memberid, @RequestParam("cartNum") int cartNum) {

		int paymentPrice = shopService.calcPayment(memberid, cartNum);
		return paymentPrice;
	}

	// 결제
	@PostMapping("/pay")
	public String pay(OrderInfoVo orderInfoVo, OrderDetailVo orderDetailVo, @RequestParam(value = "cartNums") String[] cartNums, HttpSession session) {
		
		String memberid = (String)session.getAttribute("memberid");
		String orderid = shopService.getUUID();
		
		// UUID 저장
		orderInfoVo.setOrderid(orderid);
		// 주문정보 저장
		shopService.orderSave(orderInfoVo);

		// 주문상세 저장
		orderDetailVo.setOrderid(orderid);
		shopService.orderDetailSave(orderDetailVo, memberid, cartNums);
		
		// 주문완료된 장바구니 삭제
		shopService.deleteOrderedCart(cartNums);
		
		return "response";
	}
}
