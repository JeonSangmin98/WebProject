<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>
<style type="text/css">
img {
	width: 100px;
	height: 100px;
}

th, td {
	text-align: center;
	vertical-align: middle;
}
</style>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container" style="user-select: auto;">
		<div class="page-header" id="banner" style="user-select: auto;">
			<div class="row" style="user-select: auto;">
				<div class="col-lg-8 col-md-7 col-sm-6" style="user-select: auto;">
					<h1 style="user-select: auto;">도서 검색</h1>
					<p class="text-info" style="user-select: auto;">검색 리스트</p>
				</div>
				<div class="col-lg-4 col-md-5 col-sm-6" style="user-select: auto;">
					<div class="sponsor" style="user-select: auto;"></div>
				</div>
			</div>
		</div>
	</div>

	<table class="table table-hover table-info" style="user-select: auto;">
		<thead style="user-select: auto;">
			<tr style="user-select: auto;">
				<th scope="col" style="user-select: auto;">제목</th>
				<th scope="col" style="user-select: auto;">이미지</th>
				<th scope="col" style="user-select: auto;">저자</th>
				<th scope="col" style="user-select: auto;">가격</th>
			</tr>
		</thead>
		<tbody style="user-select: auto;">
			<c:forEach items="${search}" var="s">
				<tr class="table-light" style="user-select: auto;">
					<th scope="row" style="user-select: auto;">${s.title}</th>
					<td style="user-select: auto;"><a class="moveBtn" data-bno="${s.bno}"><img
							src="${s.image}"></a></td>
					<td style="user-select: auto;">${s.author}</td>
					<td style="user-select: auto;">${s.discount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form class="actionForm" action="/book/get">
		<input type="hidden" name="bno" class="searchBno">
	</form>
</body>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(".moveBtn").on("click", function (e) {
		e.preventDefault();
		let bno = $(this).data("bno");
		$(".searchBno").val(bno);
		$(".actionForm").submit();
	});
</script>
</html>