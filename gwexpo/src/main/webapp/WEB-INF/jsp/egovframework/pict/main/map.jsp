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
        <p>행사 안내</p>
        <h2>행사장 안내도</h2>
    </div>
    <div class="subContainer">
        <div class="subInner sm">
            <div class="mapImg">
                <img src="/img/user_img/map.png" alt="">
            </div>
            <div class="buttonContainer">
                <a href="/img/user_img/map.png" download="">행사장 배치도 다운로드<span><img src="/img/user_img/download.png" alt=""></span></a>
            </div>
        </div>
    </div>
   	<%@include file="./include/footer.jsp" %>
    </body>
</html>
