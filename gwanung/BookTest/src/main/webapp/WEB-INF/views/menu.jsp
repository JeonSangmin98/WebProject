<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<li class="nav-item" style="user-select: auto;"><a
					class="nav-link active" href="/member/join" style="user-select: auto;">회원가입
						<span class="visually-hidden" style="user-select: auto;">(current)</span>
				</a></li>
				<li class="nav-item" style="user-select: auto;"><a
					class="nav-link" href="#" style="user-select: auto;">로그인</a></li>
				<li class="nav-item" style="user-select: auto;"><a
					class="nav-link" href="/book/list" style="user-select: auto;">도서
						리스트</a></li>
				<li class="nav-item" style="user-select: auto;"><a
					class="nav-link" href="#" style="user-select: auto;">마이페이지</a></li>
				<li class="nav-item" style="user-select: auto;"><a
					class="nav-link" href="#" style="user-select: auto;">도서 대여</a></li>
				<li class="nav-item" style="user-select: auto;"><a
					class="nav-link" href="/cart/list" style="user-select: auto;">장바구니</a></li>
				<li class="nav-item" style="user-select: auto;"><a
					class="nav-link" href="#" style="user-select: auto;">주문/배송</a></li>
				<li class="nav-item" style="user-select: auto;"><a
					class="nav-link" href="#" style="user-select: auto;">자유게시판</a></li>
			</ul>
			<form class="d-flex searchForm" style="user-select: auto;"
				action="/book/searchList">
				<select class="form-control search-select text-secondary"
					name="type">
					<option value="">--</option>
					<option value="T">제목</option>
					<option value="A">저자</option>
					<option value="P">출판사</option>
				</select> <input class="form-control me-sm-2" type="text" placeholder="도서 검색"
					style="user-select: auto;" name="keyword">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit"
					style="user-select: auto;">Search</button>
			</form>
		</div>
	</div>
</nav>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var searchForm = $(".searchForm");

	$(".searchForm button").on("click", function() {
		if (!searchForm.find("option:selected").val()) {
			alert("종류 입력 해라");
			return false;
		}

		if (!searchForm.find("input[name='keyword']").val()) {
			alert("검색 입력 해라");
			return false;
		}
		e.preventDefault();
		searchForm.submit();
	});
</script>