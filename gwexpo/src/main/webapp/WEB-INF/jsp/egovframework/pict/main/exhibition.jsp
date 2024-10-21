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
	        <p>전시관</p>
	        <h2>전시관 배치도</h2>
	    </div>
	    <div class="empty">
	        <img src="/img/user_img/empty.png" alt="">
	        <div class="emptyText">
	            <p>콘텐츠 <span>준비중입니다</span></p>
	            <p class="pc">빠른 시일내에 준비하여 찾아뵙겠습니다</p>
	            <p class="mb">빠른 시일내에<br>준비하여 찾아뵙겠습니다</p>
	        </div>
	    </div>
	   	<%@include file="./include/footer.jsp" %>
    </body>
</html>
