<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../menu.jsp"%>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<div class="jumbotron">
	<!-- <h1 class="display-3">자유 게시판</h1> -->
	<div class="page-header">
		<h1 id="tables">자유 게시판</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel-heading">
			<form id="searchForm" action="/board/list" method="get">
				<select name="type">
					<option value="" ${pageMaker.cri.type == null ? 'selected':''}>---</option>
					<option value="T" ${pageMaker.cri.type == 'T' ? 'selected':''}>제목</option>
					<option value="C" ${pageMaker.cri.type == 'C' ? 'selected':''}>내용</option>
					<option value="W" ${pageMaker.cri.type == 'W' ? 'selected':''}>작성자</option>
					<option value="TC" ${pageMaker.cri.type == 'TC' ? 'selected':''}>제목 + 내용</option>
					<option value="TCW" ${pageMaker.cri.type == 'TCW' ? 'selected':''}>제목 + 내용 + 작성자</option>
				</select>
				<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<button class="btn btn-outline-primary">검색</button>
			</form>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">글 제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">수정일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="board">
						<tr>
							<th scope="row">${board.boardNo}</th>
							<td><a class='move' href='${board.boardNo}'>${board.title}
								<span class="text-danger">${board.replyCnt}</span></a></td>
							<td>${board.writer}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pull-right">
			<form id="actionForm" action="/board/list" method="get">
				<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
				<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> 
			</form>
				<ul class="pagination">
				
					<c:if test="${pageMaker.prev}">
	                  <li class="page-item previous">
	                    <a class="page-link" href="${pageMaker.startPage - 1}">«</a>
	                  </li>
					</c:if>
				
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                  <li class="page-item active ${pageMaker.cri.pageNum == num ? 'active' : ''}">
	                    <a class="page-link" href="${num}">${num}</a>
	                  </li>
					</c:forEach>
				
	                <c:if test="${pageMaker.next}">
	                  <li class="page-item next">
	                    <a class="page-link" href="${pageMaker.endPage + 1}">»</a>
	                  </li>
	                </c:if>
                
                </ul>
			</div>
			<button id="regBtn" type="button" class="btn btn-outline-info">글쓰기</button>
		</div>
	</div>
</div>

<div class="modal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">알림창</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<p></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<style>
	.pull-right{
		float : right;
	}
	.panel-heading{
		padding : 10px;
	}
	#searchForm{
		float : right;
		padding-bottom : 10px;
	}
</style>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script>
	$(function() {
		var result = '${result}';

		checkModal(result);
		
		history.replaceState({}, null, null);
		
		console.log('${pageMaker}');
		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}
			if (result === 'success') {
				$(".modal-body").html("정상적으로 처리되었습니다.");
			} else if (parseInt(result) > 0) {
				$(".modal-body")
						.html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
			}
			$(".modal").modal('show');
		}//checkModal

		$("#regBtn").click(function() {
			self.location = "/board/register";
		});
		
		var actionForm = $('#actionForm');
		$('.pagination a').on('click',function(e){
			e.preventDefault();
			console.log('click');
			actionForm.find('input[name="pageNum"]').val($(this).attr('href'));
			actionForm.submit();
		});
		
		$('.move').on('click',function(e){
			e.preventDefault();
			actionForm.append('<input type="hidden" name="boardNo" value="' + $(this).attr('href') + '">');
			actionForm.attr('action','/board/get');
			actionForm.submit();
		});
		
		$('#searchForm button').on('click',function(e){
			var searchForm = $('#searchForm');
			if(!searchForm.find('option:selected').val()){
				alert('검색 종류를 선택하세요.');
				return false;
			}
			if(!searchForm.find('input[name="keyword"]').val()){
				alert("키워드를 입력하세요.");
				return false;
			}
			searchForm.find('input[name="pageNum"]').val('1');
			e.preventDefault();
			searchForm.submit();
		});
	});
</script>
<%-- <%@ include file="../includes/footer.jsp"  %> --%>
</body>
</html>