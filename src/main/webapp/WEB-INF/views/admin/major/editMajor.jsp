<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="majormanageURL" value="/admin/major-manage?page=1&limit=4" />
<c:url var="homeURL" value="/admin/home" />
<c:url var="majorAPI" value="/api/major"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="content">
		<form action="<c:url value='/admin/major-manage/listMajor'/>"
			id="formSubmit" method="get">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><a href="${homeURL}">Home</a></li>
					<li><a href="${majormanageURL}">Manage Major</a></li>
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
						<c:url var="editNewURL" value="/admin/major-manage/edit" />
						<button class="btn tablink first-tab"
							onclick="openTab(event,'Major-Overview')">Major Overview</button>
					</div>
					<div id="Major-Overview" class="tab-content major-overview">
						<form:form class="form-horizontal" role="form" id="formSubmit"
							modelAttribute="model">
							<div class="form-group">
								<label for="exampleFormControlInput1">Major Name</label>
								<form:input path="majorName" cssClass="form-control" />
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Description</label>
								<form:textarea path="majorDesc" cssClass="form-control"
									id="majorDesc" rows="5" />
							</div>
							<form:hidden path="majorId" id="majorId" />
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-10">
									<c:if test="${not empty model.majorId}">
										<button class="btn btn-info" type="button"
											id="btnAddOrUpdateNew">
											<i class="ace-icon fa fa-check bigger-110"></i> Update
										</button>
									</c:if>
									<c:if test="${empty model.majorId}">
										<button class="btn btn-info" type="button"
											id="btnAddOrUpdateNew">
											<i class="ace-icon fa fa-check bigger-110"></i> Add new
										</button>
									</c:if>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="ace-icon fa fa-undo bigger-110"></i> Cancle
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
		</form>
	</div>
	<script>
	$('#btnAddOrUpdateNew').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
	    var majorId = $('#majorId').val();
	    if (majorId == "") {
	    	addNew(data);
	    } else {
	    	updateMajor(data);
	    }
	});
	
	function addNew(data) {
		$.ajax({
            url: '${majorAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${majormanageURL}?majorId="+result.majorId+"&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${editNewURL}?page=1&limit=4&message=error_system";
            }
        });
	}
	
	function updateMajor(data) {
		$.ajax({
            url: '${majorAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${majormanageURL}?majorId="+result.majorId+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${editNewURL}?majorId="+result.majorId+"&message=error_system";
            }
        });
	}
</script>
</body>
</html>