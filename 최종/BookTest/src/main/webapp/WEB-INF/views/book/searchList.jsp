<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../menu.jsp" %>
<style>
#img {
	width: 120px;
	height: 160px;
}
th, td {
	/* text-align: center; */
	vertical-align: middle;
}
a{
	color: black;
}
</style>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>도서 검색</h1>
		<nav>
	        <ol class="breadcrumb">
	        	<li class="breadcrumb-item"><a href="/book/list">전체도서</a></li>
	        	<li class="breadcrumb-item">검색 리스트</li>
	        </ol>
      	</nav>
	</div>
	
	<section class="section">
		<div class="row">
			<div class="card">
				<h5 class="card-title"></h5>
				<div class="card-body">
					<table class="table table-hover table-striped">
						<thead>
							<tr class="table-primary">
								<th scope="col">이미지</th>
								<th scope="col">제목</th>
								<th scope="col">저자</th>
								<th scope="col">가격</th>
								<th scope="col">도서 수량</th>
								<th scope="col">도서 할인율</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${search}" var="s">
								<tr class="table-light">
									<td><a class="moveBtn" data-bno="${s.bno}"><img src="${s.image}" id="img" class="image" data-bookCount="${s.bookCount}"></a></td>
									<td scope="row"><a class="moveBtn" data-bno="${s.bno}"><b>${s.title}</b></a></td>
									<td>${s.author}</td>
									<td>${s.price}</td>
									<td>${s.bookCount}권</td>
									<td>${s.discount}%</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<form class="actionForm" action="/book/get">
						<input type="hidden" name="bno" class="searchBno">
					</form>
				</div>
			</div>
		</div>
	</section>
</main>
<script type="text/javascript" src="/resources/js/bookCount.js?ver=1"></script>
<script type="text/javascript">
	$(".moveBtn").on("click", function (e) {
		e.preventDefault();
		let bno = $(this).data("bno");
		$(".searchBno").val(bno);
		$(".actionForm").submit();
	});
</script>
<%@ include file="../footer.jsp"%>