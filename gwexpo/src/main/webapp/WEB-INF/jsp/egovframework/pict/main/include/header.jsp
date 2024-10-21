<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<header>
    <div class="headerInner">
        <h1>
            <a href="/">
                <img src="/img/user_img/logo.png" alt="" class="pc">
                <img src="/img/user_img/mb-logo.png" alt="" class="mb">
            </a>
        </h1>
        <nav>
            <ul class="nav">
                <li>
                    <a href="/outline.do">행사안내</a>
                    <ul class="sub">
                        <li><a href="/outline.do">행사개요</a></li>
                        <li><a href="/map.do">행사장 안내도</a></li>
                        <li><a href="/schedule.do">행사 일정표</a></li>
                        <li><a href="/location.do">오시는 길</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/exhibition.do">전시관</a>
                    <ul class="sub">
                        <li><a href="/exhibition.do">전시관 배치도</a></li>
                        <li><a href="/company.do">참가 기업 안내</a></li>
                        <li><a href="/local.do">로컬브랜드페스타</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/opening.do">프로그램</a>
                    <ul class="sub">
                        <li><a href="/opening.do">개막식</a></li>
                        <li><a href="/funding_intro.do">크라우드 펀딩</a></li>
                        <li><a href="/lecture.do">특별강연</a></li>
                        <li><a href="/company_program.do">기업 프로그램</a></li>
                        <li><a href="/exp_program.do">체험 프로그램</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/notice.do">커뮤니티</a>
                    <!-- <ul class="sub">
                        <li><a href="">공지사항</a></li>
                        <li><a href="">뉴스보도</a></li>
                    </ul> -->
                </li>
            </ul>
            <div class="side">
                <a href="#lnk">참가신청</a>
                <button type="button">
                    <img src="/img/user_img/menu.png" alt="">
                    <img src="/img//user_img/close.png" alt="" style="display: none; width: 34px;">
                </button>
            </div>
        </nav>
    </div>
    <div class="siteMap">
        <button type="button" class="pc"><img src="/img//user_img/close.png" alt=""></button>
        <ul class="siteMapLists">
            <li>
                <p>행사안내</p>
                <ul class="menus">
                    <li><a href="/outline.do">행사개요</a></li>
                    <li><a href="/map.do">행사장 안내도</a></li>
                    <li><a href="/schedule.do">행사 일정표</a></li>
                    <li><a href="/location.do">오시는 길</a></li>
                </ul>
            </li>
            <li>
                <p>전시관</p>
                <ul class="menus">
                    <li><a href="/exhibition.do">전시관 배치도</a></li>
                    <li><a href="/company.do">참가 기업 안내</a></li>
                    <li><a href="/local.do">로컬브랜드페스타</a></li>
                </ul>
            </li>
            <li>
                <p>프로그램</p>
                <ul class="menus">
                    <li><a href="/opening.do">개막식</a></li>
                    <li><a href="/funding_intro.do">크라우드 펀딩</a></li>
                    <li><a href="/lecture.do">특별강연</a></li>
                    <li><a href="/company_program.do">기업 프로그램</a></li>
                    <li><a href="/exp_program.do">체험 프로그램</a></li>
                </ul>
            </li>
            <li>
                <p><a href="/notice.do">커뮤니티</a></p>
            </li>
        </ul>
    </div>
</header>