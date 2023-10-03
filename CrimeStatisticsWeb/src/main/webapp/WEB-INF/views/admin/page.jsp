<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<title>관리자 페이지</title>
<style>
  body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
  }
  main {
    flex-grow: 1;
    margin-top: 120px;
  }
  footer {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    background-color: #ffffff; /* 배경색 설정 (필요시) */
    padding: 10px; /* 원하는 여백 설정 (필요시) */
  }
</style>
</head>
<body style="background-color: #cccccc;">
    <header><%@ include file="../template/header.jsp"%></header>
    <main><a href="/admin/products/register">상품 등록</a></main>
    <footer><%@ include file="../template/footer.jsp"%></footer>
</body>
</html>
