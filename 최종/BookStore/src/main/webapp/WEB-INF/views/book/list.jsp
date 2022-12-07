<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../menu.jsp" %>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>전체 도서</h1>
    </div>
    
	<section class="section">
	    <div class="col-lg-12">
	   		<div class="row align-items-top">
				<c:forEach items="${bookList}" var="book">
					<div class="col-lg-3">
						<div class="card bookList">
							<a class="move" href="${book.bno}">
				            	<img src="${book.image}" class="card-img-top image" data-bookCount="${book.bookCount}">
				            </a>
				        </div>
					</div>
				</c:forEach>
				
				<div>
					<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev}">
							<li class="page-item previous">
								<a class="page-link" href="${pageMaker.startPage - 1}">&laquo;</a>
							</li>
						</c:if>
					
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="page-item pageBno ${pageMaker.cri.pageNum == num ? 'active' : ''}">
								<a class="page-link" href="${num}">${num}</a>
							</li>
						</c:forEach>
					
						<c:if test="${pageMaker.next}">
							<li class="page-item next">
								<a class="page-link" href="${pageMaker.endPage + 1}">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!--  페이징 처리 -->
	<form action="/book/list" class="actionForm">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<!-- <input type="hidden" name="bno" class="hiddenBno"> -->
	</form>
	
	<!-- 상세 페이지 -->
	<form action="/book/get" class="getForm">
		<input type="hidden" name="bno" class="hiddenBno">
	</form>
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

	$(".move").on("click",	function(e) {
		e.preventDefault();
		let bno = $(this).attr("href");
		$(".hiddenBno").val(bno);
		$(".getForm").submit();
	});
</script>
<%@ include file="../footer.jsp" %>