<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
	<c:import url="../admin/header.jsp">
    	<c:param name="pageTitle" value="사용자 리스트"/>
    </c:import>
    
    <body class="sb-nav-fixed">
        <%@include file="../admin/navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="../admin/gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">사용자 리스트</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
							    <div class="search-form" style="position:relative">
							    	<form action="" id="search_fm" name="search_fm" method="get" class="search-box" style="max-width:360px">
							    		
								    	<input type="text" id="search_text" name="search_text" value="${pictVO.search_text}" class="input" placeholder="검색어를 입력하세요." autocomplete="off" style="width:450px">
								    	<button type="button" onclick="search();" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
							    	</form>
							    </div>
						    	<div class="tbl-basic tbl-hover">
							        <table style="text-align : left">
							        	<colgroup>
							        		<col style="width:10%;">
							        		<col style="width:15%;">
							        		<col style="width:15%;">
							        		<col style="width:15%;">
							        		<col style="width:15%;">
							        		<col style="width:15%;">
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                	<th>순서</th>
							                    <th>이름</th>
							                    <th>등록분류</th>
							                    <th>연락처</th>
							                    <th>잔여포인트</th>
							                    <th>삭제</th>
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
								                	<td>${status.count}</td>
							                    	<td class="opt-tl"><a href="javascript:void(0);" onclick="user_mod('${resultList.idx}');" class="link">${resultList.name}</a></td>
							                    	<td>
							                    		<c:if test="${resultList.classify eq '1'}">일반참가자</c:if>
							                    		<c:if test="${resultList.classify eq '2'}">기업참가자</c:if>
							                    		<c:if test="${resultList.classify eq '3'}">VIP</c:if>
							                    		<c:if test="${resultList.classify eq '4'}">주최(강원도)</c:if>
							                    		<c:if test="${resultList.classify eq '5'}">주최(춘천시)</c:if>
							                    		<c:if test="${resultList.classify eq '6'}">주관(춘천바이오산업진흥원)</c:if>
							                    		<c:if test="${resultList.classify eq '7'}">STAFF</c:if>
							                    		<c:if test="${resultList.classify eq '8'}">PRESS</c:if>
						                    		</td>
							                    	<td>${resultList.mobile}</td>
							                    	<td><fmt:formatNumber value="${resultList.point}" pattern="#,###" /></td>
									            	<td><button type="button" onclick="javascript:user_delete('${resultList.idx}', '${resultList.fairpath_id}')" class="btn-basic btn-fill btn-sm">삭제</button></td>
								                </tr>
							                </c:forEach>
							            </tbody>
						            </table>
				            	</div>
				            </div>
			            </div>
		            </div>
		            <div class="point-modal" style="position:fixed; left: 0; top: 0; display:none; width: 100%; height: 100%; background: rgba(0,0,0,0.3);">
		            	<div class="point-modal-inner" style="position: absolute; top: 20%; left: 45%; display:flex; flex-direction: column; align-items: center; justify-content:space-between; width:500px; height: 250px; padding: 30px 25px; transfomr: translate(-50%, -50%); background: #fff; border-radius: 20px; box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);">
		            		<p style="font-size: 30px;">포인트 지급액</p>
		            		<input type=number style="border: 1px solid #ccc;" id="input_point"/>
		            		<div class="point-btns">
			            		<button class="btn-basic btn-fill btn-sm" onclick=point_update()>지급</button>
			            		<button class="point-close" style="display: inline-block; height: 34px; min-width: 85px; line-height: 31px; padding: 0 15px; font-size: 14px; vertical-align: middle; background-color: #fff; border: 1px solid #303030; border-radius: 5px; color: #000;" onclick=popup_close()>닫기</button>
			            	</div>
		            	</div>
		            </div>
				</main>
			</div>
		</div>
		<form action="" id="del" name="del" method="post" enctype="multipart/form-data">
			<input type='hidden' name="idx" id="idx" value='' />
			<input type="hidden" name="fairpath_id" id="fairpath_id" value="">
		</form>
		<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
			<input type='hidden' name="use_at" id="use_at" value='' />
			<input type='hidden' name="type" id="type" value='' />
			<input type="hidden" name="check_list" id="check_list" value="">
			<input type="hidden" name="point" id="point" value="">
			<input type="hidden" name="use_flag" id="use_flag" value="">
			<input type="hidden" name="point_sum" id="point_sum" value="N">
			
			
		</form>
		<script>
			function user_fund(idx, name){
				location.href= "/fund/funding_list_user_star.do?idx="+ idx+"&name="+name;
			}
			function user_mod(idx){
				location.href= "/user/user_register.do?idx="+ idx;
			}
			function user_list(){
				location.href= "/user/user_list.do";
			}
			function user_delete(idx, fairpath_id) {
				if (confirm("삭제 하시겠습니까?")) {
					$('#idx').val(idx)
					$('#fairpath_id').val(fairpath_id)
					$("#del").attr("action", "/user/user_delete.do");
					$("#del").submit();
				}
			}
			function search(){
				$("#search_fm").attr("action", "/user/user_list.do");
				$("#search_fm").submit();
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>
