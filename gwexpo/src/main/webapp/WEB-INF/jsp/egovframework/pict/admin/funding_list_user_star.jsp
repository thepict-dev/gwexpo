<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
	<c:import url="../admin/header.jsp">
    	<c:param name="pageTitle" value="투자자별 투자현황"/>
    </c:import>
    
    <body class="sb-nav-fixed">
        <%@include file="./navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="./gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">투자자별 투자현황</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
						    	<div style="margin-bottom:5px"><span style="font-weight:700">${pictVO.name}</span>님의 투자현황</div>
						    	<div class="tbl-basic tbl-hover">
							        <table style="text-align : left">
							        	<colgroup>
							        		<col style="width:10%;">
							        		<col style="width:50%;">
							        		<col style="width:20%;">
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                    <th>순서</th>
							                    <th>회사명</th>
							                    <th>투자현황</th>
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
							                    	<td>${status.count}</td>
							                    	<td>${resultList.title}</td>
							                    	<td><fmt:formatNumber value="${resultList.point}" pattern="#,###" /></td>
								                </tr>
							                </c:forEach>
							            </tbody>
						            </table>
				            	</div>
				            	<div class="btn-box">
			        				<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">목록보기</button>
		        				</div>    	
				            </div>
			            </div>
		            </div>
				</main>
			</div>
		</div>
		<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
			<input type='hidden' name="idx" id="idx" value='' />
			<input type='hidden' name="use_at" id="use_at" value='' />
			<input type='hidden' name="type" id="type" value='' />
		</form>
		<script>
			function button1_click(){
				location.href= "/user/user_list.do"
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>