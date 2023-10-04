<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="imaga/x-icon" href="/img/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>주문서 작성</title>
<style>
main {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    height: auto; /* 이렇게 하면 전체 화면 높이를 차지합니다 */
}

#content {
	border-top: 3px solid black;
	
}

.deliveryInfo {
	margin-top: 40px;
	border-bottom: 1px solid lightgray;
	padding-bottom: 40px;
}

.custom-checkbox {
    transform: scale(1.5); /* 크기 조절 */
    margin-right: 5px; /* 옆 여백 */
}

.custom-label {
	color: blue;
}

.leftArea {
	border-right: 2px solid lightgray;
}

.orderInfo {
	margin-top: 40px;
	border-bottom: 1px solid lightgray;
	padding-bottom: 40px;
}

.finalPayment {
	margin-top: 40px;
	padding-bottom: 40px;
	padding-left: 70px;
	border-bottom: 1px solid lightgray;
}

.paymentMethod {
	margin-top: 40px;
	padding-bottom: 40px;
	padding-left: 70px;
}

.orderPdInfo {
	margin-top: 40px;
	padding-bottom: 40px;
	padding-left: 70px;
	border-bottom: 1px solid lightgray;
}

.custom-button input[type="button"] {
  border: none;
  background-color: gray;
  color: white;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
}

.customBtn {
  border: none;
  background-color: #dc3545;
  color: white;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
}

.buttonContainer {
    display: flex;
    justify-content: start;
    flex-wrap: wrap;
}

.buttonArea {
    border: 1px solid lightgray;
    cursor: pointer;
}

#creditCard {
	padding-left: 15px;
	line-height: 50px;
	width: 200px;
	height: 50px;
}

#samsungPay {
	padding-left: 15px;
	line-height: 50px;
	width: 200px;
	height: 50px;
}

#kakaoPay {
	padding-left: 15px;
	line-height: 50px;
	width: 200px;
	height: 50px;
}

#tossPay {
	padding-left: 15px;
	line-height: 50px;
	width: 200px;
	height: 50px;
}
.btn-primary {
    background-color: transparent !important;
    border-color: gray !important;
    color: gray !important;
    margin-top: 25px;
    margin-right: 10px;
    margin-left: 70px;
}

#primary {
	padding: 10px 150px;
}

.btn-primary:hover {
	background-color: #f0f0f0 !important;
}

