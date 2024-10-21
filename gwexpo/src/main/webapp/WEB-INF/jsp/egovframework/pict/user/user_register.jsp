<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../admin/header.jsp">
	<c:param name="pageTitle" value="사용자 등록" />
</c:import>
<body class="sb-nav-fixed">
	<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
		<%@include file="../admin/navigation.jsp" %>
		<div id="layoutSidenav">
			<div id="layoutSidenav_nav">
				<%@include file="../admin/gnb.jsp" %>
			</div>
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">사용자 등록</h2>
					<div class="contents-box">
						<div class="card">
							<div class="card-body">
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">등록분류</label>
										<div class="input-box">
											<select id="classify" name="classify" class="input opt-max-width-300">
												<option value="1" <c:if test="${pictVO.classify eq '1'}"> selected</c:if> >일반참가자</option>
												<option value="2" <c:if test="${pictVO.classify eq '2'}"> selected</c:if> >기업참가자</option>
												<option value="3" <c:if test="${pictVO.classify eq '3'}"> selected</c:if> >VIP</option>
												<option value="4" <c:if test="${pictVO.classify eq '4'}"> selected</c:if> >주최(강원도)</option>
												<option value="5" <c:if test="${pictVO.classify eq '5'}"> selected</c:if> >주최(춘천시)</option>
												<option value="6" <c:if test="${pictVO.classify eq '6'}"> selected</c:if> >주관(춘천바이오산업진흥원)</option>
												<option value="7" <c:if test="${pictVO.classify eq '7'}"> selected</c:if> >STAFF</option>
												<option value="8" <c:if test="${pictVO.classify eq '8'}"> selected</c:if> >PRESS</option>
											</select>
										</div>
									</div>
									<div class="write-item" style="margin-right:20px">
										<label for="title" class="title">이름</label>
										<div class="input-box">
											<input type="text" id="name" name="name" value="${pictVO.name}" class="input opt-max-width-200">
										</div>
									</div>
									<div class="write-item">
										<label for="title" class="title">휴대전화번호</label>
										<div class="input-box">
											<input type="text" id="mobile" name="mobile" value="${pictVO.mobile}" class="input opt-max-width-300">
										</div>
									</div>
									<div class="write-item">
										<label for="title" class="title">성별</label>
										<div class="input-box">
											<select id="gender" name="gender" class="input opt-max-width-200">
												<option value="1" <c:if test="${pictVO.gender eq '1'}"> selected</c:if> >남</option>
												<option value="2" <c:if test="${pictVO.gender eq '2'}"> selected</c:if> >여</option>
											</select>
										</div>
									</div>
									<div class="write-item">
										<label for="title" class="title">이메일</label>
										<div class="input-box">
											<input type="text" id="email" name="email" value="${pictVO.email}" class="input opt-max-width-400">
										</div>
									</div>

									<div class="write-item">
										<label for="title" class="title">기업명</label>
										<div class="input-box">
											<input type="text" id="company" name="company" value="${pictVO.company}" class="input opt-max-width-400">
										</div>
									</div>
	
									<div class="write-item">
										<label for="title" class="title">부서/직위</label>
										<div class="input-box">
											<input type="text" id="company_depart" name="company_depart" value="${pictVO.company_depart}" class="input opt-max-width-300" style="margin-right:15px">
											<input type="text" id="company_rank" name="company_rank" value="${pictVO.company_rank}" class="input opt-max-width-300">
										</div>
									</div>
									
								</div>
								<div class="btn-box">
									<c:if test="${pictVO.saveType eq 'insert'}">
										<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">등록</button>
									</c:if>
									<c:if test="${pictVO.saveType ne 'insert'}">
										<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">수정</button>
									</c:if>
						        	<button type="button" onclick="javascript:board_list();" class="btn-basic btn-common btn-sm">목록보기</button>
					            </div>
							</div>
						</div>
		            </div>
				</main>
			</div>
		</div>
		<input type='hidden' name="saveType" id="saveType" value='${pictVO.saveType}' /> 
		<input type='hidden' name="idx" id="idx" value='${pictVO.idx}' /> 
		<input type='hidden' name="use_at" id="use_at" value='${pictVO.use_at}' />
		<input type="hidden" name="fairpath_id" id="fairpath_id" value="${pictVO.fairpath_id }">
	</form>
	
	<script>
		function user_list() {
			location.href = "/user/user_list.do";
		}

		function button1_click() {
			
			var saveType = $('#saveType').val();
			

			var text = "등록하시겠습니까?";
			if (saveType == 'update') {
				text = "수정하시겠습니까?"
			}
			
			if (confirm(text)) {
				$("#register").attr("action", "/user/user_save.do");
				$("#register").submit();
			}
		}
		
		
	</script>
	<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/scripts.js"></script>
	<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>

</body>
</html>