<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../menu.jsp"%>
<style>
#searchForm{
	float: right;
}
#regBtn{
	float: left;
}
#search{
	padding: 10px;
	justify-content: flex-end;
}
</style>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>자유게시판</h1>
	</div><!-- End Page Title -->

    <section class="section">
      <div class="row">
			<div class="card">
				<div id="search" class="search-bar">
					<form id="searchForm" action="/board/list" method="get" class="search-form d-flex align-items-center">
						<select name="type" class="form-select">
							<option value="" ${pageMaker.cri.type == null ? 'selected':''}>---</option>
							<option value="T" ${pageMaker.cri.type == 'T' ? 'selected':''}>제목</option>
							<option value="C" ${pageMaker.cri.type == 'C' ? 'selected':''}>내용</option>
							<option value="W" ${pageMaker.cri.type == 'W' ? 'selected':''}>작성자</option>
							<option value="TC" ${pageMaker.cri.type == 'TC' ? 'selected':''}>제목 + 내용</option>
							<option value="TCW" ${pageMaker.cri.type == 'TCW' ? 'selected':''}>제목 + 내용 + 작성자</option>
						</select>
						<input type="text" class="form-control" name="keyword" value="${pageMaker.cri.keyword}">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<button type="button" class="btn btn-outline-primary" id="searchBtn"><i class="bi bi-search"></i></button>
					</form>
				</div>
				<div class="card-body">
					<table class="table table-hover table-striped">
						<thead>
							<tr class="table-primary">
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
									<td><a class='move' href='${board.boardNo}'>${board.title} ...  
										<span class="badge bg-secondary">${board.replyCnt}</span></a></td>
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
							<input type="hidden" name="memberId" value="${member.memberId}"> 
							<input type="hidden" name="boardNo" class="hiddenBoardNo">
						</form>
						<div>
			                <ul class="pagination justify-content-center">
			                  	<c:if test="${pageMaker.prev}">
				                  <li class="page-item previous">
				                    <a class="page-link" href="${pageMaker.startPage - 1}">«</a>
				                  </li>
								</c:if>
								
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				                  <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
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
					</div>
				 		<c:if test="${member.memberId != null}">
							<button type="button" class="btn btn-primary" id="regBtn">글쓰기</button>
						</c:if>
				</div>
			</div>

        </div>
    </section>
</main>

<div class="modal fade" id="verticalycentered" tabindex="-1" style="display: none;" aria-hidden="true">             
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">알림창</h5>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" id="modalCloseBtn" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
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
		
		$("#modalCloseBtn").click(function(){
			$(".modal").modal('hide');
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
			/* actionForm.append('<input type="hidden" name="boardNo" value="' + $(this).attr('href') + '">'); */
			let boardNo = $(this).attr("href");
			$(".hiddenBoardNo").val(boardNo);
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
<%@ include file="../footer.jsp" %>