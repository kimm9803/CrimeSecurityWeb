<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"></script>
  <style>
    /* Change background color of .navbar-dark class */
    .navbar-dark {
      background-color: #003a5e !important; /* Use !important to overwrite existing styles */
    }

    .navbar-nav a.nav-link {
      font-size: 20px;
      font-weight: bold; /* Make text bold */
      color: #fff; /* Set text color to white */
    }

    /* Increase spacing between nav items */
    .navbar-nav {
      margin: 9px; /* Center the navbar items */
      gap: 35px; /* Increase spacing between items */
    }

    .navbar {
      height: 96px; /* Set a fixed height for the navbar */
    }

    .navbar-brand img {
      max-height: 100%; /* Ensure the logo image fits within the navbar height */
    }

    .offcanvas.offcanvas-end {
      left: 0; /* Align the offcanvas to the left */
    }

    .login-link {
      color: #fff;
      text-decoration: none;
      margin-right: 35px; /* Add space to the right of the login link */
    }
    
    .navbar-collapse {
      justify-content: center; /* Center navigation items */
    }

    .navbar-toggler {
      order: 0; /* Change the order to appear in the center */
      margin-right: 45px; /* Add some space to the right of the toggle button */
    }

    .ml-auto {
      order: 2; /* Change the order of the login links to appear slightly off the right */
    }
    img { display: block; margin: 0px auto; }
    .custom-mt {
    margin-top: 6.00rem; /* 7rem 크기의 위쪽 마진을 설정합니다. */
   }
   .custom-a{
    margin-bottom: 1.9rem;
    margin-left: 3rem;
   }
   .custom-b{
    background-color: #003a5e
   }
   
   .custom-close-btn {
    position: absolute;
    right: 15px;
    font-size: 20px;
}
  </style>
</head>

<body>

<nav class="navbar navbar-expand-sm navbar-dark custom-a" style="background-color: #0f5485;">
  <div class="container-fluid">
  </div>
</nav>

<nav class="navbar navbar-dark  fixed-top custom-c" style="background-color: #0f5485;">

  <div class="container-fluid">
    
    <button class="navbar-toggler custom-a " type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div style="margin-left: 90px;"> <!-- Align the logo to the left -->
      <a class="navbar-brand" href="/">
        <img src="/img/logo.png" alt="Logo" height="80" width="80"> <!-- Set the height of the logo to match the navbar height -->
      </a>
    </div>

    <div class="ml-auto  custom-a"> <!-- Align the login/sign-up links slightly off the right -->
      <c:choose>
      	<c:when test="${not empty sessionScope.naverid}">
      		<style>
        		.navbar-toggler {
        			margin-rignt: 200px;
        		}
        	</style>
      		<a class="login-link" href="/member/naver-logout">로그아웃</a>
      		<a class="login-link" href="/shop/cart-list">장바구니</a>
      	</c:when>
      	<c:when test="${not empty sessionScope.googleid}">
      		<style>
        		.navbar-toggler {
        			margin-rignt: 200px;
        		}
        	</style>
      		<a class="login-link" href="/member/google-logout">로그아웃</a>
      		<a class="login-link" href="/shop/cart-list">장바구니</a>
      	</c:when>
        <c:when test="${not empty sessionScope.memberid and empty sessionScope.adminid}">
          <style>
            .navbar-toggler {
              margin-right: 200px; 
            }
          </style>  
          <a class="login-link" href="/member/logout">로그아웃</a>
          <a class="login-link" href="/shop/cart-list">장바구니</a>
          <a class="login-link" href="/member/mypage">마이페이지</a>
        </c:when>
        <c:when test="${not empty sessionScope.adminid and empty sessionScope.memberid}">
        	<style>
        		.navbar-toggler {
        			margin-rignt: 200px;
        		}
        	</style>
        	<a class="login-link" href="/admin/page">관리자 페이지</a>
        	<a class="login-link" href="/admin/logout">로그아웃</a>
        </c:when>
        <c:otherwise>
          <a class="login-link" href="/member/login-page">로그인</a>
          <a class="login-link" href="/member/signup-page">회원가입</a>
        </c:otherwise>
      </c:choose>
    </div>

    <div class="offcanvas offcanvas-start text-bg-dark custom-mt" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel" >
      <div class="offcanvas-header">
        <button type="button" class="btn-close btn-close-white text-reset custom-close-btn" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body" style= "background-color: rgba(8, 35, 56, 0.4)">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#" style="text-align: center; font-size: 25px;">자유게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link dropdown-toggle" href="#"  role="button" data-bs-toggle="dropdown" aria-expanded="false" style="text-align: center; font-size: 25px;">
                지역 별 게시판
            </a>
            <ul class="dropdown-menu dropdown-menu-dark" >
                <li><a  class="dropdown-item" href="#">서울</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a  class="dropdown-item" href="#">경기도</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="/shop/list" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="text-align: center; font-size: 25px;">
             쇼핑몰
            </a>
            <ul class="dropdown-menu dropdown-menu-dark">
              <li><a class="dropdown-item" href="/shop/list" style="text-align: center; font-size: 18px;">전체 호신용품</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#" style="text-align: center; font-size: 18px;">스프레이건</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#" style="text-align: center; font-size: 18px;">스프레이</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#" style="text-align: center; font-size: 18px;">전기충격기</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#" style="text-align: center; font-size: 18px;">삼단봉</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>

</body>
</html>