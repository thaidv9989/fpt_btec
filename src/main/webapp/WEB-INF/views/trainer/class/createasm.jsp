<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="contentdetailURL" value="/trainer/classoverview/${classlist.classId}/edit"/>
<c:url var="createNewAsmURL" value="/trainer/classoverview/${classlist.classId}/create"/>
<c:url var="classoverviewURL" value="/trainer/manageclass/class-overview"/>
<c:url var="asmAPI" value="/api/asm"/>
<c:url var="manageclassURL" value="/trainer/manageclass?page=1&limit=4"/>
<c:url var="homeURL" value="/trainer/home"/>
<c:url var="editpassURL" value="/trainer/classoverview/editpass">
	<c:param name="classId" value="${classlist.classId}" />
</c:url>
<c:url var="classoverviewtabURL" value="/trainer/manageclass/class-overview">
	<c:param name="classId" value="${classlist.classId}"></c:param>
	<c:param name="page" value="1"></c:param>
	<c:param name="limit" value="4"></c:param>
</c:url>
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
			<div id="main-content">
				<div class="right-content">
					<div class="nav-tab">
					
						<button class="btn tablink" onclick="window.location.href='${classoverviewtabURL}';">
							Class Overview
						</button>
						<button class="btn tablink" onclick="window.location.href='${createNewAsmURL}';">
							Create Assignment
						</button>
						<button class="btn tablink" onclick="window.location.href='${editpassURL}';">
							Edit Code
						</button>
						<button class="btn tablink"
							onclick="openTab(event, 'Manage-Student')">Manage
							Student</button>
					</div>
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">
  							<strong>${message}!</strong>
						</div>
			      	</c:if>
					<div id="Create-Assignment" class="tab-content">
						<form:form action="" role="form" id="formSubmitAsm" modelAttribute="model">
							<h4>Assignment Name</h4>
							<form:input cssClass="input-info edit-input" path="asmName"/>
							<h4>Assignment Brief</h4>
							<form:input cssClass="input-info edit-input" path="asmBrief"/>
							<h4>Submission Type</h4>
							<form:input cssClass="input-info edit-input" path="subType"/>
							<h4>Due</h4>
							<form:input type="date" cssClass="input-info edit-input" path="asmDateDue"/>
							<form:input type="time" step="2" value="01:00:00" cssClass="input-info edit-input" path="asmTimeDue"/>
							<h4>Limit Item</h4>
							<form:input cssClass="input-info edit-input" path="limitItem"/>
							<input type="hidden" name="classId" value="${classlist.classId}"/>
							<form:hidden path="asmId" id="asmId"/>
							<button type="button" id="btnAddOrUpdateAsm" title="Create Assignment"
									class="btn-edit-asm">Create Assignment</button>
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

	$('#btnAddOrUpdateAsm').click(function(e) {
		e.preventDefault();
		var data = {};
		var formData = $('#formSubmitAsm').serializeArray();
		$.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
	    var asmId = $('#asmId').val();
	    if (asmId == "") {
	    	addAsm(data);
	    } else {
	    	updateAsm(data);
	    }
	});
	
	function addAsm(data) {
		$.ajax({
            url: '${asmAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	let rs = confirm('Create new Assignment successfully! Do you want to create another assignment?');
            	if (rs == true) {
            			window.location.reload();
            		} else {
            			window.location.href = "${contentdetailURL}?asmId="+result.asmId;
            		}
            },
            error: function (error) {
            	window.location.href = "${classoverviewURL}?page=1&limit=4&message=error_system";
            }
        });
	}
	
	function updateAsm(data) {
		$.ajax({
            url: '${asmAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${contentdetailURL}?asmId="+result.asmId+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${contentdetailURL}?asmId="+result.asmId+"&message=error_system";
            }
        });
	}
	</script>
</body>
</html>