<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="./include/head.jsp" %>
<%@ include file="./include/invest_header.jsp" %>

<main>
	<div class="investTnner certi">
		<p>투자 인증서</p>
		<div id="certi-img" class="certiImg">
			<div class="certiInner">
				<span class="certi1"><img src="/img/user_img/certi1.png" alt=""></span>
				<span class="certiTitle"><img src="/img/user_img/certi_title.webp" alt=""></span>
				<span class="line"></span>
				<span class="certi2"><img src="/img/user_img/certi2.png" alt=""></span>
				<span class="certi4"><img src="/img/user_img/certi4.webp" alt=""></span>
				<p class="txt1" style="white-space: nowrap"><span>${pictVO.name}</span>님은<br>2024년 11월<span>06</span>일</p>
				<ul class="certiComp">
					<c:forEach var="resultList" items="${resultList}" varStatus="status">
						<li>${resultList.title}</li>
					</c:forEach>
				</ul>
				<p class="txt2">기업에게 투자하였습니다.</p>
				<p class="txt3">2024년 11월<span>06</span>일</p>
			</div>
			<img src="/img/user_img/certi3.webp" class="certi3" alt="">
		</div>
	</div>
	<div class="bottomBtns certi">
		<a onclick="downImg()" href="#lnk" class="btn01">인증서 다운로드</a>
	</div>
</main>
<div class="investingFooter myPage">
	<a href="/">
		<img src="/img/user_img/mb-logo.png" alt="하단로고">
	</a>
</div>
<script>
	function downImg(){
		html2canvas($("#certi-img")[0]).then(function(canvas) {
			var img = canvas.toDataURL();
			var fileNm = "파일명";
			downloadURI(img,"투자인증서.png") 
	  });
	}
	
	function downloadURI(uri, name){
		var link = document.createElement("a")
		link.download = name;
		link.href = uri;
		document.body.appendChild(link);
		link.click();
}
</script>