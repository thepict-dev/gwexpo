<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String url = request.getRequestURL().toString();
	pageContext.setAttribute("url", url);
%>
<c:set var="company_list" value="${fn:indexOf(url, 'company_list')}"/>
<c:set var="company_register" value="${fn:indexOf(url, 'company_register')}"/>

<c:set var="funding_list_user" value="${fn:indexOf(url, 'funding_list_user')}"/>
<c:set var="funding_list_company" value="${fn:indexOf(url, 'funding_list_company')}"/>


<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="true" aria-controls="collapseLayouts1">
				행사관리
            </a>
            <!-- 
            <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="/admin/company_register.do" style="<c:if test="${company_register ne -1}">font-weight:700; color:#000</c:if>">기업 등록</a>
                </nav>
            </div>
             -->
            <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link" href="/admin/company_list.do" style="<c:if test="${company_list ne -1}">font-weight:700; color:#000</c:if>">기업 리스트</a>
                </nav>
            </div>
            
            
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts6" aria-expanded="true" aria-controls="collapseLayouts6">
				펀딩관리
            </a>
            <div class="collapse <c:if test="${funding_list_user ne -1 }">show</c:if>" id="collapseLayouts6" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${funding_list_user ne -1}">active</c:if>" href="/admin/funding_list_user.do">회사별 투자자 현황</a>
                </nav>
            </div>
            <div class="collapse <c:if test="${funding_list_company ne -1 }">show</c:if>" id="collapseLayouts6" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${funding_list_company ne -1}">active</c:if>" href="/admin/funding_list_company.do">회사전체 투자현황</a>
                </nav>
            </div>

		</div>
	</div>
</nav>
<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/scripts.js"></script>
<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>