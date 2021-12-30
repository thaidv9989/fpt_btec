<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.btec.util.SecurityUtils" %>
<div id="container">
	<div id="top">
		<div class="header-logo">
			<a href="trainer-index.html"><img class="img-logo"
				src="<c:url value='/template/assets/images/logo.png' />" alt="" /></a>
		</div>
		<div class="header-user">
			<security:authorize access="isAnonymous()">
				<a class="nav-link" href="<c:url value='/login'/>">Login</a>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
				<div class="notifi">
					<i class="far fa-bell header-icon"></i><span class="badge">3</span>
				</div>
				<div class="drop-user">
					<button onclick="dropdownFunc()" class="btn-drop-user">
						<img class="img-user btn-user-element"
							src="<c:url value='/template/assets/images/user-img.jpg' />"
							alt="" /> <span class="btn-user-element"><%=SecurityUtils.getPrincipal().getFullName()%></span> <i
							class="fas fa-chevron-down btn-user-element"></i>
					</button>
					<div id="drop" class="header-sub-nav">
						<a href="update-profile.html"><i class="fas fa-user-cog"></i>
							<span>Settings</span></a> <a href="<c:url value='/logout'/>"><i
							class="fas fa-sign-out-alt"></i> <span>Log out</span></a>
					</div>
					<button onclick="openNav()" class="btn-side-nav">
						<span class="btn-user-element"><%=SecurityUtils.getPrincipal().getFullName()%></span>
					</button>
					<div id="mySidenav" class="sidenav">
						<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
						<img class="img-user-sidenav"
							src="<c:url value='/template/assets/images/user-img.jpg' />"
							alt="" /> <a href="update-profile.html"><i
							class="fas fa-user-cog"></i> <span>Settings</span></a> <a href="<c:url value='/logout'/>"><i
							class="fas fa-sign-out-alt"></i> <span>Log out</span></a>
					</div>
				</div>
			</security:authorize>
		</div>
	</div>
	<!-- Start Navigation -->
	<div id="navigation" class="topnav">
		<ul id="nav">
			<li><a href="<c:url value='/trainer/home'/>"><i
					class="fas fa-home"></i> Home</a></li>
			<li class="dropres" onclick="dropRes()"><a href="#"> <i
					class="fas fa-house-user"></i> My Class <i
					class="fas fa-angle-down"></i>
			</a>
				<ul class="subnav">
					<li><a href="<c:url value='/trainer/manageclass?page=1&limit=4'/>"><i
							class="fas fa-graduation-cap"></i> Manage Class</a></li>
					<li><a href="manage-student.html"><i
							class="fas fa-user-graduate"></i> Manage Student</a></li>
				</ul></li>
			<li><a href="<c:url value='#'/>"><i class="fas fa-calendar-day"></i>
					Event</a></li>
		</ul>
		<a href="javascript:void(0);" class="nav-icon" onclick="dropNavRes()">&#9776;</a>
		<div class="search-nav">
			<form class="navbar-form" action="">
				<input type="text" placeholder="Search..." name="search" id="search" />
				<button type="submit" class="icon">
					<i class="fas fa-search"></i>
				</button>
			</form>
		</div>
	</div>
	<!-- End Navigation -->