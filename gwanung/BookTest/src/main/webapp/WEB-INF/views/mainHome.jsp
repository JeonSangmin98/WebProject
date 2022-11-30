<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
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

#modal {
	display: none;
}

.pageNum {
	float: right;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />

	<div style="text-align: center;">
		<h1>BookStore</h1>
		<p class="text-primary">할인 높은 순</p>
	</div>

	<div class="container"
		style="user-select: auto; border: 1px solid #ccc;">
		<div class="container bookList">
			<ul id="imgClick">
				<c:forEach items="${discount}" var="book">
					<li><a class="move" href="${book.bno}"><img
							src="${book.image}"></a></li>
				</c:forEach>
			</ul>
		</div>
	</div>

	<div style="text-align: center;">
		<p class="text-primary">인기 도서</p>
	</div>
	<form action="/mainHome" class="actionForm"></form>

</body>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	const actionForm = $(".actionForm");

	$(".pageBno a").on("click", function(e) {
		e.preventDefault(); // a태그 역할 봉인
		console.log("click pageBno");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

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