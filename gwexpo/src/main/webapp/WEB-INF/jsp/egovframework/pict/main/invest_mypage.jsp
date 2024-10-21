<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="./include/head.jsp" %>
<%@ include file="./include/invest_header.jsp" %>

<main>
	<div class="investTnner myPage">
		<div class="myTop">
			<p>마이페이지</p>
			<p>내가 투자한 기업 현황을 확인할 수 있어요.<br>투자자의 개인정보는 투자 받는 기업에게 제공되지 않습니다.</p>
		</div>
		<div class="myList">
			<c:if test="${listSize ne 0}">
				
				<ul>
					<c:forEach var="resultList" items="${resultList}" varStatus="status">
						<li>
							<p class="myNum">${status.count}</p>
							<div class="myNames">
								<p>${resultList.title}</p>
								<span><fmt:formatNumber value="${resultList.point}" pattern="#,###" />원</span>
							</div>
							<p class="mydrade">${resultList.rnum}위</p>
						</li>
					</c:forEach>
				</ul>
				
			</c:if>
			<c:if test="${listSize eq 0}">
				<div class="emptyPage">
					<p>아직 투자한 기업이 없습니다.</p>
				</div>
			</c:if>
		</div>
	</div>
	<div class="bottomBtns myPage">
		<a href="/user_invest.do" class="btn01">다른 기업에 투자하기</a>
	</div>
</main>
<div class="investingFooter myPage">
	<a href="/">
		<img src="/img/user_img/mb-logo.png" alt="하단로고">
	</a>
</div>
<script src="/js/investing.js"></script>
