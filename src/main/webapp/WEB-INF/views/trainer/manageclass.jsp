<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet"href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<%@ include file="/common/taglib.jsp"%>
<div id="content">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><a href="trainer-index.html">Home</a></li>
			<li>Manage Class</li>
		</ul>
	</div>
	<div id="main-content">
		<div class="right-content">
			<div class="nav-tab">
				<button class="btn tablink first-tab"
					onclick="openTab(event,'Class-Overview')">My Class</button>
			</div>
			<div id="Class-Overview" class="tab-content class-overview">
				<form action="<c:url value='/trainer/manageclass'/>" id="formSubmit"
					method="get">
					<div class="table-content">
						<label>Search</label> <input id="myInput" type="text" placeholder="Search.." style="padding: 6px; border-radius: 10px; height: 25px; border: 1px solid ;">
						<br> <br>
						<table id="example" class="table table-striped table-bordered"
							style="width: 100%">
							<thead>
								<tr>
									<th>Class ID</th>
									<th>Class Name</th>
									<th>Password</th>
									<th>Modified By</th>
									<th>Modified Date</th>
									<th>Created By</th>
									<th>Created Date</th>
									<th>Subject Name</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody id="myTable">
								<c:forEach var="item" items="${model.listResult}">
									<tr>
										<td>${item.classId}</td>
										<td>${item.className}</td>
										<td>${item.password}</td>
										<td>${item.modifiedBy}</td>
										<td>${item.modifiedDate}</td>
										<td>${item.createdBy}</td>
										<td>${item.createdDate}</td>
										<td>${item.subjectName}</td>
										<td><c:url var="classoverviewURL"
												value='/trainer/manageclass/class-overview?page=1&limit=10'>
												<c:param name="classId" value="${item.classId}" />
											</c:url> <a href="${classoverviewURL}" class=""><i
												class="fas fa-eye"></i>View</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="clearfix">
						<div class="pagination">
							<ul class="pagination" id="pagination"></ul>
							<input type="hidden" value="" id="page" name="page" /> <input
								type="hidden" value="" id="limit" name="limit" />
						</div>
					</div>
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
				$('#limit').val(10);
				$('#page').val(page);
				$('#formSubmit').submit();
			}
		}
	});
});

	$('#btnAddOrUpdateAsm').click(function(e) {
		e.preventDefault();
		var data = {};
		var formData = $('#formSubmitAsm').serializeArray();
		$.each(formData, function(i, v) {
			data["" + v.name + ""] = v.value;
		});
		var asmId = $('#asmId').val();
		if (asmId == "") {
			addAsm(data);
		} else {
			updateAsm(data);
		}
	});
</script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>