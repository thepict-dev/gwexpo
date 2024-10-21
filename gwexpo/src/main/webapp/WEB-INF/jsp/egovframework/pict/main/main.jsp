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
    <!-- 
	    <div class="IntroContainer">
	        <p>강원 바이오의 <span>새 울림</span></p>
	        <div class="imgTitle">
	            <p>그리고</p>
	            <img src="/img/user_img/cube.png" alt="">
	            <span>어울림</span>
	        </div>
	    </div>
	     -->
    	<%@include file="./include/header.jsp" %>
   	    <main>
   			<!-- 
	        <div class="fundingBanner">
	            <a href="">
	                <p>
	                    <span>혁신적인 기업에게 투표하세요</span>
	                    크라우드 펀딩 OPEN
	                </p>
	                <img src="/img/user_img/cube-none.png" alt="">
	            </a>
	        </div>
	     	-->
	        <div class="IntroSection">
	            <p>강원 바이오의 <span>새 울림</span></p>
	            <div class="IntroSecTitle">
	                <p>그리고</p>
	                <img src="/img/user_img/cube.png" alt="">
	                <span>어울림</span>
	            </div>
	        </div>
	        <div class="hexContainer">
	            <h2 class="subTitles pc">
	                바이오 혁신과 창업 기회를 한자리에서 만나는
	                <span>새로운 인사이트의 장을 선사합니다</span>
	            </h2>
	            <h2 class="subTitles mb">
	                바이오 혁신과 창업 기회를<br>한자리에서 만나는
	                <span>새로운 인사이트의<br>장을 선사합니다</span>
	            </h2>
	            <div class="hexContents">
	                <div class="hexTop">
	                    <a href="" class="hex">
	                        <img src="/img/user_img/hex1.png" alt="" class="hexImg1">
	                        <img src="/img/user_img/hex1-2.png" alt="" class="hexImg2">
	                        <p>체험 프로그램 <img src="/img/user_img/link.png" alt=""></p>
	                    </a>
	                    <a href="" class="hex">
	                        <img src="/img/user_img/hex2.png" alt="" class="hexImg1">
	                        <img src="/img/user_img/hex2-2.png" alt="" class="hexImg2">
	                        <p>기업대상법률자문 <img src="/img/user_img/link.png" alt=""></p>
	                    </a>
	                    <a href="" class="hex">
	                        <img src="/img/user_img/hex3.png" alt="" class="hexImg1">
	                        <img src="/img/user_img/hex3-2.png" alt="" class="hexImg2">
	                        <p>IR 데모데이 <img src="/img/user_img/link.png" alt=""></p>
	                    </a>
	                </div>
	                <div class="hexBottom">
	                    <a href="" class="hex">
	                        <img src="/img/user_img/hex4.png" alt="" class="hexImg1">
	                        <img src="/img/user_img/hex4-2.png" alt="" class="hexImg2">
	                        <p>크라우드펀딩 <img src="/img/user_img/link.png" alt=""></p>
	                    </a>
	                    <a href="" class="hex">
	                        <img src="/img/user_img/hex5.png" alt="" class="hexImg1">
	                        <img src="/img/user_img/hex5-2.png" alt="" class="hexImg2">
	                        <p>메이커스페이스 <img src="/img/user_img/link.png" alt=""></p>
	                    </a>
	                </div>
	            </div>
	        </div>
	        <div class="companyContainer">
	            <h2 class="subTitles pc">
	                미래 산업을 이끌어갈
	                <span>혁신적 바이오·창업 선도 기업들을 소개합니다</span>
	            </h2>
	            <h2 class="subTitles mb">
	                미래 산업을 이끌어갈
	                <span>혁신적 바이오·창업<br>선도 기업들을 소개합니다</span>
	            </h2>
	            <ul class="companies">
	                <li><img src="/img/user_img/company-logo.png" alt=""></li>
	                <li><img src="/img/user_img/company-logo.png" alt=""></li>
	                <li><img src="/img/user_img/company-logo.png" alt=""></li>
	                <li><img src="/img/user_img/company-logo.png" alt=""></li>
	                <li><img src="/img/user_img/company-logo.png" alt=""></li>
	                <li><img src="/img/user_img/company-logo.png" alt=""></li>
	                <li><img src="/img/user_img/company-logo.png" alt=""></li>
	                <li><img src="/img/user_img/company-logo.png" alt=""></li>
	                <li><img src="/img/user_img/company-logo.png" alt=""></li>
	                <li><img src="/img/user_img/company-logo.png" alt=""></li>
	                <li><img src="/img/user_img/company-logo.png" alt=""></li>
	                <li><img src="/img/user_img/company-logo.png" alt=""></li>
	            </ul>
	        </div>
	        <div class="noticeContainer">
	            <h2 class="subTitles notice pc">
	                엑스포와 관련된 주요 정보 내용을 제공합니다
	                <span>최신 소식을 확인하세요</span>
	            </h2>
	            <h2 class="subTitles notice mb">
	                엑스포와 관련된<br>주요 정보 내용을 제공합니다
	                <span>최신 소식을 확인하세요</span>
	            </h2>
	            <div class="noticeButton">
	                <a href="">공지사항 보러가기<span><img src="/img/user_img/add.png" alt=""></span></a>
	            </div>
	            <ul class="noticeLists">
	                <li>
	                    <a href="/notice_view.do">
	                        <span><img src="/img/user_img/test.webp" alt=""></span>
	                        <p class="ntTitle">참가 기업 안내 및 주요 일정 공지</p>
	                        <p class="ntDate">2024. 10. 21. 10:23</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="/notice_view.do">
	                        <span><img src="/img/user_img/test.webp" alt=""></span>
	                        <p class="ntTitle">참가 기업 안내 및 주요 일정 공지</p>
	                        <p class="ntDate">2024. 10. 21. 10:23</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="/notice_view.do">
	                        <span><img src="/img/user_img/test.webp" alt=""></span>
	                        <p class="ntTitle">참가 기업 안내 및 주요 일정 공지</p>
	                        <p class="ntDate">2024. 10. 21. 10:23</p>
	                    </a>
	                </li>
	                <li>
	                    <a href="/notice_view.do">
	                        <span><img src="/img/user_img/test.webp" alt=""></span>
	                        <p class="ntTitle">참가 기업 안내 및 주요 일정 공지</p>
	                        <p class="ntDate">2024. 10. 21. 10:23</p>
	                    </a>
	                </li>
	            </ul>
	        </div>
	    </main>
    	<%@include file="./include/footer.jsp" %>
	    <script>
	    	/*
	        const introContainer = document.querySelector('.IntroContainer');
	        const mainText = introContainer.querySelector('p');
	        const cubeImg = introContainer.querySelector('.imgTitle img');
	        const grText = introContainer.querySelector('.imgTitle p');
	        const lastText = introContainer.querySelector('.imgTitle span');
	
	        function showElement(element, delay) {
	            setTimeout(() => {
	                element.classList.add('show');
	            }, delay);
	        }
	
	        function startAnimation() {
	            showElement(mainText, 500);
	            showElement(cubeImg, 1500);
	            showElement(grText, 2500);
	            showElement(lastText, 3000);
	
	            setTimeout(() => {
	                introContainer.classList.add('fade-out');
	            }, 4000);
	        }
	
	        startAnimation();
	        */
	    </script>
    </body>
</html>
