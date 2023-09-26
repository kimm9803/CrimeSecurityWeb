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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
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

#header {
	padding-bottom: 40px;
	border-bottom: 3px solid black;
}

.deliveryInfo {
	margin-top: 60px;
}

.custom-checkbox {
    transform: scale(1.5); /* 크기 조절 */
    margin-right: 5px; /* 옆 여백 */
}

.custom-label {
	color: blue;
}
</style>
</head>
<body>
	<header><%@ include file="../template/header.jsp"%></header>

	<main style="margin-top: 40px; margin-bottom: 100px;">
		<div id="header" style="width: 70%; margin-bottom: 40px; display: flex; justify-content: space-between; align-items: center;">
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
		<div id="content" style="width: 70%; display: flex; justify-content: space-between;">
			<div class="leftArea" style="flex: 1;">
				<div class="orderInfo">
					<div>
			        	<h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">주문 정보</h4>
			        </div>
			        <div>
			        	<input type="text"  name="name" placeholder="ex) 홍길동" style="width: 250px; height: 40px;">
			        	<input type="text"  name="tel"  placeholder="ex) 01012345678" style="width: 250px; height: 40px;"/>
			        </div>
			        <div style="margin-top: 10px;">
			        	<input type="email" name="email" placeholder="ex) abcd@naver.com" style="width: 506px; height: 40px;" />
			        </div>
				</div>
				<div class="deliveryInfo">
					<div style="display: flex; justify-content: space-between;">
			        	<h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">배송지 정보</h4>
			        	<div style="margin-right: 100px;">
			        		<input type="checkbox" class="custom-checkbox" name="sameAsBilling" id="sameAsBilling">
					        <label for="sameAsBilling" class="custom-label">주문자 정보와 일치</label>
			        	</div>
			        </div>
			        <div>
			        	<input type="text"  name="name" placeholder="ex) 홍길동" style="width: 250px; height: 40px;">
			        	<input type="text"  name="tel"  placeholder="ex) 01012345678" style="width: 250px; height: 40px;"/>
			        </div>
				</div>
		    </div>
		    <div class="rightArea" style="flex: 1;">
		        <!-- 오른쪽 영역의 내용을 이곳에 추가하세요 -->
		        <div>
		        	<h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">주문 상품 정보</h4>
		        </div>
		    </div>
		</div>
	</main>
	
	<footer><%@ include file="../template/footer.jsp"%></footer>
</body>
</html>