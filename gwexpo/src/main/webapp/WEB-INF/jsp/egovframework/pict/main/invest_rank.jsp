<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="./include/head.jsp" %>

<div class="investHeader">
    <h1>
        <a href="/front_main.do">
            <img src="../../../../../../front_img/mb-h-logo.webp" alt="로고">
        </a>
    </h1>
    <button class="navBtn">
        <img src="../../../../../../front_img/menu.webp" alt="메뉴버튼">
    </button>
    <div class="investNav">
    	<div class="navMenu">
    		<a href="#lnk"><img src="../../../../../../front_img/home.webp" alt="메뉴버튼"></a>
    		<button class="navBtn2">
        		<img src="../../../../../../front_img/menu.webp" alt="메뉴버튼">
    		</button>
    	</div>
    	<ul>
    		<li>
    			<a href="/invest_mypage.do">마이페이지</a>
    		</li>
    		<li>
    			<a href="/invest_certi.do">투자 인증서</a>
    		</li>
    	</ul>
    </div>
</div>
<main>
    <div class="investContent">
        <div class="contents01 invest" style="position:relative">
        	<h2>실시간 투자 현황</h2>
        	<c:if test="${fn:length(company_list) eq 0}">
	        	<div class="emptyPage">
					<p>아직 투자한 기업이 없습니다.</p>
				</div>
			</c:if>
			
        	<table class="rankTable">
				<tbody class="rankLists">
					<c:forEach var="company_list" items="${company_list}" varStatus="status">
						<tr class="rank">
							<td class="rankiPrize">
								<c:if test="${status.index == 0}">
									<img src="../../../../../../front_img/1.webp" alt="">
								</c:if>
								<c:if test="${status.index == 1}">
									<img src="../../../../../../front_img/2.webp" alt="">
								</c:if>
								<c:if test="${status.index == 2}">
									<img src="../../../../../../front_img/3.webp" alt="">
								</c:if>
							</td>
							<td class="rankName">${company_list.title}</td>
							<td class="rankPrice"><fmt:formatNumber value="${company_list.point}" pattern="#,###" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>			
	        <div class="bottomBtns">
	        	<a href="/user_invest.do" class="btn01">투자하기</a>
	        	<a href="/funding_info.do" class="btn02">투자 방법 보러가기</a>
	        </div>
        </div>
    </div>
</main>
<div class="investingFooter">
	<p>
		크라우드 펀딩은 선착순으로<br>
		사전등록한 인원만 참여 가능합니다.
	</p>
	<a href="/">
		<img src="../../../../../../front_img/investing-f.webp" alt="하단로고">
	</a>
</div>
<div class="alertModal01">
	<button><img src="../../../../../../front_img/close.webp" alt="닫기"></button>
	<div class="alertInner">
		<p>인증에 실패했습니다.</p>
		<p>성명과 전화번호를<br>다시 확인해주세요.</p>
		<a href="#lnk" class="button">다시 인증하기</a>
	</div>
</div>
<!-- <script type="text/javascript" src="../../../../../../js/rankboard.js"></script> -->
