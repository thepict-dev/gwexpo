<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!DOCTYPE html>
<html lang="ko">
	<c:import url="./include/head.jsp">
    	<c:param name="pageTitle" value="2024강원바이오엑스포&제2회창업엑스포"/>
    </c:import>
    <body>
        <div class="appIntroContainer">
	        <div class="appIntroInner">
	            <h1></h1>
	            <button type="button" class="openApply">참가기업사전등록<img src="/user_img/arr-wt.png" alt=""></button>
	        </div>
	    </div>
	    <div class="applyWrapper">
	        <div class="applyContainer">
	            <div class="appTop">
	                <p>참가기업 사전등록</p>
	                <button type="button"><img src="/user_img/close-wt.png" alt=""></button>
	            </div>
	            <form action="" id="register" name="register" class="appBottom" method="post" enctype="multipart/form-data">
	                <div class="wholeInputsWrapper">
	                    <h3 class="appTitle">기업 정보</h3>
	                    <div class="inputContainer">
	                        <div class="flexInputs">
	                            <div class="inputBox lg">
	                                <p class="inputCaption">기업명</p>
	                                <input type="text" name="title" id="title" placeholder="기업명을 입력하세요">
	                            </div>
	                            <div class="inputBox lg">
	                                <p class="inputCaption">기업 설립일자</p>
	                                <input type="date" name="establishment_date" id="establishment_date" max="9999-12-31">
	                            </div>
	                        </div>
	                        <div class="flexInputs">
	                            <div class="inputBox lg">
	                                <p class="inputCaption">사업자등록번호</p>
	                                <input type="text" name="biz_num" id="biz_num" placeholder="사업자등록번호를 입력하세요">
	                            </div>
	                            <div class="inputBox lg">
	                                <p class="inputCaption">대표자명</p>
	                                <input type="text" name="ceo" id="ceo" placeholder="대표자명을 입력하세요">
	                            </div>
	                        </div>
	                        <div class="flexInputs">
	                            <p class="inputCaption">사업장주소</p>
	                            <div class="addInputs">
	                                <input type="text" name="address" id="address" placeholder="주소를 입력하세요">
	                                <a href="#lnk" id="search_add">주소검색</a>
	                            </div>
	                            <p class="fileSub add"><span>•</span>춘천 소재 기업만 신청이 가능합니다.</p>
	                        </div>
	                        <div class="inputBox">
	                            <p class="inputCaption">증빙서류 첨부</p>
	                            <div class="addInputs file">
	                                <p class="fileName"></p>
	                                <label for="attach_file" id="attach_file1">파일추가</label>
	                                <input type="file" id="attach_file" name="attach_file" style="display: none;">
	                                <button type="button" id="deleteButton" style="display: none;"><img src="/user_img/del-file.png" alt=""></button>
	                            </div>
	                            <p class="fileSub"><span>•</span>JPG, PDF로 업로드 해주세요.</p>
	                        </div>
	                    </div>
	                </div>
	                <div class="wholeInputsWrapper">
	                    <h3 class="appTitle">담당자 정보</h3>
	                    <div class="inputContainer">
	                        <div class="flexInputs">
	                            <div class="inputBox lg">
	                                <p class="inputCaption">담당자명</p>
	                                <input type="text" name="name" id="name" placeholder="담당자명을 입력하세요">
	                            </div>
	                            <div class="inputBox lg">
	                                <p class="inputCaption">담당자 소속/직책</p>
	                                <input type="text" name="depart" id="depart" placeholder="담당자 소속/직책을 입력하세요">
	                            </div>
	                        </div>
	                        <div class="flexInputs">
	                            <div class="inputBox lg">
	                                <p class="inputCaption">담당자 연락처</p>
	                                <input type="text" name="mobile" id="mobile" placeholder="담당자 연락처를 입력하세요">
	                            </div>
	                            <div class="inputBox lg">
	                                <p class="inputCaption">담당자 이메일</p>
	                                <input type="text" name="email" id="email" placeholder="담당자 이메일을 입력하세요">
	                            </div>
	                        </div>
	                        <div class="inputBox per">
	                            <p class="inputCaption">업종(복수선택 가능)</p>
	                            <div class="checkContainer">
	                                <div class="checkInput">
	                                    <input type="checkbox" name="industry" id="industry1" value="1">
	                                    <label for="industry1">바이오의약</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="industry" id="industry2" value="2">
	                                    <label for="industry2">체외진단</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="industry" id="industry3" value="3">
	                                    <label for="industry3">건강기능식품 및 소재</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="industry" id="industry4" value="4">
	                                    <label for="industry4">화장품 및 화장품 소재</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="industry" id="industry5" value="5">
	                                    <label for="industry5">바이오소재(환경,농업)</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="industry" id="industry6" value="6">
	                                    <label for="industry6">식품·로컬</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="industry" id="industry7" value="7">
	                                    <label for="industry7">창작·공예</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="industry" id="industry8" value="8">
	                                    <label for="industry8">IT · AI · 기술 · 관광 · 콘텐츠</label>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="inputBox per">
	                            <p class="inputCaption">참가형태(복수선택 가능)</p>
	                            <div class="checkContainer">
	                                <div class="checkInput">
	                                    <input type="checkbox" name="joins" id="join1" value="1">
	                                    <label for="join1">기업전시 · 홍보(현장 판매 제품 없음)</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="joins" id="join2" value="2">
	                                    <label for="join2">기업전시 · 제품 판매(현장 판매 제품 있음)</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="joins" id="join3" value="3">
	                                    <label for="join3">IR 피칭</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="joins" id="join4" value="4">
	                                    <label for="join4">취업박람회(신청기업 대상 상세조사 예정)</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="joins" id="join5" value="5">
	                                    <label for="join5">라이브커머스</label>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="inputBox per">
	                            <p class="inputCaption">필요 부스 개수</p>
	                            <div class="checkContainer">
	                                <div class="checkInput">
	                                    <input type="radio" name="booth" id="booth1" value="1">
	                                    <label for="booth1">1개</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="radio" name="booth" id="booth2" value="2">
	                                    <label for="booth2">2개</label>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="inputBox per">
	                            <p class="inputCaption">추가 문의사항</p>
	                            <input type="text" name="etc" id="etc" placeholder="추가 문의사항이 있으시면 자유롭게 작성해주세요.">
	                        </div>
	                    </div>
	                </div>
	                <div class="wholeInputsWrapper">
	                    <div class="checkInputBox">
	                        <input type="checkbox" name="agree" id="agree" class="checkOnly">
	                        <label for="agree">개인정보 이용에 동의합니다</label>
	                    </div>
	                </div>
	                <div class="buttonContainer">
	                    <a href="#lnk" class="wt cancelApply">신청취소</a>
	                    <a href="#lnk" class="bl" onclick="fn_register()">신청하기</a>
	                </div>
	            </form>
	        </div>
	    </div>
	    <div class="agreeModal">
	        <div class="agreeInner">
	            <button type="button"><img src="/user_img/close-modal.png" alt=""></button>
	            <img src="/user_img/agree.png" alt="">
	        </div>
	    </div>
	    <script>
	        function fn_register(){
	        	var title = $('#title').val()
	        	if(title == '' || title == undefined || title == null){
	        		alert("기업명을 입력해주세요.");
	        		$('#title').focus();
	        		return false;
	        	}
	        	var agree = $('#agree').is(':checked');
	        	if(!agree){
	        		alert("개인정보 이용에 동의해주세요.");
	        		$('#agree').focus();
	        		return false;
	        	}
	        	if(confirm("참가기업 사전등록을 신청하시겠습니까?")){
					$("#register").attr("action", "/company_register.do");
					$("#register").submit();
				}
	        }
	        $('.openApply').click(function() {
	            $('.applyWrapper').addClass('active');
	        });
	        $('.appTop > button, .cancelApply').click(function() {
	            $('.applyWrapper').removeClass('active');
	        });
	
	        $('#agree').click(function() {
	            $('.agreeModal').addClass('active');
	        });
	
	        // 파일 선택 시 파일명 표시 및 삭제 버튼 표시
	        $('#attach_file').change(function() {
	            var fileName = $(this).val().split('\\').pop();
	            $('.fileName').text(fileName);
	            $('#deleteButton').show();
	        });
	
	        // 삭제 버튼 클릭 시 파일 선택 초기화
	        $('#deleteButton').click(function() {
	            $('#attach_file').val('');
	            $('.fileName').text('');
	            $(this).hide();
	        });
	
	        // 모달 닫기 버튼 클릭 시 모달 닫기
	        $('.agreeInner > button').click(function() {
	            $('.agreeModal').removeClass('active');
	        });
	
	        // 모달 외부 영역 클릭 시 모달 닫기
	        $(document).mouseup(function(e) {
	            var container = $(".agreeInner");
	            if (!container.is(e.target) && container.has(e.target).length === 0) {
	                $('.agreeModal').removeClass('active');
	            }
	        });
	        document.getElementById("search_add").addEventListener("click", function(){ //주소입력칸을 클릭하면
		        //카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		                //document.getElementById("HPOSTCODE").value = data.zonecode;
		                document.getElementById("address").value = data.address; // 주소 넣기
		                document.getElementById("address").focus();
		            }
		        }).open();
		    });
	    </script>
    </body>
</html>
