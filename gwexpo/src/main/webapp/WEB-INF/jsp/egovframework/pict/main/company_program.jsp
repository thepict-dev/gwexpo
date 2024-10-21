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
	        <h2>기업 프로그램</h2>
	    </div>
	    <div class="subContainer">
	        <div class="subInner">
	            <ul class="program">
	                <li>
	                    <p>라이브커머스</p>
	                    <div class="proImg">
	                        <div class="back"></div>
	                        <img src="/img/user_img/com_program1.png" alt="">
	                        <p>기업의 주요 상품 판매를<br>촉진하기 위한 라이브 커머스를 진행합니다.</p>
	                    </div>
	                </li>
	                <li>
	                    <p>Shorts Shop</p>
	                    <div class="proImg">
	                        <div class="back"></div>
	                        <img src="/img/user_img/com_program2.png" alt="">
	                        <p>크리에이터에게 제품을 제공하고, <br>쇼츠 리뷰를 통해 바이럴 마케팅을 진행합니다.</p>
	                    </div>
	                </li>
	                <li>
	                    <p>IR 데모데이</p>
	                    <div class="proImg">
	                        <div class="back"></div>
	                        <img src="/img/user_img/com_program3.png" alt="">
	                        <p>각 분야의 전문가와 투자자를 초청하여, 직접적인 투자 유치와 전문 피드백을 받을 수 있는 기회를 제공합니다.</p>
	                    </div>
	                </li>
	                <li>
	                    <p>이미지 메이킹</p>
	                    <div class="proImg">
	                        <div class="back"></div>
	                        <img src="/img/user_img/com_program4.png" alt="">
	                        <p>원하는 이미지를 효과적으로 연출할 수 있도록 돕는 데일리 메이크업 체험 프로그램을 제공합니다.</p>
	                    </div>
	                </li>
	                <li>
	                    <p>퍼스널 컬러</p>
	                    <div class="proImg">
	                        <div class="back"></div>
	                        <img src="/img/user_img/com_program5.png" alt="">
	                        <p>색채학을 활용해 개인에게 가장 잘 어울리는 컬러를<br>찾아드리는 맞춤형 컬러 컨설팅을 제공합니다.</p>
	                    </div>
	                </li>
	                <li>
	                    <p>기업 대상 법률 자문</p>
	                    <div class="proImg">
	                        <div class="back"></div>
	                        <img src="/img/user_img/com_program6.png" alt="">
	                        <p>기업 운영 과정에서 발생할 수 있는<br>법적 문제에 대한 자문을 제공합니다.</p>
	                    </div>
	                </li>
	            </ul>
	        </div>
	    </div>	
	   	<%@include file="./include/footer.jsp" %>
    </body>
</html>
