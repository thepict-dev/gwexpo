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
	            <form action="" class="appBottom">
	                <div class="wholeInputsWrapper">
	                    <h3 class="appTitle">기업 정보</h3>
	                    <div class="inputContainer">
	                        <div class="flexInputs">
	                            <div class="inputBox lg">
	                                <p class="inputCaption">기업명</p>
	                                <input type="text" name="company_name" id="company_name" placeholder="기업명을 입력하세요">
	                            </div>
	                            <div class="inputBox lg">
	                                <p class="inputCaption">기업 설립일자</p>
	                                <input type="date" name="company_date" id="company_date" max="9999-12-31">
	                            </div>
	                        </div>
	                        <div class="flexInputs">
	                            <div class="inputBox lg">
	                                <p class="inputCaption">사업자등록번호</p>
	                                <input type="text" name="company_number" id="company_number" placeholder="사업자등록번호를 입력하세요">
	                            </div>
	                            <div class="inputBox lg">
	                                <p class="inputCaption">대표자명</p>
	                                <input type="text" name="ceo_name" id="ceo_name" placeholder="대표자명을 입력하세요">
	                            </div>
	                        </div>
	                        <div class="flexInputs">
	                            <p class="inputCaption">사업장주소</p>
	                            <div class="addInputs">
	                                <input type="text" name="address" id="address" readonly placeholder="주소를 입력하세요">
	                                <a href="#lnk" id="search_add">주소검색</a>
	                            </div>
	                            <p class="fileSub add"><span>•</span>춘천 소재 기업만 신청이 가능합니다.</p>
	                        </div>
	                        <div class="inputBox">
	                            <p class="inputCaption">증빙서류 첨부</p>
	                            <div class="addInputs file">
	                                <p class="fileName"></p>
	                                <label for="file" id="attach_file">파일추가</label>
	                                <input type="file" id="file" style="display: none;">
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
	                                <input type="text" name="person_name" id="person_name" placeholder="담당자명을 입력하세요">
	                            </div>
	                            <div class="inputBox lg">
	                                <p class="inputCaption">담당자 소속/직책</p>
	                                <input type="text" name="person_position" id="person_position" placeholder="담당자 소속/직책을 입력하세요">
	                            </div>
	                        </div>
	                        <div class="flexInputs">
	                            <div class="inputBox lg">
	                                <p class="inputCaption">담당자 연락처</p>
	                                <input type="text" name="person_phone" id="person_phone" placeholder="담당자 연락처를 입력하세요">
	                            </div>
	                            <div class="inputBox lg">
	                                <p class="inputCaption">담당자 이메일</p>
	                                <input type="text" name="person_email" id="person_email" placeholder="담당자 이메일을 입력하세요">
	                            </div>
	                        </div>
	                        <div class="inputBox per">
	                            <p class="inputCaption">업종(복수선택 가능)</p>
	                            <div class="checkContainer">
	                                <div class="checkInput">
	                                    <input type="checkbox" name="category" id="category1">
	                                    <label for="category1">바이오의약</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="category" id="category2">
	                                    <label for="category2">체외진단</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="category" id="category3">
	                                    <label for="category3">건강기능식품 및 소재</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="category" id="category4">
	                                    <label for="category4">화장품 및 화장품 소재</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="category" id="category5">
	                                    <label for="category5">바이오소재(환경,농업)</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="category" id="category6">
	                                    <label for="category6">식품·로컬</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="category" id="category7">
	                                    <label for="category7">창작·공예</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="category" id="category8">
	                                    <label for="category8">IT · AI · 기술 · 관광 · 콘텐츠</label>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="inputBox per">
	                            <p class="inputCaption">참가형태(복수선택 가능)</p>
	                            <div class="checkContainer">
	                                <div class="checkInput">
	                                    <input type="checkbox" name="apply_form" id="apply_form1">
	                                    <label for="apply_form1">기업전시 · 홍보(현장 판매 제품 없음)</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="apply_form" id="apply_form2">
	                                    <label for="apply_form2">기업전시 · 제품 판매(현장 판매 제품 있음)</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="apply_form" id="apply_form3">
	                                    <label for="apply_form3">IR 피칭</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="apply_form" id="apply_form4">
	                                    <label for="apply_form4">취업박람회(신청기업 대상 상세조사 예정)</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="checkbox" name="apply_form" id="apply_form5">
	                                    <label for="apply_form5">라이브커머스</label>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="inputBox per">
	                            <p class="inputCaption">필요 부스 개수</p>
	                            <div class="checkContainer">
	                                <div class="checkInput">
	                                    <input type="radio" name="booth" id="booth1">
	                                    <label for="booth1">1개</label>
	                                </div>
	                                <div class="checkInput">
	                                    <input type="radio" name="booth" id="booth2">
	                                    <label for="booth2">2개</label>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="inputBox per">
	                            <p class="inputCaption">추가 문의사항</p>
	                            <input type="text" name="inquiry" id="inquiry" placeholder="추가 문의사항이 있으시면 자유롭게 작성해주세요.">
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
	                    <a href="#lnk" class="bl">신청하기</a>
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
	        $('#file').change(function() {
	            var fileName = $(this).val().split('\\').pop();
	            $('.fileName').text(fileName);
	            $('#deleteButton').show();
	        });
	
	        // 삭제 버튼 클릭 시 파일 선택 초기화
	        $('#deleteButton').click(function() {
	            $('#file').val('');
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
	    </script>
    </body>
</html>
