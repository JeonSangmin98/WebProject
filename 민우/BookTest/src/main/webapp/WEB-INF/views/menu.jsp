<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
	style="user-select: auto;">
	<div class="container-fluid" style="user-select: auto;">
		<a class="navbar-brand" href="/mainHome" style="user-select: auto;">Book
			Store</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation"
			style="user-select: auto;">
			<span class="navbar-toggler-icon" style="user-select: auto;"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarColor01"
			style="user-select: auto;">
			<ul class="navbar-nav me-auto" style="user-select: auto;">
				<c:if test="${member == null}">
					<li class="nav-item" style="user-select: auto;"><a
						class="nav-link active" href="/member/join"
						style="user-select: auto;">회원가입 </a></li>
					<li class="nav-item" style="user-select: auto;"><a
						class="nav-link" href="/member/login" style="user-select: auto;">로그인</a></li>
				</c:if>

				<c:if test="${member != null}">
					<li class="nav-item" style="user-select: auto;"><a
						class="nav-link" href="/member/info" style="user-select: auto;"><strong
							class="text-muted">${member.memberName}</strong> 회원님</a></li>
					<li class="nav-item" style="user-select: auto;"><a
						class="nav-link" style="user-select: auto;">마일리지:${member.point}</a></li>
					<li class="nav-item" style="user-select: auto;"><a
						class="nav-link logoutBtn" style="user-select: auto;">로그아웃</a></li>
					<li class="nav-item" style="user-select: auto;"><a
						class="nav-link" href="/member/info" style="user-select: auto;">마이페이지</a></li>
					<li class="nav-item" style="user-select: auto;"><a
						class="nav-link" href="/cart/list/${member.memberId}"
						style="user-select: auto;">장바구니</a></li>
				</c:if>
				<li class="nav-item dropdown" style="user-select: auto;"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false"
					style="user-select: auto;">카테고리</a>
					<div class="dropdown-menu" style="user-select: auto;">
						<a class="dropdown-item history" style="user-select: auto;">역사</a>
						<a class="dropdown-item travel" style="user-select: auto;">여행</a>
						<a class="dropdown-item religion" style="user-select: auto;">종교</a>
						<a class="dropdown-item IT" style="user-select: auto;">IT</a>
					</div></li>
				<li class="nav-item" style="user-select: auto;"><a
					class="nav-link" href="/book/list" style="user-select: auto;">전체
						도서</a></li>
				<li class="nav-item" style="user-select: auto;"><a
					class="nav-link" href="#" style="user-select: auto;">도서 대여</a></li>
				<li class="nav-item" style="user-select: auto;"><a
					class="nav-link" href="#" style="user-select: auto;">주문/배송</a></li>
				<li class="nav-item" style="user-select: auto;"><a
					class="nav-link" href="/board/list" style="user-select: auto;">자유게시판</a></li>
			</ul>
			<!-- 검색 form -->
			<form class="d-flex searchForm" style="user-select: auto;"
				action="/book/searchList">
				<select class="form-control search-select text-secondary"
					name="type">
					<option value="">--</option>
					<option value="T">제목</option>
					<option value="A">저자</option>
				</select> <input class="form-control me-sm-2" type="text" placeholder="도서 검색"
					style="user-select: auto;" name="keyword">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit"
					style="user-select: auto;">Search</button>
			</form>

			<!-- 카테고리 form -->
			<form action="/book/category" class="categoryForm">
				<input type="hidden" name="category" class="hiddenCategory">
			</form>
		</div>
	</div>
</nav>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	//카테고리 메뉴
	$(".dropdown").on("click", function() {
		$(".dropdown-menu").show();
	});

	//해당 카테고리 값 넘겨주기
	//역사
	$(".history").on("click", function() {
		/* console.log("click history"); */
		$(".hiddenCategory").val("역사");
		$(".categoryForm").submit();
	});
	//여행
	$(".travel").on("click", function() {
		$(".hiddenCategory").val("여행");
		$(".categoryForm").submit();
	});
	//종교
	$(".religion").on("click", function() {
		$(".hiddenCategory").val("종교");
		$(".categoryForm").submit();
	});
	//IT
	$(".IT").on("click", function() {
		$(".hiddenCategory").val("IT");
		$(".categoryForm").submit();
	});

	const searchForm = $(".searchForm");

	//검색 기능
	$(".searchForm button").on("click", function() {
		if (!searchForm.find("option:selected").val()) {
			alert("종류를 선택 해 주세요!");
			return false;
		}

		if (!searchForm.find("input[name='keyword']").val()) {
			alert("검색 내용을 입력 해 주세요!");
			return false;
		}
		searchForm.submit();
	});

	//로그아웃 
	$(".logoutBtn").click(function() {
		/* alert("test logout"); */

		$.ajax({

			type : "POST",
			url : "/member/logout",
			success : function(result) {
				alert("로그아웃 완료");
				document.location.reload();
			}
		});// end ajax

	});// end funcion
</script>