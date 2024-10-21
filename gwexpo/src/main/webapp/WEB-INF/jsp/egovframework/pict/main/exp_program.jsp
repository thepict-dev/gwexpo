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
	            <ul class="program">
	                <li>
	                    <p>시민참여 크라우드 펀딩</p>
	                    <div class="proImg">
	                        <div class="back"></div>
	                        <img src="/img/user_img/exp1.png" alt="">
	                        <p>방문객이 직접 투자에 참여하고, 우수 창업 결과물을<br>알릴 수 있는 투자 유치 기회를 제공합니다.</p>
	                    </div>
	                </li>
	                <li>
	                    <p>바이오 지식 퀴즈</p>
	                    <div class="proImg">
	                        <div class="back"></div>
	                        <img src="/img/user_img/exp2.png" alt="">
	                        <p>바이오 관련 지식 퀴즈를 통해 재미있게<br>바이오 지식을 배우고 익히는 시간을 제공합니다.</p>
	                    </div>
	                </li>
	                <li>
	                    <p>메이커스페이스</p>
	                    <div class="proImg">
	                        <div class="back"></div>
	                        <img src="/img/user_img/exp3.png" alt="">
	                        <p>아이디어를 현실로 구현할 수 있도록 강원 메이커스페이스에서 다양한 창작물을 만들어볼 수 있습니다.</p>
	                    </div>
	                </li>
	                <li>
	                    <p>어린이 사생대회</p>
	                    <div class="proImg">
	                        <div class="back"></div>
	                        <img src="/img/user_img/exp4.png" alt="">
	                        <p>바이오와 자연을 주제로 도화지를 채우는<br>어린이 사생대회를 진행합니다.</p>
	                    </div>
	                </li>
	                <li>
	                    <p>키자니아 GO</p>
	                    <div class="proImg">
	                        <div class="back"></div>
	                        <img src="/img/user_img/exp5.png" alt="">
	                        <p>다양한 분야의 직업 체험을 통해 어린이들의<br>만족도를 높이는 테마파크를 운영합니다.</p>
	                    </div>
	                </li>
	            </ul>
	        </div>
	    </div>	
	   	<%@include file="./include/footer.jsp" %>
    </body>
</html>
