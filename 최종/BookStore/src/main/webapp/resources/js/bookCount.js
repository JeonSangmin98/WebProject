//console.log("test");
$(".image").each(function(index, element) {
		if ($(element).data("bookcount") == 0) {
			$(element).attr("src", "/resources/img/soldout.png");
		}
	});