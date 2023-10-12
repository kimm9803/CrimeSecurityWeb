<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="imaga/x-icon" href="/img/favicon.ico">
<link href="/css/star.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>상품리뷰</title>
<style>
main {
	width: 65%;
	margin: 0 auto;
}

hr {
	border: 3px solid #ccc !important;
}

.inputArea {
    display: flex;
    align-items: center;
}

.inputArea input[type="file"] {
    flex-grow: 1;
}

.btn-wrapper {
    flex-shrink: 0;
    margin-left: 10px; /* 원하는 간격으로 조정하세요 */
}

footer {
	margin-top: 90px;
}
</style>
</head>
<body>
	<header><%@ include file="../template/header.jsp"%></header>
	
	<main style="width: 50%;">
		<div style="display: flex; align-items: center; margin-top: 50px; margin-bottom: 50px;">
	        <img src="${product.pdThumbImg}" style="margin-left: 0px; margin-right: 0px; max-width: 150px; max-height: 150px;">
	        <div style="text-align: left; margin-left: 40px;">
	            <div style="font-size: 25px; font-weight: bold; margin-top: 10px;">${product.pdName}</div>
	            <div style="font-size: 20px; font-weight: bold;">${product.pdPrice}원</div>
	        </div>
	    </div>
	    <hr>
		<form class="mb-3" name="myform" id="myform" action="/shop/review/write" method="post" enctype="multipart/form-data" style="margin-top: 50px;">
			<input type="hidden" name="memberid" value="${memberid}" />
			<input type="hidden" name="pdNum" value="${product.pdNum}" />
			<div style="text-align: center;">
			    <div style="font-size: 35px; color: #dc3545; font-weight: bold;">상품은 만족하셨나요?</div>
			    <fieldset style="display: inline-block;">
			        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">★</label>
			        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">★</label>
			        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">★</label>
			        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">★</label>
			        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">★</label>
			    </fieldset>
			</div>
			<div style="margin-top: 30px;">
				<textarea class="col-auto form-control" type="text"  name="reviewText" id="reviewContents"
						  placeholder="상품 리뷰를 남겨주세요!"></textarea>
			</div>
			<div class="d-flex justify-content-between align-items-center" style="margin-top: 20px;">
			    <div class="inputArea">
				    <input type="file" id="pdImg" name="file" />
				    <div class="select_img">
				        <img src="" />
				    </div>
				    <script>
				        $("#pdImg").change(function() {
				            if (this.files && this.files[0]) {
				                var reader = new FileReader();
				                reader.onload = function(data) {
				                    $(".select_img img").attr("src", data.target.result).width(150).height(150);
				                }
				                reader.readAsDataURL(this.files[0]);
				            }
				        });
				    </script>
				</div>
				<div class="btn-wrapper">
				    <input class="btn btn-danger" type="submit" value="리뷰작성" />
				</div>
			</div>
		</form>	
	</main>
	
	<footer><%@ include file="../template/footer.jsp"%></footer>
</body>
</html>