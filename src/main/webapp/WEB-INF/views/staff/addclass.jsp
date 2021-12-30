<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/common/taglib.jsp"%>
<c:url var="classAPI" value="/api/class"/>
<c:url var="homeURL" value="/staff/home"/>
<c:url var="staffmanageclassURL" value="/staff/manageclass?page=1&limit=4"/>
<c:url var="staffaddclassURL" value="/staff/edit"/>
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
				<li><a href="${staffmanageclassURL}">Manage Class</a></li>
				<li>BHAF-1911-2.2</li>
			</ul>
		</div>
		<div id="main-content">
			<div class="right-content">
				<div class="nav-tab">
					<c:url var="classoverviewtabURL"
						value="/staff/edit">
						<c:param name="classId" value="${classlist.classId}"></c:param>
						<c:param name="page" value="1"></c:param>
						<c:param name="limit" value="4"></c:param>
					</c:url>
					<button class="btn tablink first-tab">
						Create New Class
					</button>
				</div>
				<c:if test="${not empty message}">
					<div class="alert alert-${alert}">
						<strong>${message}!</strong>
					</div>
				</c:if>
				<div id="Create-Assignment" class="tab-content">
					<form:form role="form" id="formAddClass" modelAttribute="classmodel">
						<h4>Class Name</h4>
						<form:input cssClass="input-info" path="className"/>
						<h4>Select Subject</h4>
						<form:select path="subjectId" cssClass="input-info">
							<form:option value="" label="---Pick a Subject---" />
							<form:options items="${subjectmodel}"/>
						</form:select>
						<h4>Select Content</h4>
						<form:select path="contentId" cssClass="input-info">
							<form:option value="" label="---Pick a Content---" />
							<form:options items="${contentmodel}"/>
						</form:select>
						<h4>Select Trainer</h4>
						<form:select path="username" cssClass="input-info">
							<form:option value="" label="---Pick a Trainer---" />
							<form:options items="${usermodel}"/>
						</form:select>
						<br/>
						<form:hidden path="classId"/>
						<button type="button" id="btnAddClass" class="btn btn-create-asm">Create
						Class</button>
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
		$('#btnAddClass').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formAddClass').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			var classId = $('#classId').val();
			if (classId == "") {
				addClass(data);
			} else {
				updateClass(data);
			}
		});

		function addClass(data) {
			$.ajax({
				url : '${classAPI}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${staffaddclassURL}";
				},
				error : function(error) {
					window.location.href = "${staffmanageclassURL}?page=1&limit=6&message=error_system";
				}
			});
		}

		function updateClass(data) {
			$.ajax({
				url : '${classAPI}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${contentdetailURL}?classId="+ result.classId+"&message=update_success";
				},
				error : function(error) {
					window.location.href = "${contentdetailURL}?classId="+ result.classId+"&message=error_system";
				}
			});
		}
	</script>
</body>
</html>