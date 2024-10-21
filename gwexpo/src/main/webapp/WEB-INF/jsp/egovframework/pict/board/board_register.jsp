<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../admin/header.jsp">
	<c:param name="pageTitle" value="게시물 등록" />
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
					<h2 class="contents-title">게시물 등록</h2>
					<div class="contents-box">
						<div class="card">
							<div class="card-body">
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">제목</label>
										<div class="input-box">
											<input type="text" id="title" name="title" value="${pictVO.title}" class="input opt-max-width-500">
										</div>
									</div>
								</div>

								<div class="write-item">
									<label for="title" class="title">내용</label>
									<div class="input-box">
										<textarea name="text" id="text" cols="30" rows="10" class="txt" style="width:100%;">${pictVO.text}</textarea>
		                            	<!-- 에디터 설정 -->
										<script type="text/javascript">
											var oEditors = [];
											nhn.husky.EZCreator.createInIFrame({
												oAppRef: oEditors,
												elPlaceHolder: "text", //textarea에서 지정한 id와 일치해야 합니다.
												sSkinURI: "/js/SmartEditor2Skin.html",
												fCreator: "createSEditor2"
											});
										</script>
									</div>
								</div>
								<div class="write-item" id="file_div">
									<label for="title" class="title">썸네일 이미지</label>
									<div class="input-box">
										<input style="margin-bottom:15px" type="file" id="attach_file1" name="attach_file1" class="input opt-max-width-600">
										<div class="select_img1">
					            			<img src="" style="width:200px; margin-bottom:15px; display: none" id="src_1"/>
				            			</div>
									</div>
								</div>
								<div class="write-item" id="file_div">
									<label for="title" class="title">첨부파일1</label>
									<div class="input-box">
										<input style="margin-bottom:15px" type="file" id="attach_file2" name="attach_file2" class="input opt-max-width-600">
										<div class="select_img2">
					            			<img src="" style="width:200px; margin-bottom:15px; display: none" id="src_2"/>
				            			</div>
									</div>
								</div>
								<div class="write-item" id="file_div">
									<label for="title" class="title">첨부파일2</label>
									<div class="input-box">
										<input style="margin-bottom:15px" type="file" id="attach_file3" name="attach_file3" class="input opt-max-width-600">
										<div class="select_img3">
					            			<img src="" style="width:200px; margin-bottom:15px; display: none" id="src_3"/>
				            			</div>
									</div>
								</div>
								<div class="write-item" id="file_div">
									<label for="title" class="title">첨부파일3</label>
									<div class="input-box">
										<input style="margin-bottom:15px" type="file" id="attach_file4" name="attach_file4" class="input opt-max-width-600">
										<div class="select_img4">
					            			<img src="" style="width:200px; margin-bottom:15px; display: none" id="src_4"/>
				            			</div>
									</div>
								</div>

									
								<div class="btn-box">
									<c:if test="${pictVO.saveType eq 'update'}">
										<button type="button" onclick="javascript:board_delete()" class="btn-basic btn-fill btn-sm">삭제</button>
									</c:if>
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
		<input type='hidden' name="type" id="type" value='' />
		<input type='hidden' name="del_img_url" id="del_img_url" value='' />
		
	</form>
	
	<script>
		function board_delete() {
			if (confirm("삭제 하시겠습니까?")) {
				$("#register").attr("action", "/board/board_delete.do");
				$("#register").submit();
			}
			
		}
		function board_list() {
			location.href = "/board/board_list.do";
		}
		function button1_click() {
			var title = $('#title').val();
			
			if (title == "" || title == undefined) {
				window.alert("제목을 입력해주세요.");
				$('#title').focus();
				return false;
			}
			oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
			
			var text = "등록하시겠습니까?";
			if (saveType == 'update') {
				text = "수정하시겠습니까?"
			}

			if (confirm(text)) {
				$("#register").attr("action", "/board/board_save.do");
				$("#register").submit();
			}
		}
		$('#attach_file1').change(function() {
			if(this.files && this.files[0]){
				if(this.files[0].type == '' || this.files[0].type.split('/')[0] != 'image'){
					alert ('이미지 파일만 첨부할 수 있습니다.');
					$('#attach_file').val("")
					return false
				}
				var reader = new FileReader;
				reader.onload = function(data){
					$('#src_1').show()
					$(".select_img1 img").attr("src", data.target.result).width(200);
				}
				reader.readAsDataURL(this.files[0]);
			}
			else{
				$(".select_img1 img").attr("src", "");
			}
		});
		
		
		$( document ).ready(function() {
					
			var img_1 = '${pictVO.img_url}';
			
			
			if(img_1){
				$('#src_1').show()
				$(".select_img1 img").attr("src", img_1).width(200);
			}
			
		})
	</script>
	<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/scripts.js"></script>
	<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>

</body>
</html>