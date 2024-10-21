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
	        <div class="subInner">
	            <ul class="tabNav">
	                <li class="active"><a href="#">카테고리 1</a></li>
	                <li><a href="#">카테고리 2</a></li>
	                <li><a href="#">카테고리 3</a></li>
	                <div class="slider"></div>
	            </ul>
	            <div class="tabInner active">
	                <ul class="companyLists">
	                    <li>
	                        <div class="logoImg"><img src="/img/user_img/company-logo.png" alt=""></div>
	                        <p>기업명</p>
	                        <span>전시제품명이 이곳에 들어갑니다</span>
	                    </li>
	                    <li>
	                        <div class="logoImg"><img src="/img/user_img/company-logo.png" alt=""></div>
	                        <p>기업명</p>
	                        <span>전시제품명이 이곳에 들어갑니다</span>
	                    </li>
	                    <li>
	                        <div class="logoImg"><img src="/img/user_img/company-logo.png" alt=""></div>
	                        <p>기업명</p>
	                        <span>전시제품명이 이곳에 들어갑니다</span>
	                    </li>
	                    <li>
	                        <div class="logoImg"><img src="/img/user_img/company-logo.png" alt=""></div>
	                        <p>기업명</p>
	                        <span>전시제품명이 이곳에 들어갑니다</span>
	                    </li>
	                </ul>
	            </div>
	            <div class="tabInner">
	            </div>
	            <div class="tabInner">
	            </div>
	        </div>
	    </div>
	   	<%@include file="./include/footer.jsp" %>
	   	<script>

			  //탭
			  function moveSlider($clickedTab) {
			      var leftOffset = $clickedTab.position().left;
			      $('.tabNav .slider').css({
			          'left': leftOffset + 'px',
			          'width': $clickedTab.outerWidth() + 'px'
			      });
			  }
		
			  moveSlider($('.tabNav li.active'));
		
			  $('.tabNav li').click(function() {
			      var tab_id = $(this).index();
		
			      $('.tabNav li').removeClass('active');
			      $('.tabInner').removeClass('active').hide();
		
			      $(this).addClass('active');
			      $('.tabInner').eq(tab_id).addClass('active').fadeIn(500);
		
			      // 슬라이더 이동
			      moveSlider($(this));
		
			      // 네비 움찔...
			      $(this).css('transform', 'scale(0.95)');
			      setTimeout(() => {
			          $(this).css('transform', 'scale(1)');
			      }, 200);
			  });
	   	</script>
    </body>
</html>
