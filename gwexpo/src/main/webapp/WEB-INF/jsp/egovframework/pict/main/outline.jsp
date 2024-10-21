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
	<div class="subContainer">
        <div class="subInner sm">
            <div class="outlineContainer">
                <span><img src="/img/user_img/poster.png" alt=""></span>
                <div class="outTexts">
                    <h3>2024 강원 바이오엑스포<br>
                        &제2회 춘천 창업엑스포</h3>
                    <ul class="outlines">
                        <li>
                            <span>행사명</span>
                            <p>2024 강원 바이오엑스포 & 제2회 춘천 창업엑스포</p>
                        </li>
                        <li>
                            <span>기간</span>
                            <p>2024. 11. 6.(수) ~ 8.(금) / 3일간</p>
                        </li>
                        <li>
                            <span>장소</span>
                            <p>춘천 송암 인라인스케이트장 일대 및 춘천 베어스 호텔</p>
                        </li>
                        <li>
                            <span>주최</span>
                            <p>춘천시</p>
                        </li>
                        <li>
                            <span>주관</span>
                            <p>(재)춘천바이오산업진흥원</p>
                        </li>
                        <li>
                            <span>슬로건</span>
                            <p>강원 바이오의 새 울림, 그리고 어울림</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
   	<%@include file="./include/footer.jsp" %>
    </body>
</html>
