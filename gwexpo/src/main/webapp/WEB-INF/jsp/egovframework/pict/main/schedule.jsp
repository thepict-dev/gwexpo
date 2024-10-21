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
	        <p>행사 안내</p>
	        <h2>행사 일정표</h2>
	    </div>
	    <div class="subContainer">
	        <div class="subInner sm">
	            <ul class="tabNav">
	                <li class="active"><span>11월 6일(수)</span></li>
	                <li><span>11월 7일(목)</span></li>
	                <li><span>11월 8일(금)</span></li>
	                <div class="slider"></div>
	            </ul>
	            <div class="tabInner active">
	                <div class="scheImg">
	                    <img src="/img/user_img/sche1.png" alt="">
	                </div>
	                <div class="buttonContainer">
	                    <a href="/img/user_img/sche1.png" download="">행사 일정표 전체 다운로드<span><img src="/img/user_img/download.png" alt=""></span></a>
	                </div>
	            </div>
	            <div class="tabInner">
	                <div class="scheImg">
	                    <img src="/img/user_img/sche2.png" alt="">
	                </div>
	                <div class="buttonContainer">
	                    <a href="/img/user_img/sche2.png" download="">행사 일정표 전체 다운로드<span><img src="/img/user_img/download.png" alt=""></span></a>
	                </div>
	            </div>
	            <div class="tabInner">
	                <div class="scheImg">
	                    <img src="/img/user_img/sche3.png" alt="">
	                </div>
	                <div class="buttonContainer">
	                    <a href="/img/user_img/sche3.png" download="">행사 일정표 전체 다운로드<span><img src="/img/user_img/download.png" alt=""></span></a>
	                </div>
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
