<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../menu.jsp"%>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>Category</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/book/list">전체도서</a></li>
				<li class="breadcrumb-item">카테고리</li>
				<li class="breadcrumb-item">역사</li>
				<li class="breadcrumb-item">여행</li>
				<li class="breadcrumb-item">종교</li>
				<li class="breadcrumb-item">IT</li>
			</ol>
		</nav>
	</div>

	<section class="section">
		<div class="col-lg-12">
			<div class="row align-items-top">

				<c:forEach items="${category}" var="book">
					<div class="col-lg-3">
						<div class="card bookList">
							<a class="move" href="${book.bno}"> <img src="${book.image}"
								class="card-img-top image" data-bookCount="${book.bookCount}">
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<form action="/book/category" class="actionForm">
		<input type="hidden" name="bno" class="hiddenBno">
	</form>
</main>
<script type="text/javascript" src="/resources/js/bookCount.js?ver=1"></script>
<script type="text/javascript">
	const actionForm = $(".actionForm");

	$(".move").on("click", function(e) {
		e.preventDefault();
		/* 	actionForm.append("<input type='hidden' name='bno' value='"
					+ $(this).attr("href") + "'>"); */
		let bno = $(this).attr("href");
		$(".hiddenBno").val(bno);
		actionForm.attr("action", "/book/get");
		actionForm.submit();
	});
</script>
<%@ include file="../footer.jsp"%>