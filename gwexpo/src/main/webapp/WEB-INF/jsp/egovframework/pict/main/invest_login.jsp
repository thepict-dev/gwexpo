<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="./include/head.jsp" %>
<script>
function fn_login() {

	if ($("#name").val() == "") {
		alert("이름을 입력하세요.");
		$("#name").focus();
		return false;
	}
	if ($("#mobile").val() == "") {
		alert("휴대전화번호를 입력하세요.");
		$("#mobile").focus();
		return false;
	}
	
	var param = {
			name : $('#name').val(),
			mobile : $('#mobile').val()
		}

		
	$.ajax({
		url : "/invest_login_action.do"
		, type : "POST"
		, data : JSON.stringify(param)
		, contentType : "application/json"
		, dataType : "json"
		, async : false
		, success : function(data, status, xhr) {
			if(data == 'Y'){
				console.log("인증성공")
				location.href="/user_invest.do"
			}
			else{
				$('#login_fail').css('display', 'block')
			}
		}
		, error : function(xhr, status, error) {
			$('#login_fail').css('display', 'block')
		}
	});
	
	
	//document.loginForm.action = "/invest_login_action.do";
	//document.loginForm.submit();
	
}

	function btn_close(){
		$('#login_fail').css('display', 'none')
	}
</script>


<div class="investHeader">
    <h1>
        <a href="/invest_login.do">
            <img src="/img/user_img/mb-logo.png" alt="로고">
        </a>
    </h1>
    <button class="navBtn">
        <img src="/img/user_img/menu.png" alt="메뉴버튼">
    </button>
    <div class="investNav">
    	<div class="navMenu">
    		<a href="#lnk"><img src="../../../../../../front_img/home.webp" alt="메뉴버튼"></a>
    		<button class="navBtn2">
        		<img src="../../../../../../front_img/menu.webp" alt="메뉴버튼">
    		</button>
    	</div>
    	<ul>
    		<li>
    			<a href="/invest_mypage.do">마이페이지</a>
    		</li>
    		<li>
    			<a href="/invest_certi.do">투자 인증서</a>
    		</li>
    	</ul>
    </div>
</div>
<main>
    <div class="investContent">
        <div class="investTnner">
        	<p>크라우드 펀딩을 위한<br>로그인을 해주세요.</p>
	        <form action="#" id="loginForm" name="loginForm" method="post" class="form">
	        	<input type="text" placeholder="이름" onkeypress="if(event.keyCode == 13){fn_login();}" autocomplete="off" id="name" name="name">
	        	<input type="text" placeholder="연락처" style="margin-top: 33px;" onkeypress="if(event.keyCode == 13){fn_login();}" autocomplete="off" id="mobile" name="mobile">
	        </form>
	        <div class="bottomBtns">
	        	<a href="#lnk" onclick="javascript:fn_login();" class="btn01">사전등록 인증하기</a>
	        </div>
        </div>
    </div>
</main>

<div class="investingFooter">
	<a href="/">
		<img src="/img/user_img/mb-logo.png" alt="하단로고">
	</a>
</div>
<div class="alertModal01" id="login_fail">
	<button onclick="btn_close()"><img src="../../../../../../front_img/close.webp" alt="닫기"></button>
	<div class="alertInner">
		<p>인증에 실패했습니다.</p>
		<p>성명과 전화번호를<br>다시 확인해주세요.</p>
		<a href="#lnk" onclick="btn_close()" class="button">다시 인증하기</button>
	</div>
</div>

