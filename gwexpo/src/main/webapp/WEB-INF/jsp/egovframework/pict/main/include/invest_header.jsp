<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String url = request.getRequestURL().toString();
	pageContext.setAttribute("url", url);
	
%>

<div class="investHeader">
    <a href="/invest_login.do"><img src="/img/user_img/mb-logo.png" alt="홈"></a>
    <button class="navBtn">
        <img src="/img/user_img/menu.png" alt="메뉴버튼">
    </button>
    <div class="investNav">
    	<div class="navMenu">
    		<a href="/"><img src="/img/user_img/mb-logo.png" alt="홈"></a>
    		<button class="navBtn2">
        		<img src="/img/user_img/menu.png" alt="메뉴버튼">
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