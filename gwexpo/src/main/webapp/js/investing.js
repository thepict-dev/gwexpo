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
