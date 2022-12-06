<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../menu.jsp"%>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>게시판 작성</h1>
    </div>
	
    <section class="section">
    	<div class="row align-items-top">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title"></h5>
					<form action="/board/register" role="form" method="post" class="row g-3 regForm">
						<div class="form-group">
							<label>글 제목</label> <input class="form-control" name="title" id="title">
						</div>
						<div class="form-group">
							<label>글 내용</label>
							<textarea class="form-control" rows="3" name="content" id="content"></textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> 
							<input class="form-control" name="writer" id="memberId" placeholder="${member.memberId}" value="${member.memberId}" readonly="readonly">
						</div>
						<div class="regBtn text-center">
							<button type="submit" class="btn btn-success" id="submit">등록</button>
							<button type="reset" class="btn btn-warning" id="reset">초기화</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</main>
<%@ include file="../footer.jsp" %>