#payment {
	margin-left: 70px;
	margin-top: 10px;
	padding: 10px 134px;
}
</style>
</head>
<body>
	<header><%@ include file="../template/header.jsp"%></header>
	
	<main style="margin-top: 40px; margin-bottom: 100px;">
		<div id="header" style="width: 65%; margin-bottom: 40px; display: flex; justify-content: space-between; align-items: center;">
		    <h1>주문/결제</h1>
		    <div style="display: flex; justify-content: flex-end; align-items: center;">
		        <span style="text-align: center; display: block;">
		            <div>
		                <img src="/img/before-shopping-cart.png" style="width: 50px; height: 50px; display: block; margin: 0 auto;">
		            </div>
		            <div style="color: gray;">장바구니</div>
		        </span>
		        <hr style="width: 50px; height: 2px; color: gray; background-color: gray; border: none; margin: 0; margin-bottom: 25px;">
		        <span style="text-align: center; display: block;">
		            <div>
		                <img src="/img/credit-card.png" style="width: 50px; height: 50px; display: block; margin: 0 auto;">
		            </div>
		            <div style="color: black;">주문/결제</div>
		        </span>
		        <hr style="width: 50px; height: 2px; color: gray; background-color: gray; border: none; margin: 0; margin-bottom: 25px;">
		        <span style="text-align: center; display: block;">
		            <div>
		                <img src="/img/before-check.png" style="width: 50px; height: 50px; display: block; margin: 0 auto;">
		            </div>
		            <div style="color: gray;">주문완료</div>
		        </span>
		    </div>
		</div>
		<div id="content" style="width: 65%; display: flex; justify-content: space-between;">
			<div class="leftArea" style="flex: 1;">
				<div class="orderInfo">
					<div>
			        	<h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">주문 정보</h4>
			        </div>
			        <div>
			        	<input id="order_name" type="text"  name="name" placeholder="ex) 홍길동" style="width: 270px; height: 40px; padding-left: 15px;">
			        	<input id="order_tel" type="text"  name="tel"  placeholder="ex) 01012345678" style="width: 270px; height: 40px; padding-left: 15px;"/>
			        </div>
			        <div style="margin-top: 10px;">
			        	<input id="order_email" type="email" name="email" placeholder="ex) abcd@naver.com" style="width: 546px; height: 40px; padding-left: 15px;" />
			        </div>
				</div>
				<div class="deliveryInfo">
					<div style="display: flex; justify-content: space-between;">
			        	<h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">배송지 정보</h4>
			        	<div style="margin-right: 70px;">
			        		<input type="checkbox" class="custom-checkbox" name="sameAsBilling" id="sameAsBilling">
					        <label for="sameAsBilling" class="custom-label">주문자 정보와 일치</label>
			        	</div>
			        </div>
			        <div>
			        	<input type="text"  id="name" name="name" placeholder="ex) 홍길동" style="width: 270px; height: 40px; padding-left: 15px;">
			        	<input type="text"  id="tel" name="tel"  placeholder="ex) 01012345678" style="width: 270px; height: 40px; padding-left: 15px;"/>
			        </div>
			        <div style="margin-top: 20px; margin-bottom: 10px; font-size: 12px;">
			        	주소
			        </div>
			        <div class="custom-button">
			        	<input type="text"  id="address_postcode" name="address_postcode" placeholder="우편번호" style="width: 270px; height: 40px; padding-left: 15px;" disabled />
			        	<input type="button" value="주소검색" onclick="exePost()" style="width: 100px; height: 40px;" />
			        </div>
			        <div style="margin-top: 10px;">
			        	<input type="text" id="address_primary" name="address_primary" style="width: 546px; height: 40px; padding-left: 15px;" placeholder="기본주소" disabled />
			        </div>
			        <div style="margin-top: 10px;">
			        	<input type="text" id="address_detail" name="address_detail" style="width: 546px; height: 40px; padding-left: 15px;" autocomplete="off" placeholder="상세 주소(선택 사항)" />
			        </div>
			        <div style="margin-top: 20px; margin-bottom: 10px; font-size: 12px;">
			        	이메일
			        </div>
			        <div>
			        	<input type="email" id="email" name="email" style="width: 546px; height: 40px; padding-left: 15px;" placeholder="ex) abcd@naver.com" />
			        </div>
				</div>
				<div class="coupon_point">
				    <div style="margin-top: 40px;">
				        <h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">쿠폰/포인트</h4>
				    </div>
				    <div style="margin-top: 20px; margin-bottom: 10px; font-size: 14px;">
				        쿠폰
				    </div>
				    <div>
				        <input type="text" name="couponCode" value="0" style="width:430px; height: 40px; padding-left: 15px;" />
				        <button class="customBtn" style="width: 100px; height: 40px; margin-left: 10px;">쿠폰적용</button>
				    </div>
				    <div style="margin-top: 20px; margin-bottom: 10px; font-size: 14px;">
				        쿠폰 번호
				    </div>
				    <div>
				        <input type="text" name="verificationCode" placeholder="쿠폰 번호 입력" style="width:430px; height: 40px; padding-left: 15px;" />
				        <button class="customBtn" style="width: 100px; height: 40px; margin-left: 10px;">번호확인</button>
				    </div>
				    <div style="margin-top: 20px; margin-bottom: 10px; font-size: 14px;">
				        포인트
				    </div>
				    <div>
				        <input type="text" name="pointUsage" value="0" style="width:430px; height: 40px; padding-left: 15px;" />
				        <button class="customBtn" style="width: 100px; height: 40px; margin-left: 10px;">전액사용</button>
				    </div>
				    <div style="margin-top: 20px;">
				        보유 포인트 : 0원
				    </div>
				</div>
		    </div>
		    <div class="rightArea" style="flex: 1;">
		        <div class="orderPdInfo">
				    <div>
				        <h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">주문 상품 정보</h4>
				    </div>
				    <div style="display: flex;">
				        <div style="flex: 0.5;">
				            <img src="${pdThumbImg}" style="width: 150px; height: 150px;">
				        </div>
				        <div style="flex: 1.5; margin-top: 30px; margin-left: 20px;">
				            <div id="pdName" style="font-size: 25px;">${pdName}</div>
				            <div style="margin-top: 5px;">
				            	<span>수량</span>
				            	<span id="pdCnt" style="margin-left: 20px;">${cartStock}</span>개
				            </div>
				            <div id="orderPay" style="font-weight: bold; margin-top: 5px;">${pdPrice}원</div>
				            <div id="totalCountStock" style="margin-top: 5px;">그 외 <span style="font-weight: bold;">${totalCountStock}</span>개 추가 주문</div>
				        </div>
				    </div>
				</div>
				<div class="finalPayment">
					<div>
				        <h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">최종 결제 금액</h4>
				    </div>
				    <div style="display: flex; justify-content: space-between; margin-right: 250px;">
				    	<span style="color: gray;">상품가격</span>
				    	<span id="totalPrice">${finalPaymentPrice}원</span>
				    </div>
				    <div style="display: flex; justify-content: space-between; margin-top: 5px; margin-right: 250px;">
				    	<span style="color: gray;">쿠폰 할인</span>
				    	<span>0원</span>
				    </div>
				    <div style="display: flex; justify-content: space-between; margin-top: 5px; margin-right: 250px;">
				    	<span style="color: gray;">포인트 사용</span>
				    	<span>0원</span>
				    </div>
				    <div style="display: flex; justify-content: space-between; margin-top: 5px; margin-right: 250px; border-bottom: 1px solid lightgray; padding-bottom: 20px;">
				    	<span style="color: gray;">배송비</span>
				    	<span>0원</span>
				    </div>
				    <div style="display: flex; justify-content: space-between; margin-top: 15px; margin-right: 250px;">
				    	<span style="font-size: 20px;">총 결제금액</span>
				    	<span id="totalPay" style="color: #dc3545; font-size: 20px; font-weight: bold;">${finalPaymentPrice}원</span>
				    </div>
				    <div style="margin-right: 250px; margin-top: 10px;">
				    	<span style="color: #dc3545; font-size: 20px;">2500 </span>포인트 적립예정
				    </div>
				</div>
				<div class="paymentMethod">
					<div>
				        <h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">결제 수단</h4>
				    </div>
				    <div class="buttonContainer">
				        <div class="buttonArea" id="creditCard">
						    <img src="/img/card.png" style="margin-bottom: 5px; width: 35px; height: 35px; display: inline-block;">
						    <span style="display: inline-block; margin-left: 10px;">신용카드</span>
						</div>
						<div class="buttonArea" id="kakaoPay">
						    <img src="/img/kakao_pay.png" style="height: 30px; display: inline-block; margin-bottom: 5px;">
						    <span style="display: inline-block; margin-left: 10px; margin-bottom: 5px;">카카오페이</span>
						</div>
				    </div>
				    <div class="buttonContainer">
				    	<div class="buttonArea" id="samsungPay">
						    <img src="/img/Samsung_Pay_icon.svg" style="margin-bottom: 5px; width: 35px; height: 35px; display: inline-block;">
						    <span style="display: inline-block; margin-left: 10px;">삼성페이</span>
						</div>
						<div class="buttonArea" id="tossPay">
						    <img src="/img/toss_pay.png" style=" height: 30px; display: inline-block; margin-bottom: 5px;">
						    <span style="display: inline-block; margin-left: 10px; margin-bottom: 5px;">토스페이</span>
						</div>
				    </div>
				</div>
				<div style="padding-left: 70px;">
					<input type="checkbox" id="agreeCheckbox" style="transform: scale(1.3);">
				    <label for="agreeCheckbox" style="font-size: 17px; margin-left: 5px;">
				        구매조건 확인 및 결제진행에 동의
				    </label>
				</div>
				<div>
					<button type="button" id="primary" class="btn btn-primary">이전</button>
				</div>
				<div>
					<button type="button" id="payment" class="btn btn-danger">결제하기</button>
				</div>
		    </div>
		</div>
	</main>
</body>
</html>