<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../menu.jsp"%>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<div class="jumbotron">
	<div class="page-header">
		<h1 id="tables">게시글 수정</h1>
	</div>
	<!-- <h1 class="display-3">글쓰기</h1> -->
</div>
<div class="panel-body">
	<form>
		<input type="hidden" name="pageNum" value="${cri.pageNum}"> <input
			type="hidden" name="amount" value="${cri.amount}"> <input
			type="hidden" name="keyword" value="${cri.keyword}"> <input
			type="hidden" name="type" value="${cri.type}">
		<div class="form-group">
			<label>글 번호</label> <input class="form-control" name="boardNo"
				value="${board.boardNo}">
		</div>
		<div class="form-group">
			<label>글 제목</label> <input class="form-control" name="title"
				value="${board.title}">
		</div>
		<div class="form-group">
			<label>글 내용</label>
			<textarea class="form-control" rows="3" name="content">${board.content}</textarea>
		</div>
		<div class="form-group">
			<label>작성자</label> <input class="form-control" name="writer"
				value="${board.writer}" readonly disabled="disabled">
		</div>
		<button class="btn btn-success" data-oper="list">목록</button>
		<button class="btn btn-warning" data-oper="modify">수정</button>
		<button class="btn btn-danger" data-oper="remove">삭제</button>
	</form>
</div>
<%-- <%@ include file="../includes/footer.jsp"%> --%>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script>
	$(function() {
		var formObj = $("form");
		$("button").on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			if (operation === 'remove') {
				formObj.attr({
					"action" : "/board/remove",
					"method" : "post"
				});
			} else if (operation === 'modify') {
				formObj.attr({
					"action" : "/board/modify",
					"method" : "post"
				});
			} else if (operation === 'list') {
				formObj.attr({
					"action" : "/board/list",
					"method" : "get"
				});

				var pageNumTag = $('input[name="pageNum"]').clone();
				var amountTag = $('input[name="amount"]').clone();
				var keywordTag = $('input[name="keyword"]').clone();
				var typeTag = $('input[name="type"]').clone();

				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}
			formObj.submit();
		});
	});
</script>
</body>
</html>