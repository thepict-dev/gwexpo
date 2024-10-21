//네비
$('.navBtn').click(function(){
	$('.investNav').stop().fadeIn(500);
});
$('.navBtn2').click(function(){
	$('.investNav').stop().fadeOut(500);
});

// 셀렉트2
$('.companySelect').select2().on('select2:open', function(e){
    $('.select2-search__field').attr('placeholder', '검색어를 입력하세요');
})

function downImg(){
	html2canvas($("#certi-img")[0]).then(function(canvas) {
		var img = canvas.toDataURL();
		var fileNm = "파일명";
		downloadURI(img,"certi.png") 
  });
}

function downloadURI(uri, name){
	var link = document.createElement("a")
	link.download = name;
	link.href = uri;
	document.body.appendChild(link);
	link.click();
}