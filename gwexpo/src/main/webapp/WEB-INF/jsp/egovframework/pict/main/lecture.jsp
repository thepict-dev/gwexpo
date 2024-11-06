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
	        <h2>특별 강연</h2>
	    </div>
	    <div class="subContainer">
	        <div class="subInner">
	            <ul class="lectureLists">
	                <li>
	                    <div class="lecImg">
	                        <img src="/img/user_img/lecture1-1.png" alt="" class="bk">
	                        <img src="/img/user_img/lecture1-2.png" alt="" class="col">
	                    </div>
	                    <div class="lecText">
	                        <span class="lecCategory">온라인콘텐츠창작자</span>
	                        <p>궤도</p>
	                        <span class="lecDesc">연세대학교 대학원 천문우주학 박사과정<br>한국천문연구원 우주감시센터</span>
	                    </div>
	                </li>
	                <li>
	                    <div class="lecImg">
	                        <img src="/img/user_img/lecture2-1.png" alt="" class="bk">
	                        <img src="/img/user_img/lecture2-2.png" alt="" class="col">
	                    </div>
	                    <div class="lecText">
	                        <span class="lecCategory">생명과학, 의학 분야 유튜버</span>
	                        <p>약</p>
	                        <span class="lecDesc">중앙대학교 대학원 약학 박사<br>제약회사 퇴사 후 유튜버로 활동</span>
	                    </div>
	                </li>
	                <li>
	                    <div class="lecImg">
	                        <img src="/img/user_img/lecture3-1.png" alt="" class="bk">
	                        <img src="/img/user_img/lecture3-2.png" alt="" class="col">
	                    </div>
	                    <div class="lecText">
	                        <span class="lecCategory">언바운드랩데브</span>
	                        <p>조용민</p>
	                        <span class="lecDesc"> 전 구글코리아 상무<br>미국 스탠퍼드대학교 대학원 졸업</span>
	                    </div>
	                </li>
	                <li>
	                    <div class="lecImg">
	                        <img src="/img/user_img/lecture4-2.png" alt="" class="bk">
	                        <img src="/img/user_img/lecture4-1.png" alt="" class="col fourth">
	                    </div>
	                    <div class="lecText">
	                        <span class="lecCategory">유튜버</span>
	                        <p>미키김</p>
	                        <span class="lecDesc"></span>
	                    </div>
	                </li>
	            </ul>
	        </div>
	    </div>
	   	<%@include file="./include/footer.jsp" %>
    </body>
</html>
