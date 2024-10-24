<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
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
                                        <img src="${company.file_url}" alt="${company.title}">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/img/user_img/company-logo.png" alt="기본 이미지">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <p>${company.title}</p>
                            <span>${company.industry}</span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <%@include file="./include/footer.jsp" %>
</body>
</html>