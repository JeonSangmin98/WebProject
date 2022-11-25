<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../menu.jsp"%>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<div class="jumbotron">
	<div class="page-header">
		<h1 id="tables">자유 게시판</h1>
	</div>
	<!-- <h1 class="display-3">글쓰기</h1> -->
</div>
<div class="panel-body">
	<form action="/board/register" role="form" method="post" class="regForm">
		<div class="form-group">
			<label>글 제목</label> <input class="form-control" name="title" id="title">
		</div>
		<div class="form-group">
			<label>글 내용</label>
			<textarea class="form-control" rows="3" name="content" id="content"></textarea>
		</div>
		<div class="form-group">
			<label>작성자</label> <input class="form-control" name="writer" id="memberId" placeholder="${member.memberId}" value="${member.memberId}" disabled="disabled">
		</div>
		<div class="regBtn">
			<button type="submit" class="btn btn-success" id="submit">등록</button>
			<button type="reset" class="btn btn-warning" id="reset">초기화</button>
		</div>
	</form>
</div>
<script>
	
</script>
<style>
.form-group{
	padding : 10px;
}
.regBtn{
	padding : 10px;
}
</style>
<%-- <%@ include file="../includes/footer.jsp"%> --%>