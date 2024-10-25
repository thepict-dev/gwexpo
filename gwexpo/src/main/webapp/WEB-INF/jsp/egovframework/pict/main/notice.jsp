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
	        <h2>체험 프로그램</h2>
	    </div>
	    <div class="subContainer">
	        <div class="subInner">
	            <ul class="noticeLists">
	            	<c:forEach var="resultList" items="${resultList}" varStatus="status">
		                <li>
		                    <a href="/notice_view.do?idx=${resultList.idx}">
		                        <span>
		                        	<c:if test="${resultList.img_url ne '' && resultList.img_url ne null && resultList.img_url ne undefined}">
		                        		<img src="${resultList.img_url}" alt="">
		                        	</c:if>
		                        	<c:if test="${resultList.img_url eq '' || resultList.img_url eq null || resultList.img_url eq undefined}">
		                        		<img src="/img/user_img/test.webp" alt="">
	                        		</c:if>
	                        	</span>
		                        <p class="ntTitle">${resultList.title}</p>
		                        <p class="ntDate">${resultList.reg_date}</p>
		                    </a>
		                </li>
	                </c:forEach>
	            </ul>
	        </div>
	    </div>
	   	<%@include file="./include/footer.jsp" %>
    </body>
</html>
