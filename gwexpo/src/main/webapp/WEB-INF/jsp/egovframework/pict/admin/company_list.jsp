<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>
<html lang="ko">
	<c:import url="../admin/header.jsp">
    	<c:param name="pageTitle" value="기업 리스트"/>
    </c:import>
    <body class="sb-nav-fixed">
        <%@include file="./navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="./gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">기업 리스트</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
							    <div class="search-form">
							    	<form action="" id="search_fm" name="search_fm" method="get" class="search-box" style="max-width:700px">
							    		<button type="button" onclick="btn_excel();" style="width:250px; margin-right:25px" class="btn-basic btn-sm btn-default" ><i class="fa-solid fa-file-excel"></i> 엑셀다운로드</button>
							    		<input type="text" id="search_text" name="search_text" value="${pictVO.search_text}" class="input" placeholder="기업명으로 검색하세요." autocomplete="off" onkeypress="if(event.keyCode == 13){search();}">
								    	<button type="button" onclick="search();" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
							    	</form>
							    </div>
						    	<div class="tbl-basic tbl-hover">
							        <table style="text-align : left">
							        	<colgroup>
							        		<col style="width:5%;">
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:22%;">
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:13%;">
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                    <th>순서</th>
							                    <th>기업명</th>
							                    <th>설립일</th>
							                    <th>사업자등록번호</th>
							                    <th>주소</th>
							                    <th>담당자</th>
							                    <th>담당자직책</th>
							                    <th>담당자연락처</th>
							                    <th>담당자이메일</th>
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
							                    	<td>${status.count}</td>
							                    	<td>${resultList.title}</td>
							                    	<!-- <td class="opt-tl"><a href="javascript:void(0);" onclick="board_mod('${resultList.idx}');" class="link">${resultList.title}</a></td> -->
							                    	<td>${resultList.establishment_date}</td>
							                    	<td>${resultList.biz_num}</td>
							                    	<td>${resultList.address}</td>
							                    	<td>${resultList.name}</td>
						                    		<td>${resultList.depart}</td>
						                    		<td>${resultList.mobile}</td>
							                    	<td>${resultList.email}</td>
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
			<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
				<input type="hidden" name="idx" id="idx" value="" />
			</form>
		</div>
		<script>
			function btn_excel(){
				$("#search_fm").attr("action", "/admin/company_excel.do");
				$("#search_fm").submit();
			}
			function board_mod(idx){
				location.href= "/admin/company_register.do?idx="+idx;
			}		
			function board_insert(){
				location.href= "/admin/company_register.do";
			}		
			function search(){
				$("#search_fm").attr("action", "/admin/company_list.do");
				$("#search_fm").submit();
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>