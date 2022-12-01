<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<link href="/resources/css/bootstrap.min.css?ver=1" rel="stylesheet">
<style type="text/css">
img {
	width: 200px;
	height: 200px;
}

.bookList ul {
	list-style: none;
}

.bookList ul li {
	display: inline-block;
	padding: 10px;
}

.pageNum {
	float: right;
}
</style>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="container" style="user-select: auto;">
		<div class="page-header" id="banner" style="user-select: auto;">
			<div class="row" style="user-select: auto;">
				<div class="col-lg-8 col-md-7 col-sm-6" style="user-select: auto;">
					<h1 style="user-select: auto;">카테고리</h1>
					<p class="text-info" style="user-select: auto;">카테고리 목록</p>
				</div>
				<div class="col-lg-4 col-md-5 col-sm-6" style="user-select: auto;">
					<div class="sponsor" style="user-select: auto;"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="container"
		style="user-select: auto; border: 1px solid #ccc;">
		<div class="container bookList">
			<ul id="imgClick">
				<c:forEach items="${category}" var="book">
					<li><a class="move" href="${book.bno}"><img
							src="${book.image}"></a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<form action="/book/category" class="actionForm"></form>


</body>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	const actionForm = $(".actionForm");

	$(".move").on(
			"click",
			function(e) {
				e.preventDefault();
				actionForm.append("<input type='hidden' name='bno' value='"
						+ $(this).attr("href") + "'>");
				actionForm.attr("action", "/book/get");
				actionForm.submit();
			});
</script>

</html>