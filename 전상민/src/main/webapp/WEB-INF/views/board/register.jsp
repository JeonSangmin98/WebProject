<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/menu.jsp"%>

<div class="jumbotron">
	<div class="page-header">
		<h1 id="tables">자유 게시판</h1>
	</div>
	<!-- <h1 class="display-3">글쓰기</h1> -->
</div>
<div class="panel-body">
	<form action="/board/register" role="form" method="post">
		<div class="form-group">
			<label>글 제목</label> <input class="form-control" name="title">
		</div>
		<div class="form-group">
			<label>글 내용</label>
			<textarea class="form-control" rows="3" name="content"></textarea>
		</div>
		<div class="form-group">
			<label>작성자</label> <input class="form-control" name="writer">
		</div>
		<button type="submit" class="btn btn-success">등록</button>
		<button type="reset" class="btn btn-warning">초기화</button>
	</form>
</div>
<%-- <%@ include file="../includes/footer.jsp"%> --%>