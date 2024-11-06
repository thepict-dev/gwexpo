<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="./include/head.jsp" %>
<%@ include file="./include/invest_header.jsp" %>

<main>
	<div class="investTnner">
		<form action="" id="register" name="register" method="post" enctype="multipart/form-data" autocomplete="off" class="form invest">
			<p>${pictVO.name}님이 고른 기업은</p>
	        <select class="companySelect" name="company_id" id="company_id" style="width: 100%;">
				<option value="" class="selectPlace" style="color: rgba(255, 255, 255, 0.5);">기업을 선택하세요</option>
				<c:forEach var="company_list" items="${company_list}" varStatus="status">
					<c:if test="${company_list.idx < 18 || company_list.idx > 22}">
						<option value="${company_list.idx}">${company_list.title}</option>
					</c:if>
				</c:forEach>
			</select>
			<p style="margin-bottom: 116px;">얼마나 투자하시겠어요?</p>
			<div class="wonInput">
				<span class="smtit" id="money">남은 포인트</span>
				<input type="number" placeholder="${pictVO.point}" id="point" name="point"/>
				<span class="won"></span>
			</div>
			<div class="bottomBtns">
				<a href="#lnk" onclick="button1_click()" class="btn01">투자할게요</a>
			</div>
			<input type='hidden' name="idx" id="idx" value='${pictVO.idx}' />
		</form>
	</div>
</main>
<div class="investingFooter invest">
	<p>
		<span>내가 투자한 포인트는 회수할 수 없으니</span><br>
		신중하게 투자해주세요
	</p>
	<a href="/">
		<img src="/img/user_img/mb-logo.png" alt="하단로고">
	</a>
</div>
<div class="alertModal02" id="fund_pop">
	<button onclick="btn_close()"><img src="/img/user_img/close.png" alt="닫기"></button>
	<div class="alertInner">
		<p style="font-size: 22px; font-weight: 500; text-align: center; line-height: 1.64; letter-spacing: -0.88px; display: none" id="suc_p">감사합니다! 기업에게<br>성공적으로 투자했어요! 😆</p>
		<p style="font-size: 22px; font-weight: 500; text-align: center; line-height: 1.64; letter-spacing: -0.88px; display: none" id="suc_c">총 투자금액이 목표치에 도달하여<br>투자하실 수 없습니다.</p>
		<p style="font-size: 22px; font-weight: 500; text-align: center; line-height: 1.64; letter-spacing: -0.88px; display: none" id="suc_e">투자에 실패하였습니다.<br>관리자에게 문의해주세요.</p>
		
		<button class="button" style="color: #000; border: 1px solid #000;" onclick="btn_close()">확인</button>
	</div>
</div>
<input type="hidden" id="fund" value=""/>
<script src="/js/investing.js"></script>
<script>

	$("#point").bind("keyup",function(){
		var point = $('#point').val();
		if(point != undefined && point != ''){
			$('#money').css("display", "none")
		}
		else{
			$('#money').css("display", "block")
		}
	});

	function button1_click() {
		var company_id = $('#company_id').val()
		var point = $('#point').val()
		var classify = "${pictVO.classify}";
		var user_point = "${pictVO.point}";
		var total_point = "${vo.point}";
		var standard_point = "${vo2.maximum}"
		var today = "";
		var year = new Date().getFullYear();
		var mon = new Date().getMonth()+1
		if(mon < 10) mon = '0'+mon
		var day = new Date().getDate()
		if(day < 10) day = '0'+day
		today = year + '-' + mon + '-' + day
		
		var hours = new Date().getHours();
		var minutes = new Date().getMinutes();
		if(minutes < 10) minutes = '0'+minutes
		
		var seconds = new Date().getSeconds();
		if(seconds < 10) seconds = '0'+seconds
		
		var now = hours + ":"+ minutes+ ":"+seconds
		
		if (company_id == "" || company_id == undefined) {
			window.alert("투자 할 회사를 선택해주세요.");
			$('#company_id').focus();
			return false;
		}
		if (point == "" || point == undefined) {
			window.alert("투자 할 금액을 입력해주세요.");
			$('#point').focus();
			return false;
		}
		else if(point < 0){
			window.alert("투자 할 금액은 음수로 입력하실 수 없습니다.");
			$('#point').focus();
			return false;
		}
		else if(point % 1000000 != 0){
			window.alert("투자 할 금액은 1,000,000원 단위로만 가능합니다.");
			$('#point').focus();
			return false;
		}
		else if(Number(point) > Number(user_point)){
			window.alert("투자 할 금액은 보유금액보다 클 수 없습니다.\n보유 금액 : " + user_point);
			$('#point').focus();
			return false;
		}
		
		var text = "해당 회사에 투자하시겠습니까?";
	
		var param = {
				company_id : company_id,
				point : point,
				idx : $('#idx').val()
		}
		if (confirm(text)) {
			$.ajax({
				url : "/user_invest_save.do"
				, type : "POST"
				, data : JSON.stringify(param)
				, contentType : "application/json"
				, dataType : "json"
				, async : false
				, success : function(data, status, xhr) {
					if(data == 'Y'){
						console.log("펀딩성공")
						$('#fund').val("p")
						$('#fund_pop').css('display', 'block');
						$('#suc_p').css('display', 'block');
						
					}
					else{
						console.log("펀딩실패")
						$('#fund').val("c")
						$('#fund_pop').css('display', 'block');
						$('#suc_c').css('display', 'block');
						
					}
				}
				, error : function(xhr, status, error) {
					$('#fund').val("e")
					$('#fund_pop').css('display', 'block');
					$('#suc_e').css('display', 'block');
				}
			});
		}
		
		//if (confirm(text)) {
			//$("#register").attr("action", "/user_invest_save.do");
			//$("#register").submit();
		//}
	}
	function btn_close(){
		var fund = $('#fund').val();
		if(fund == 'p'){
			location.href ="/invest_mypage.do"
		}
		else{
			location.href ="/invest_rank.do"
		}
	}
</script>