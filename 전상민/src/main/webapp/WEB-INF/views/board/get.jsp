<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../menu.jsp"%>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<div class="jumbotron">
	<div class="page-header">
		<h1 id="tables">${board.title}</h1>
	</div>
	<!-- <h1 class="display-3">글쓰기</h1> -->
</div>
<div class="panel-body">
	<div class="form-group">
		<label>글 번호</label> <input class="form-control" name="boardNo"
			value="${board.boardNo}" readonly disabled="disabled">
	</div>
	<div class="form-group">
		<label>글 제목</label> <input class="form-control" name="title"
			value="${board.title}" readonly>
	</div>
	<div class="form-group">
		<label>글 내용</label>
		<textarea class="form-control" rows="3" name="content" readonly>${board.content}</textarea>
	</div>
	<div class="form-group">
		<label>작성자</label> <input class="form-control" name="writer"
			value="${board.writer}" readonly disabled="disabled">
	</div>
	<button id="btn" class="btn btn-success listBtn" data-oper="list">목록</button>
	<c:if test="${member.memberId != null && member.memberId == board.writer}">
		<button id="btn" class="btn btn-warning modBtn" data-oper="modify">수정</button>
	</c:if>
	<form id='actionForm' action="/board/list" method="get">
		<input type="hidden" name="boardNo" value="${board.boardNo}"> 
		<input type="hidden" name="pageNum" value="${cri.pageNum}">
		<input type="hidden" name="amount" value="${cri.amount}"> 
		<input type="hidden" name="keyword" value="${cri.keyword}"> 
		<input type="hidden" name="type" value="${cri.type}">
	</form>
</div>

<div class="card mb-3">
	<h3 class="card-header">댓글</h3>
	<c:if test="${member.memberId != null}">
		<button id="addReplyBtn" type="button" class="btn btn-outline-info">새 댓글</button>
	</c:if>
	<div class="card-body">
		<ul class="list-group list-group-flush chat">
		</ul>
	</div>
	<div class="card-reply-footer">
	</div>
</div>

	<div class="modal" id="reply-modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">댓글 알림창</h5>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>내용</label><input class="form-control" name="reply" value="New Reply!!">
					</div>
					<div class="form-group">
						<label>작성자</label><input class="form-control" name="replyer" placeholder="${member.memberId}" value="${member.memberId}" disabled="disabled">
					</div>
					<div class="form-group">
						<label>작성일</label><input class="form-control" name="replyDate" value="2022-11-23" disabled>
					</div>
				</div>
				<div class="modal-footer">
					<button id="modalRegisterBtn" type="button" class="btn btn-primary">등록</button>
					<button id="modalModBtn" type="button" class="btn btn-warning">수정</button>
					<button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
					<button id="modalCloseBtn" type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
<style>
.pull-right{
		float : right;
	}
