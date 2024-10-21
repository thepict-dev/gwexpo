<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
	<c:import url="../admin/header.jsp">
    	<c:param name="pageTitle" value="회사별 투자현황"/>
    </c:import>
    
    <body class="sb-nav-fixed">
        <%@include file="./navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="./gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">회사별 투자현황</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
							    <div class="search-form">
							    	<form action="" id="search_fm" name="search_fm" method="get" class="search-box" style="max-width:600px">
								    	<select id="company_id" name="company_id" style="margin-right:10px; width: 400px; margin-top:5px; font-size:14px; height:34px">
							    			<option value="">회사검색</option>
							    			<c:forEach var="company_list" items="${resultList2}" varStatus="status">
							    				<option value="${company_list.idx}" <c:if test="${pictVO.company_id eq company_list.idx}">selected</c:if> >${company_list.title}</option>
							    			</c:forEach>
							    		</select>
								    	<input type="text" id="search_text" name="search_text" value="${pictVO.search_text}" class="input" placeholder="검색어를 입력하세요." autocomplete="off">
								    	<button type="button" onclick="search();" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
							    	</form>
							    </div>
						    	<div class="tbl-basic tbl-hover">
							        <table style="text-align : left">
							        	<colgroup>
							        		<col style="width:10%;">
							        		<col style="width:30%;">
							        		<col style="width:40%;">
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                    <th>순서</th>
							                    <th>이름</th>
							                    <th>포인트</th>
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
							                    	<td>${status.count}</td>
							                    	<td>${resultList.name}</td>
							                    	<td><fmt:formatNumber value="${resultList.point}" pattern="#,###" /></td>
								                </tr>
							                </c:forEach>
							            </tbody>
						            </table>
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
			function search(){
				$("#search_fm").attr("action", "/admin/funding_list_user.do");
				$("#search_fm").submit();
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>