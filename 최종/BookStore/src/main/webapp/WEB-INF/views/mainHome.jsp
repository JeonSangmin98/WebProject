<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./menu.jsp" %>
<style>
ul, li {
	list-style: none;
}
a {
	text-decoration: none;
	color: inherit;
}
.list_wrap {
 	width: 50%;
 	min-width: 1000px;
	max-width: 1200px;
	margin: 0 auto;
	padding: 0px 100px 10px 100px;
}
.list_wrap .item {
	display: inline-block;
	width: 30%;
	margin-top: 40px;
	margin-left: 5%;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
}
.list_wrap .item .image {
	width: 100%;
	height: 300px;
	background-color: #ddd;
	background-repeat: no-repeat;
	background-position: 50% 50%;
	background-size: cover;
}
.list_wrap ul {
	font-size: 0;
}
.list_wrap .item:nth-child(-n+2) {
	margin-top: 0;
}
.list_wrap .item:nth-child(3n-2) {
	margin-left: 0;
}
.list_wrap .item .cont {
	padding: 20px;
}
.list_wrap .item strong {
	display: block;
	margin: 15px 0 10px 0;
	letter-spacing: -1px;
	font-size: 16px;
}
.list_wrap .item p {
	display: inline-block;
	margin-top: 10px;
	padding: 5px 10px;
	background: #eee;
	font-size: 13px;
	letter-spacing: -1px;
}
.card-title{
	text-align: center;
	font-size: 1.3em;
}
.copyright{
	text-align: center;
	margin: auto 0;
}
</style>
<main id="main" class="main">
    <div class="pagetitle">
      <h1>Book Store</h1>
      <nav>
	        <ol class="breadcrumb">
	        	<li class="breadcrumb-item"><a href="/book/list">전체도서</a></li>
	        	<li class="breadcrumb-item">이달의 상품</li>
	        </ol>
      	</nav>
    </div>

	<section class="section">
		<div class="card">
			<p class="card-title">할인율 높은 순</p>
			<div class="list_wrap">
				<ul>
					<c:forEach items="${discount}" var="book">
						<li class="item">
							<a class="move" href="${book.bno}">
								<img class="image" src="${book.image}" data-bookcount="${book.bookCount}">
							</a>
							<div class="cont">
								<strong>${book.title}</strong>
								<p class="text-muted">${book.discount}%할인</p>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="card">
		<p class="card-title">인기 도서</p>
			<div class="list_wrap">
				<ul>
					<c:forEach items="${popular}" var="book">
						<li class="item">
							<a class="move" href="${book.bno}">
							<img class="image" src="${book.image}" data-bookCount="${book.bookCount}"></a>
							<div class="cont">
								<strong>${book.title}</strong>
								<p class="text-muted">${book.discount}%할인</p>
							</div></li>
					</c:forEach>
				</ul>
				<form action="/mainHome" class="actionForm">
					<input type="hidden" name="bno" class="hiddenBno">
				</form>
			</div>
		</div>
	</section>
<a class="copyright" href="https://www.flaticon.com/kr/free-icons/" title="매진 아이콘"> 매진 아이콘 제작자: Freepik - Flaticon</a>
</main>
<script type="text/javascript" src="/resources/js/bookCount.js?ver=1"></script>
<script type="text/javascript">
	const actionForm = $(".actionForm");
	$(".pageBno a").on("click", function(e) {
		e.preventDefault(); // a태그 역할 봉인
		console.log("click pageBno");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	$(".move").on("click",function(e) {
		e.preventDefault();
		/* actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>"); */
		let bno = $(this).attr("href");
		$(".hiddenBno").val(bno);
		actionForm.attr("action", "/book/get");
		actionForm.submit();
			});
</script>
<%@ include file="./footer.jsp" %>