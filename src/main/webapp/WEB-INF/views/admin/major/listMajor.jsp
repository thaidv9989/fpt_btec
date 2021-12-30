<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div id="content">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><a href="trainer-index.html">Home</a></li>
			<li>Manage Major</li>
		</ul>
	</div>
	<div id="main-content">
		<div class="right-content">
			<div class="nav-tab">
				<button class="btn tablink first-tab"
					onclick="openTab(event,'Major-list')">Major List</button>
				<c:url var="editNewURL" value="/admin/major-manage/edit" />
				<button class="btn tablink" onclick="openTab(event, 'Create-Major')">
					<a href='${editNewURL}'>Create Major</a>
				</button>
			</div>
			<div id="major-list" class="tab-content major-list">
			<form action="<c:url value='/admin/major-manage'/>" id="formSubmit" method="get">
				<div class="row place-list">
					<c:forEach var="majorlist" items="${model.listResult}">
						<div class="col col-two s-col-full mt-16">
							<img src="<c:url value='/template/assets/images/p3.jpg' />"
								alt="" class="place-img" />
							<div class="place-body">
								<h3 class="place-heading">${majorlist.majorName}</h3>
								<c:url var="editNewURL" value='/admin/major-manage/edit'>
									<c:param name="majorId" value="${majorlist.majorId}" />
								</c:url>
								<a href="${editNewURL}"
									class="place-buy-btn js-buy-ticket s-full-width">View</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="hint-text">
					Showing <b>4</b> out of <b>6</b> entries
				</div>
				<ul class="pagination" id="pagination"></ul>	
				<input type="hidden" value="" id="page" name="page"/>
				<input type="hidden" value="" id="limit" name="limit"/>
				</form>
			</div>
		</div>
		<div id="sidebar">
			<div id="calendar">
				<div class="calendar-title">
					<i class="fas fa-calendar-alt"></i><span>Calendar</span>
				</div>
				<div class="wrapper">
					<div id="calendari"></div>
				</div>
			</div>
			<div class="events">
				<div class="events-title">
					<i class="fas fa-calendar-check"></i><span>Events</span>
				</div>
				<div>
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">
								<span class="glyphicon glyphicon-calendar"></span>  Calendar
								Events
							</h3>
						</div>
						<div class="panel-body">
							<ul class="media-list">
								<li class="media">
									<div class="media-left">
										<div class="panel panel-danger text-center date">
											<div class="panel-heading month">
												<span class="panel-title strong"> Mar </span>
											</div>
											<div class="panel-body day text-danger">23</div>
										</div>
									</div>
									<div class="media-body">
										<h4 class="media-heading">Assignment 1</h4>
										<p>Due : Saturday, 23 January 2021, 11:59 PM</p>
									</div>
								</li>
								<li class="media">
									<div class="media-left">
										<div class="panel panel-danger text-center date">
											<div class="panel-heading month">
												<span class="panel-title strong"> Jan </span>
											</div>
											<div class="panel-body text-danger day">16</div>
										</div>
									</div>
									<div class="media-body">
										<h4 class="media-heading">Assignment 1</h4>
										<p>Due : Saturday, 23 January 2021, 11:59 PM</p>
									</div>
								</li>
								<li class="media">
									<div class="media-left">
										<div class="panel panel-danger text-center date">
											<div class="panel-heading month">
												<span class="panel-title strong all-caps"> Dec </span>
											</div>
											<div class="panel-body text-danger day">8</div>
										</div>
									</div>
									<div class="media-body">
										<h4 class="media-heading">Assignment 1</h4>
										<p>Due : Saturday, 23 January 2021, 11:59 PM</p>
									</div>
								</li>
							</ul>
							<a href="#" class="btn btn-default btn-block">More Events »</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
var totalPages = ${model.totalPage};
var currentPage = ${model.page};
$(function() {
	window.pagObj = $('#pagination').twbsPagination({
		totalPages : totalPages,
		visiblePages : 3,
		startPage : currentPage,
		onPageClick : function(event, page) {
			if (currentPage != page) {
				$('#limit').val(4);
				$('#page').val(page);
				$('#formSubmit').submit();
			}
		}
	});
});
</script>