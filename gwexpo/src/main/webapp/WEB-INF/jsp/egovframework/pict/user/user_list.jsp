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
							    	<div style="position:absolute; left:30px; top:8px">
							    		선택된 데이터 : <span id="select_cnt">0</span>건
							    	</div>
							    	<form action="" id="search_fm" name="search_fm" method="get" class="search-box" style="max-width:1300px">
							    		<button type="button" onclick="btn_excel();" class="btn-basic btn-sm btn-default point" style="display:flex; align-items:center; margin-right:20px; margin-top:5px; justify-content: center">엑셀다운로드</button>
							    		<button type="button" onclick="btn_nonactive();" class="btn-basic btn-sm btn-default point" style="display:flex; align-items:center; margin-right:20px; margin-top:5px; justify-content: center">비활성화</button>
							    		<button type="button" onclick="btn_active();" class="btn-basic btn-sm btn-default point" style="display:flex; align-items:center; margin-right:20px; margin-top:5px; justify-content: center">활성화</button>
							    		<button type="button" onclick="btn_point();" class="btn-basic btn-sm btn-default point" style="display:flex; align-items:center; margin-right:20px; margin-top:5px; justify-content: center">포인트지급</button>
							    		<button type="button" onclick="btn_point_sum();" class="btn-basic btn-sm btn-default point" style="display:flex; align-items:center; margin-right:20px; margin-top:5px; justify-content: center">포인트합산</button>
							    		<button type="button" onclick="btn_point_with();" class="btn-basic btn-sm btn-default point" style="display:flex; align-items:center; margin-right:20px; margin-top:5px; justify-content: center">포인트회수</button>

							    		<select id="use_at" name="use_at" style="margin-right:10px; width: 200px; margin-top:5px; font-size:14px; height:34px">
							    			<option value="">활성검색</option>
							    			<option value="Y" <c:if test="${pictVO.use_at eq 'Y'}">selected</c:if> >활성화</option>
							    			<option value="N" <c:if test="${pictVO.use_at eq 'N'}">selected</c:if> >비활성화</option>
							    		</select>
								    	<input type="text" id="search_text" name="search_text" value="${pictVO.search_text}" class="input" placeholder="검색어를 입력하세요." autocomplete="off" style="width:450px">
								    	<button type="button" onclick="search();" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
							    	</form>
							    </div>
						    	<div class="tbl-basic tbl-hover">
							        <table style="text-align : left">
							        	<colgroup>
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:10%;">
							        		<col style="width:11%;">
							        		<col style="width:13%;">
							        		<col style="width:13%;">
							        		<col style="width:13%;">
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                	<th><input type="checkbox" class="check" title="전체선택" onchange="allCheck(this);" data-check="addApplList"></th>
							                    <th>이름</th>
							                    <th>등록분류</th>
							                    <th>연락처</th>
							                    <th>참가날짜</th>
							                    <th>잔여포인트</th>
							                    <th>활성화</th>
							                    <th>투자현황</th>
							                    <th>삭제</th>
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
								                	<td><input type="checkbox" class="check js-check" name="applCheck" data-check="addApplList" data-id="${resultList.idx}" onchange="check_cnt()"></td>
							                    	<td class="opt-tl"><a href="javascript:void(0);" onclick="user_mod('${resultList.idx}');" class="link">${resultList.name}</a></td>
							                    	<td>
							                    		<c:if test="${resultList.classify eq '1'}">일반관람객</c:if>
							                    		<c:if test="${resultList.classify eq '2'}">일반관람객(펀딩불가)</c:if>
							                    		<c:if test="${resultList.classify eq '3'}">참가기업</c:if>
							                    		<c:if test="${resultList.classify eq '4'}">VC투자자</c:if>
							                    		<c:if test="${resultList.classify eq '5'}">주최/주관</c:if>
							                    		<c:if test="${resultList.classify eq '6'}">STAFF</c:if>
							                    		<c:if test="${resultList.classify eq '7'}">PRESS</c:if>
						                    		</td>
							                    	<td>${resultList.mobile}</td>
							                    	<td></td>
							                    	<td><fmt:formatNumber value="${resultList.point}" pattern="#,###" /></td>
							                    	<td>
							                    		<c:if test="${resultList.use_at eq 'Y'}"><span style="color: blue">활성화</span></c:if>
							                    		<c:if test="${resultList.use_at ne 'Y'}"><span style="color: red">비활성화</span></c:if>
									            	</td>
									            	<td><button type="button" onclick="javascript:user_fund('${resultList.idx}', '${resultList.name}')" class="btn-basic btn-fill btn-sm">투자현황</button></td>
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
			function btn_excel(){
				if(confirm("사전등록자 리스트를 엑셀파일로 내려받으시겠습니까?")){
					$("#search_fm").attr("action", "/user/excel_down.do");
					$("#search_fm").submit();
					
				}
			}
			function allCheck(target) {
				var $id = $(target).data('check');
				var $check = $('.js-check[data-check="'+$id+'"]');
				if($(target).prop('checked'))
					$check.prop('checked', true);
				else
					$check.prop('checked', false);
				
				var check_list = [];
				$("input[name='applCheck']:checked").each(function (e){
					check_list.push($(this).data("id"));
				});
				$('#select_cnt').text(check_list.length)
			}
			function btn_point() {
				var check_list = [];
				$("input[name='applCheck']:checked").each(function (e){
					check_list.push($(this).data("id"));
				});
				if(check_list.length == 0) {
					alert("사용자를 선택해주세요.");
					return false;
				}
				else{
					$('#point_sum').val("N");
					$('.point-modal').css('display', 'block');	
				}
			}
			function btn_point_sum() {
				var check_list = [];
				$("input[name='applCheck']:checked").each(function (e){
					check_list.push($(this).data("id"));
				});
				if(check_list.length == 0) {
					alert("사용자를 선택해주세요.");
					return false;
				}
				else{
					$('#point_sum').val("Y");
					$('.point-modal').css('display', 'block');	
				}
			}
			function popup_close() {
				$('.point-modal').css('display', 'none');
				
			}
			
			function btn_active(){
				var check_list = [];
				$("input[name='applCheck']:checked").each(function (e){
					check_list.push($(this).data("id"));
				});
				if(check_list.length == 0) {
					alert("사용자를 선택해주세요.");
					return false;
				}
				else {
					if(confirm("선택한 사용자들을 펀딩 활성화 하시겠습니까?")) {
						$('#use_flag').val('Y');
						$("#check_list").val(check_list.toString());
						$("#register").attr("action", "/user/use_update.do");
						$("#register").submit();
					}
				}
					
			}
			function btn_nonactive(){
				var check_list = [];
				$("input[name='applCheck']:checked").each(function (e){
					check_list.push($(this).data("id"));
				});
				if(check_list.length == 0) {
					alert("사용자를 선택해주세요.");
					return false;
				}
				else {
					if(confirm("선택한 사용자들을 펀딩 비활성화 하시겠습니까?")) {
						$('#use_flag').val('N');
						$("#check_list").val(check_list.toString());
						$("#register").attr("action", "/user/use_update.do");
						$("#register").submit();
					}
				}
					
			}
			function btn_point_with(){
				var check_list = [];
				
				$("input[name='applCheck']:checked").each(function (e){
					check_list.push($(this).data("id"));
				});
				if(check_list.length == 0) {
					alert("사용자를 선택해주세요.");
					return false;
				}
				if(confirm("선택한 사용자의 포인트를 회수 하시겠습니까?")) {
					$("#check_list").val(check_list.toString());
					$("#register").attr("action", "/user/point_update_with.do");
					$("#register").submit();
					
				}	
			}
			function point_update(){
				var check_list = [];
				var point = $('#input_point').val()
				$("input[name='applCheck']:checked").each(function (e){
					check_list.push($(this).data("id"));
				});
				if(check_list.length == 0) {
					alert("사용자를 선택해주세요.");
					return false;
				}
				else {
					var point_sum = $('#point_sum').val()
					if(point_sum == 'N'){
						if(confirm("선택한 사용자에게 포인트를 지급하시겠습니까?")) {
							$('#point').val(point)
							$("#check_list").val(check_list.toString());
							$("#register").attr("action", "/user/point_update.do");
							$("#register").submit();
							
						}	
					}
					else{
						if(confirm("선택한 사용자에게 포인트를 합산하시겠습니까?")) {
							$('#point').val(point)
							$("#check_list").val(check_list.toString());
							$("#register").attr("action", "/user/point_update_sum.do");
							$("#register").submit();
							
						}
					}
					
					
				}
			}
			function check_cnt(){
				var check_list = [];
				$("input[name='applCheck']:checked").each(function (e){
					check_list.push($(this).data("id"));
				});
				$('#select_cnt').text(check_list.length);
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>
