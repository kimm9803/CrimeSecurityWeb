package com.spring.shop.vo;

public class OrderDetailVo {

	private int detailid;
	private String orderid;
	private int pdNum;
	private int cartStock;
	private int totalPrice;
	
	public int getDetailid() {
		return detailid;
	}
	public void setDetailid(int detailid) {
		this.detailid = detailid;
	}
	
	public int getPdNum() {
		return pdNum;
	}
	public void setPdNum(int pdNum) {
		this.pdNum = pdNum;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
