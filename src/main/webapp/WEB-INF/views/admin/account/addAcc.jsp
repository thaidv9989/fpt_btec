<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="usermanageURL" value="/admin/user-manage?page=1&limit=6" />
<c:url var="editAccURL" value="/admin/user-manage/edit" />
<c:url var="homeURL" value="/admin/home" />
<c:url var="userAPI" value="/api/user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="content">
		<%-- <form action="<c:url value='admin/user-manage'/>"
			id="formSubmit" method="get"> --%>
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><a href="${homeURL}">Home</a></li>
				<li><a href="${usermanageURL}">Manage Account</a></li>
			</ul>
		</div>
		<c:if test="${not empty message}">
			<div class="alert alert-${alert}">
				<strong>${message}!</strong>
			</div>
		</c:if>
		<div id="main-content">
			<div class="right-content">
				<div class="nav-tab">
					<c:url var="editAccURL" value="/admin/user-manage/edit" />
					<button class="btn tablink first-tab"
						onclick="openTab(event,'User-Overview')">
						<a href='${usermanageURL}'>Account Information</a>
					</button>
					<button class="btn tablink first-tab"
						onclick="openTab(event,'Create-Account')">
						<a href='${usermanageURL}'>Create Account</a>
					</button>
				</div>
				<div id="Create-Account" class="tab-content create-account">
					<form:form class="form-horizontal" role="form" id="formSubmitUser"
						modelAttribute="model">
						<div class="form-group">
							<label for="exampleFormControlInput1">UserName</label>
							<form:input path="username" cssClass="form-control"  />
						</div>
						<div class="form-group">
							<label for="exampleFormControlTextarea1">Password</label>
							<form:input path="password" cssClass="form-control" />
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Full Name</label>
							<form:input path="fullName" cssClass="form-control" />
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Date of Birth</label>
							<form:input type="date" cssClass="form-control" path="dob" />
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Email</label>
							<form:input path="email" cssClass="form-control" />
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput1">Phone</label>
							<form:input path="phoneNumber" cssClass="form-control" />
						</div>
						
						<form:hidden path="username" id="username" />
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-10">
								<c:if test="${not empty model.username}">
									<button class="btn btn-info" type="button"
										id="btnAddOrUpdateNew">
										<i class="ace-icon fa fa-check bigger-110"></i> Update
									</button>
								</c:if>
								<c:if test="${empty model.username}">
									<button class="btn btn-info" type="button"
										id="btnAddOrUpdateNew">
										<i class="ace-icon fa fa-check bigger-110"></i> Add new
									</button>
								</c:if>

								&nbsp; &nbsp; &nbsp;
								<button class="btn" type="reset">
									<i class="ace-icon fa fa-undo bigger-110"></i> Cancel
								</button>
							</div>
						</div>
					</form:form>
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
		<!-- 	</form> -->
	</div>
	<script>
	$('#btnAddOrUpdateNew').click(function (e) {
		var json = {
				
				username: $("#username").val(),
				password: $("#password").val(),
				fullName: $("#fullName").val(),
				phoneNumber: $("#phoneNumber").val(),
				email: $("#email").val(),
				dob: $("#dob").val()
			}
		$.ajax({
			type: "POST",
			url: "http://localhost:8083/cms-btec/api/user",
			data: JSON.stringify(json),
			contentType: "application/json",
			success: function(res){
				alert("Created Successfully !")
			},
			error: function(err){
				alert("THERE ARE ERROR IN THIS SYSTEM, GO CHECK IT NOW")
			}
			
		})	
	});
	
	function addNew(data) {
		$.ajax({
            url: '${userAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	console.log(result);
            	window.location.href = "${editAccURL}?username="+result.username+"&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${editAccURL}?page=1&limit=6&message=error_system";
            }
        });
	}
</script>
</body>
</html>