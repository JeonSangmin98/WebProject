//console.log("Review Module.........");
var reviewService = (function() {
	function add(review, callback, error) {
		console.log("add review..........");
		$.ajax({
			type : 'post',
			url : '/reviews/new',
			data : JSON.stringify(review),
			contentType : 'application/json;charset=UTF-8',
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) { error(er) }
			}
		});
	}// end add
	
	function getList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/reviews/pages/" + bno + "/" + page + ".json",
			function(data) {
				if(callback) {
					// callback(data); //리뷰 목록만 가져오는 경우 
					callback(data.reviewCnt, data.list); //리뷰 숫자와 목록을 가져오는 경우
				}
			}).fail(function(xhr, status, err) {
				if(error) { error(er) }
			});
	}// getList
	
	function remove(reviewNo, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/reviews/' + reviewNo,
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) { error(er) }
			}
		});
	}//remove
	
	function update(review, callback, error) {
		$.ajax({
			type : 'put',
			url : '/reviews/' + review.reviewNo,
			data : JSON.stringify(review),
			contentType : 'application/json;charset=UTF-8',
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) { error(er) }
			}
		});
	}//update
	
	function get(reviewNo, callback, error) {
		$.get("/reviews/" + reviewNo + ".json", function(result){
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, er){
			if(error) { error(er) }
		});
	}// get
	
	function displayTime(timeValue) {
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		if(gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			// 시 : 분 : 초(01:01:01 or 11:11:11)
			//['01',':','01',':','01'].join('')
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
			':', (ss > 9 ? '' : '0') + ss].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; //getMonth() is zero-based 0부터 시작이기 때문
			var dd = dateObj.getDate();
			
			// 년 / 월 / 일
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
		}
	}// displayTime
	
	return {add : add,
			getList : getList,
			remove : remove,
			update : update,
			get : get,
			displayTime : displayTime};
})();