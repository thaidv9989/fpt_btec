<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="manageclassURL" value="/trainer/manageclass?page=1&limit=4"/>
<c:url var="homeURL" value="/trainer/home"/>
<c:url var="classoverviewURL" value="/trainer/manageclass/class-overview">
	<c:param name="classId" value="${classinfo.classId}"></c:param>
	<c:param name="page" value="1"></c:param>
	<c:param name="limit" value="4"></c:param>
</c:url>
<c:url var="editpassURL" value="/trainer/classoverview/editpass"/>
<c:url var="classAPI" value="/api/class"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="content">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><a href="${homeURL}">Home</a></li>
				<li><a href="${manageclassURL}">Manage Class</a></li>
				<li>BHAF-1911-2.2</li>
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
				<c:url var="createAsmURL" value="/trainer/classoverview/edit" />
					<button class="btn tablink"
						onclick="openTab(event,'Class-Overview')"><a href='${classoverviewURL}'>Class Overview</a></button>
					<button class="btn tablink"
						onclick="openTab(event, 'Create-Assignment')">
						<a href='${createAsmURL}'>Create Assignment</a>
					</button>
					<button class="btn tablink first-tab"
						onclick="openTab(event, 'Create-Code')">Edit Code</button>
					<button class="btn tablink"
						onclick="openTab(event, 'Manage-Student')">Manage
						Student</button>
				</div>
				<c:if test="${not empty message}">
					<div class="alert alert-${alert}">
 							<strong>${message}!</strong>
					</div>
		      	</c:if>
				<div id="Create-Code" class="tab-content">
					<form:form role="form" id="formEditPass" modelAttribute="classinfo">
						<h4>Code for Class</h4>
						<form:hidden path="classId"/>
						<form:hidden path="className"/>
						<form:input type="password" id="codeInput" cssClass="input-info" path="password"/><br/> 
						<input type="checkbox" id="" onclick="showpassFunc()" /> Show Password <br>
						<button type="button" id="btnEditPass" title="Edit" class="btn btn-create-code">Edit</button>
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
	</div>
	<script>
		$('#btnEditPass').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formEditPass').serializeArray();
			$.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
			var classId = $('#classId').val();
		    editPass(data);
		});
		
		function editPass(data) {
			$.ajax({
				url: '${classAPI}',
				type: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	                window.location.href = "${editpassURL}?classId="+result.classId+"&message=update_success";
	            },
	            error: function (error) {
	            	window.location.href = "${editpassURL}?classId="+result.classId+"&message=error_system";
	            }
			});
		}
	</script>
</body>
</html>