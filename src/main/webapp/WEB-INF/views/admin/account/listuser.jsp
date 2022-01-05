<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="homeURL" value="/admin/home" />
<c:url var="editNewURL" value="/admin/user-manage/create" />
<c:url var="inactiveUsers" value="/admin/user-manage/inactive-users" />
<c:url var="usermanageURL" value="admin/user-manage" />
<!-- Start Main Content -->
<div id="content">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><a href="home">Home</a></li>
			<li>Manage Account</a></li>
		</ul>
	</div>
	<div id="main-content">
		<div class="container-content">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<div class="nav-tab">
								<button class="btn tablink first-tab" onclick="window.location.href='${usermanageURL}';">
									Account List
								</button>
								<button class="btn tablink" onclick="window.location.href='${inactiveUsers}';">
									Inactive User List
								</button>
								<button class="btn tablink" onclick="window.location.href='${editNewURL}';">
									Create New Account
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="table-content">
					<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
			            <thead>
			              <tr>
			                <th>UserName</th>
							<th>FullName</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Gender</th>
							<th>Actions</th>
			              </tr>
			            </thead>
			            <tfoot>
			              <tr>
			                <th>UserName</th>
							<th>FullName</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Gender</th>
							<th>Actions</th>
			              </tr>
			            </tfoot>
			            <tbody>
			              <c:forEach var="item" items="${model.listResult}">
								<tr>
									<td>${item.username}</td>
									<td>${item.fullName}</td>
									<td>${item.email}</td>
									<td>${item.phoneNumber}</td>
									<td><c:if test="${item.gender == 'm'}">Male</c:if><c:if test="${item.gender == 'f'}">Female</c:if></td>
									<td>
									<c:url var="editNewURL" value='/admin/user-manage/edit/${item.username}'/>
								<a href="${editNewURL}"><button><i class="fas fa-eye"></i> View Detail</button></a>
									</td>
								</tr>
							</c:forEach>
			            </tbody>
			          </table>
				</div>
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
								<span class="glyphicon glyphicon-calendar"></span> Calendar
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
										<h4 class="media-heading">Create major</h4>
										<p>Due : Saturday, 23 January 2021, 11:59 PM</p>
									</div>
								</li>
							</ul>
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
										<h4 class="media-heading">Create subject</h4>
										<p>Due : Saturday, 23 January 2021</p>
									</div>
								</li>
							</ul>
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
										<h4 class="media-heading">Create class</h4>
										<p>Due : Saturday, 23 January 2021</p>
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
<!-- <script>
var totalPages = ${model.totalPage};
var currentPage = ${model.page};
$(function() {
	window.pagObj = $('#pagination').twbsPagination({
		totalPages : totalPages,
		visiblePages : 3,
		startPage : currentPage,
		onPageClick : function(event, page) {
			if (currentPage != page) {
				$('#limit').val(6);
				$('#page').val(page);
				$('#formSubmit').submit();
			}
		}
	});
});
</script> -->