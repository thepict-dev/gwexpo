<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
	<c:import url="./include/head.jsp">
    	<c:param name="pageTitle" value="2024강원바이오엑스포&제2회창업엑스포"/>
    </c:import>
    <body>
	   	<%@include file="./include/header.jsp" %>
	    <div class="subTop">
	        <p>프로그램</p>
	        <h2>개막식</h2>
	    </div>
	    <div class="subContainer">
	        <div class="subInner sm">
	            <div class="locationTitle opening">
	                <p>
	                    <img src="/img/user_img/location.png" alt="">
	                    전시관 대형 텐트 내 메인무대
	                </p>
	                <p>
	                    <img src="/img/user_img/time.png" alt="">
	                    2024년 11월 07일(목) 11:00~12:00
	                </p>
	            </div>
	            <div class="scheImg">
	                <img src="/img/user_img/opening.png" alt="">
	            </div>
	        </div>
	    </div>
	   	<%@include file="./include/footer.jsp" %>
    </body>
</html>
