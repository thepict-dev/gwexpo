<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<c:import url="./include/head.jsp">
    <c:param name="pageTitle" value="2024강원바이오엑스포&제2회창업엑스포"/>
</c:import>
<body>
    <%@include file="./include/header.jsp" %>
    <div class="subTop">
        <p>전시관</p>
        <h2>참가 기업 안내</h2>
    </div>
    <div class="subContainer">
        <div class="subInner">
            <div class="tabInner active">
                <ul class="companyLists">
                    <c:forEach var="company" items="${companyList}">
                        <li>
                            <div class="logoImg">
                                <c:choose>
                                    <c:when test="${not empty company.file_url}">
                                        <img src="https://www.gwexpo.co.kr${company.file_url}" alt="${company.title}">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/img/user_img/company-logo.png" alt="기본 이미지">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <p>${company.title}</p>
                            <span>
                            	<c:if test="${fn:contains(company.industry, '1')}">바이오의약<br></c:if>
                            	<c:if test="${fn:contains(company.industry, '2')}">체외진단<br></c:if>
                            	<c:if test="${fn:contains(company.industry, '3')}">건강기능식품 및 소재<br></c:if>
                            	<c:if test="${fn:contains(company.industry, '4')}">화장품 및 화장품 소재<br></c:if>
                            	<c:if test="${fn:contains(company.industry, '5')}">바이오소재(환경,농업)<br></c:if>
                            	<c:if test="${fn:contains(company.industry, '6')}">식품·로컬<br></c:if>
                            	<c:if test="${fn:contains(company.industry, '7')}">창작·공예<br></c:if>
                            	<c:if test="${fn:contains(company.industry, '8')}">IT · AI · 기술 · 관광 · 콘텐츠</c:if>
                           	</span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <%@include file="./include/footer.jsp" %>
</body>
</html>