.panel-body{
	padding-top : 10px;
	padding-bottom : 10px;
	padding-left : 100px;
	padding-right : 100px;
}
.card{
	padding-top : 10px;
	padding-bottom : 10px;
	padding-left : 100px;
	padding-right : 100px;
}
</style>
<script src="/resources/js/reply.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script>
	$(function() {
		/* console.log(replyService);
		console.log("JS TEST"); */
		var boardNoValue = '${board.boardNo}';
		var replyUL = $(".chat");
		showList(1);
		function showList(page) {replyService.getList( {boardNo : boardNoValue, page : page || 1 },
				function(replyCnt, list) {
					
					if(page == -1) {
						pageNum = Math.ceil(replyCnt / 10.0);
						showList(pageNum);
						return;
					}// end if
				
					var str = "";
					if (list == null || list.length == 0) {
						replyUL.html("");
						return;
					}// end if
					for (var i = 0, len = list.length || 0; i < len; i++) {
						str += '<li class="list-group-item" data-replyNo="' + list[i].replyNo + '">';
						str += '<div>';
						str += '<div class="card-body">';
						str += '<strong>' + list[i].replyer + '</strong>';
						str += '<small class="d-flex w-100 justify text-muted">'
								+ replyService.displayTime(list[i].replyDate)
								+ '</small>';
						str += '</div>';
						str += '<p>' + '<b> » </b> ' + list[i].reply + '</p>';
						str += '</div>';
						str += '</li>';
					}// end for
					replyUL.html(str);
					showReplyPage(replyCnt);
				});//end function
			}// showList();
			
		
		var pageNum = 1;
		var replyPageFooter = $(".card-reply-footer");
		function showReplyPage(replyCnt){
			var endNum = Math.ceil(pageNum / 10.0) * 10; 
			var startNum = endNum - 9; 
			var prev = startNum != 1;
			var next = false;
			if(endNum * 10 >= replyCnt){ endNum = Math.ceil(replyCnt / 10.0); }
			if(endNum * 10 < replyCnt){ next = true; }
			
			var str ='<div class="pull-right"><ul class="pagination">';
			if(prev){
				str += '<li class="page-item disabled"><a class="page-link" href="' + (startNum - 1) + '">«</a></li>';
			}// end if
			for(var i = startNum; i <= endNum; i++){
				var active = (pageNum == i) ? 'active' : '';
				str +='<li class="page-item active '+ active +'"><a class="page-link" href="'+i+'">'+i+'</a></li>';
			}// end for
			if(next){
				str += '<li class="page-item"><a class="page-link" href="' + (endNum + 1) + '">»</a></li>';
			}// end if
			str+='</ul></div>';
			replyPageFooter.html(str);
		}//showReplyPage()
		
		replyPageFooter.on('click', 'li a',function(e){
			e.preventDefault();
			console.log("page click");
			var targetPageNum = $(this).attr('href');
			console.log('targetPageNum : ' + targetPageNum);
			pageNum = targetPageNum;
			showList(pageNum);
		});//replyPageFooter.on('click'
				
		
		var reply_modal = $("#reply-modal");
		
		var modalInputReply = reply_modal.find("input[name='reply']");
		var modalInputReplyer = reply_modal.find("input[name='replyer']");
		var modalInputReplyDate = reply_modal.find("input[name='replyDate']");
		
		
		
		var modalRegisterBtn = $("#modalRegisterBtn");
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		
		let memberId = '${member.memberId}';
		
		$("#modalCloseBtn").click(function(){
			reply_modal.modal('hide');
		});
		
		
		$("#addReplyBtn").click(function(){
			reply_modal.find('input').val("");
			console.log(memberId);
			modalInputReplyDate.closest('div').hide();
			reply_modal.find('button[id != "modalCloseBtn"]').hide();
			modalRegisterBtn.show();
			reply_modal.modal('show');
		});
		
		
		modalRegisterBtn.on('click', function(){
			var reply = {
					reply : modalInputReply.val(),
					replyer : modalInputReplyer.val(),
					boardNo : boardNoValue
			};// end reply
			replyService.add(reply, function(result){
				//console.log(replyer);
				alert(result);
				reply_modal.find('input').val("");
				reply_modal.modal("hide");
				showList(-1);
			});// end add
		});//modalRegisterBtn.on('click'
		
		replyUL.on('click','li', function(){
			var replyNo = $(this).data('replyno');
			//console.log(replyNo);
			replyService.get(replyNo, function(data){
				console.log(data);
				modalInputReply.val(data.reply);
				modalInputReplyer.val(data.replyer);
				
				let d_replyer = data.replyer;
				console.log(d_replyer);
				modalInputReplyDate.val(replyService.displayTime(data.replyDate))
					.attr("readonly","readonly");
				modalRegisterBtn.hide();
				reply_modal.data("replyNo", data.replyNo);
				if(d_replyer == memberId || memberId == 'admin'){
					reply_modal.modal("show");
				}else if(d_replyer != memberId){
					alert('회원님의 댓글이 아닙니다!!');
				}
				
				reply_modal.find('button[id != "modalCloseBtn"]').hide();
				modalModBtn.show();
				modalRemoveBtn.show();
			});// end get
		});//replyUL.on('click','li'
				
		
				
		modalModBtn.on('click', function(){
			var reply = {
					replyNo : reply_modal.data('replyNo'),
					reply : modalInputReply.val(),
					boardNo : boardNoValue
			};// end reply
			replyService.update(reply, function(result){
				alert(result);
				reply_modal.modal("hide");
				showList(pageNum);
			});// end update
		});//modalModBtn.on('click'
		
				
		modalRemoveBtn.on("click", function(){
			var replyNo = reply_modal.data("replyNo");
			replyService.remove(replyNo, function(result){
				alert(result);
				reply_modal.modal("hide");
				showList(pageNum);
			});// end remove
		});//modalRemoveBtn.on("click"
		
	});
</script>
<script>
	$(function() {
		var actionForm = $('#actionForm');
		$('.listBtn').click(function(e) {
			e.preventDefault();
			actionForm.find('input[name="boardNo"]').remove();
			actionForm.submit();
		});// end click
		$(".modBtn").click(function(e) {
			e.preventDefault();
			actionForm.attr('action', '/board/modify');
			actionForm.submit();
		});// end click
	});// end function
</script>
</body>
</html>