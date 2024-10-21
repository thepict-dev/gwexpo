<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<footer>
    <div class="footerInner">
        <div class="fLeft">
            <p><span>24232 </span>강원특별자치도 춘천시 소양강로 32 바이오타운 BIO-1동 112호</p>
            <ul>
                <li><span>대표전화</span>033-258-6932</li>
                <li><span>팩스</span>033-258-6170,2</li>
            </ul>
            <p class="copy">COPYRIGHT (C) CHUNCHEON BIOINDUSTRY FOUNDATION. ALL RIGHTS RESERVED</p>
        </div>
        <a href="" target="_blank" title="새창열기">개인정보 처리방침</a>
    </div>
</footer>


<div class="applyWrapper">
    <div class="applyContainer">
        <div class="appTop">
            <p>참가등록</p>
            <button type="button"><img src="/user_img/close-wt.png" alt=""></button>
        </div>
        <form action="" class="appBottom">
            <div class="wholeInputsWrapper">
                <div class="inputContainer">
                    <div class="flexInputs">
                        <div class="inputBox lg">
                            <p class="inputCaption">참가유형</p>
							<select name="classify" id="classify">
								<option value="">참가 유형을 선택하세요.</option>
								<option value="1">일반참가자</option>
								<option value="2">참가기업</option>
								<option value="3">VIP</option>
								<option value="4">주최 강원도</option>
								<option value="5">주최 춘천시</option>
								<option value="6">주관 (재)춘천바이오산업진흥원</option>
								<option value="7">PRESS</option>
								<option value="8">STAFF</option>
							</select>
                        </div>
                    </div>
                    <div class="flexInputs">
                        <div class="inputBox lg">
                            <p class="inputCaption">이름</p>
                            <input type="text" name="name" id="name" placeholder="이름을 입력하세요">
                        </div>
	                    <div class="inputBox">
	                        <p class="inputCaption">성별</p>
	                        <div class="checkContainer">
	                            <div class="checkInput">
	                                <input type="radio" name="gender" id="1" value="1">
	                                <label for="1">남</label>
	                            </div>
	                            <div class="checkInput">
	                                <input type="radio" name="gender" id="2" value="2">
	                                <label for="2">여</label>
	                            </div>
	                        </div>
                    	</div>
                    </div>
                    <div class="flexInputs">
                        <div class="inputBox lg">
                            <p class="inputCaption">연락처</p>
                            <input type="text" name="mobile" id="mobile" placeholder="연락처를 입력하세요">
                        </div>
                        <div class="inputBox lg">
                            <p class="inputCaption">이메일</p>
                            <input type="text" name="email" id="email" placeholder="이메일을 입력하세요">
                        </div>
                    </div>
                    <div class="flexInputs">
                        <div class="inputBox per">
                            <p class="inputCaption">회사명</p>
                            <input type="text" name="company" id="company" placeholder="회사명을 입력하세요">
                        </div>
                    </div>
                    <div class="flexInputs">
                        <div class="inputBox lg">
                            <p class="inputCaption">부서명</p>
                            <input type="text" name="company_depart" id="company_depart" placeholder="부서명을 입력하세요">
                        </div>
                        <div class="inputBox lg">
                            <p class="inputCaption">직책</p>
                            <input type="text" name="company_rank" id="company_rank" placeholder="직책을 입력하세요">
                        </div>
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
                <a href="#lnk" class="bl" onclick="button1_click()">등록하기</a>
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
	function button1_click() {
		var classify = $('#classify').val()
		var name = $('#name').val()
		var gender = $("input[name='gender']:checked").val();
		var mobile = $('#mobile').val()
		var email = $('#email').val()
		var company = $('#company').val()
		var company_depart = $('#company_depart').val()
		var company_rank = $('#company_rank').val()
		var agree = $('#agree').is(':checked');
		
		if(classify == '' || classify == null || classify == undefined){
			alert('참가유형을 선택해주세요.');
			$('#classify').focus();
			return false;
		}
		if(name == '' || name == null || name == undefined){
			alert('이름을 입력해주세요.');
			$('#name').focus();
			return false;
		}
		if(mobile == '' || mobile == null || mobile == undefined){
			alert('연락처를 입력해주세요.');
			$('#mobile').focus();
			return false;
		}
		if(!agree){
			alert('개인정보 이용에 동의해주세요.');
			$('#agree').focus();
			return false;
		}
		
		
		
		var text = "입력하신 정보로 현장등록을 진행하시겠습니까?";
		var param = {
			classify :classify,
			name :name,
			gender :gender,
			mobile :mobile,
			email :email,
			company :company,
			company_depart :company_depart,
			company_rank :company_rank
		}
		if (confirm(text)) {
			$.ajax({
				url : "/user_register.do"
				, type : "POST"
				, data : JSON.stringify(param)
				, contentType : "application/json"
				, dataType : "json"
				, async : false
				, success : function(data, status, xhr) {
					if(data == 'Y'){
						alert("정상적으로 등록되었습니다.")
						window.location.href="/"
					}
					else{
						alert("등록 중 오류가 발생했습니다.")
						window.location.href="/"
					}
				}
				, error : function(xhr, status, error) {
					alert("등록 중 오류가 발생했습니다.")
				}
			});
		}
		
		//if (confirm(text)) {
			//$("#register").attr("action", "/user_invest_save.do");
			//$("#register").submit();
		//}
	}
</script>