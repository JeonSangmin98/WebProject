<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <div class="container-fluid">
                  <a class="navbar-brand" href="/mainHome">Book Store</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>

                  <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav me-auto">
                      <li class="nav-item">
                        <a class="nav-link" href="/member/join">회원가입</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">로그인</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="/book/list">도서 리스트</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">마이 페이지</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">도서 대여</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">장바구니</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">주문 / 배송</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="/board/list">게시판</a>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                        <div class="dropdown-menu">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <a class="dropdown-item" href="#">Something else here</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                      </li>
                    </ul>
                    <form class="d-flex">
                      <input class="form-control me-sm-2" type="text" placeholder="Search">
                      <button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
                    </form>
                  </div>
                </div>
              </nav>