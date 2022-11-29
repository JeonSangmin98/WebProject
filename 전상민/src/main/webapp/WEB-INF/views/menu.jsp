<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav me-auto">
					<c:if test="${member == null}">
						<li class="nav-item"><a class="nav-link" href="/member/join">회원가입</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/member/login">로그인</a>
						</li>
					</c:if>

					<c:if test="${member != null}">
						<li class="nav-item"><a class="nav-link" href="/member/info"><strong
								class="text-muted">${member.memberName}</strong> 회원님</a></li>
						<li class="nav-item"><a class="nav-link logoutBtn">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/info">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="/cart/list/${member.memberId}">장바구니</a></li>
					</c:if>
					<li class="nav-item"><a class="nav-link" href="/book/list">도서
							리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">도서 대여</a></li>
					<li class="nav-item"><a class="nav-link" href="#">주문 / 배송</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/board/list">자유 게시판</a></li>
				</ul>
				<form class="d-flex searchForm" action="/book/searchList">
					<select class="form-control search-select text-secondary"
						name="type">
						<option value="">--</option>
						<option value="T">제목</option>
						<option value="A">저자</option>
					</select> <input class="form-control me-sm-2" type="text"
						placeholder="도서 검색" name="keyword">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
				</form>
			</div>
		</div>
	</nav>
	<script>
		var searchForm = $(".searchForm");

		// 검색 기능
		$(".searchForm button").on('click', function() {
			if (!searchForm.find("option:selected").val()) {
				alert("종류를 선택해 주세요!");
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("검색 내용을 입력해 주세요!");
				return false;
			}
			searchForm.submit();
		});

		// 로그아웃 버튼	
		$(".logoutBtn").click(function() {
			$.ajax({
				type : "POST",
				url : "/member/logout",
				success : function(result) {
					alert('로그 아웃 완료!!');
					document.location.reload();
				}
			});// end ajax
		});// end click
	</script>