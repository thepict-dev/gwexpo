<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
	<c:import url="./include/head.jsp">
    	<c:param name="pageTitle" value="2024강원바이오엑스포&제2회창업엑스포"/>
    </c:import>
    <body>
	   	<%@include file="./include/header.jsp" %>
   	    <div class="subContainer">
	        <div class="subInner">
	            <div class="viewContainer">
	                <div class="viewTop">
	                    <p class="viewTitle">${pictVO.title}</p>
	                    <span class="viewDate">${fn:substring(pictVO.reg_date,0,11) }</span>
	                </div>
	                <div class="viewBottom">
	                    <p>${pictVO.text}</p>
	                </div>
	                <c:if test="${pictVO.file_url1 ne '' && pictVO.file_url1 ne null && pictVO.file_url1 ne undefined}">
		                <div class="addFile">
		                    <a href="${pictVO.file_url1}" download>
		                        <img src="/img/user_img/file.png" alt="">${fn:split(pictVO.file_url1,'/')[3]}
		                    </a>
		                </div>
	                </c:if>
	                <div class="fullButtonContainer">
	                    <a href="javascript:history.back()" class="wt view">목록으로</a>
	                </div>
	            </div>
	        </div>
	    </div>
	   	<%@include file="./include/footer.jsp" %>
    </body>
</html>
