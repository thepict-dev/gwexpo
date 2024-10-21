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


<div class="applyWrapper active">
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
	                                <input type="radio" name="gender" id="1">
	                                <label for="1">남</label>
	                            </div>
	                            <div class="checkInput">
	                                <input type="radio" name="gender" id="2">
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
                <a href="#lnk" class="bl">등록하기</a>
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