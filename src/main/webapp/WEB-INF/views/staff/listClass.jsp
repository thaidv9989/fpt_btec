<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="homeURL" value="/staff/home" />
<c:url var="staffmanageURL" value="staff/manageclass?page=1&limit=6" />
<!-- Start Main Content -->
<div id="content">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><a href="homeURL">Home</a></li>
			<li>Manage Class</a></li>
		</ul>
	</div>
	<div id="main-content">
		<div class="container">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<div class="nav-tab">
								<button class="btn tablink first-tab"
									onclick="openTab(event,'Class-list')">Class List</button>
								<c:url var="editNewURL" value="/staff/edit" />
								<button class="btn tablink"
									onclick="openTab(event, 'Create-Account')">
									<a href='${editNewURL}'>Create Class</a>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="table-content">
<<<<<<< HEAD
=======
				<br>
				
				<input id="myInput" type="text" placeholder="Search..">
                 <br><br>
>>>>>>> 6bcedbe8c7732cf4a7ac0e0808005d8765735084
					<table id="example" class="table table-striped table-bordered" style="width:100%">
						<thead>
							<tr>
								<th>ClassName</th>
								<th>Modified By</th>
								<th>Created By</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody id="myTable">
							<c:forEach var="item" items="${model.listResult}">
								<tr>
									<td>${item.className}</td>
									<td>${item.modifiedBy}</td>
									<td>${item.createdBy}</td>
									<td>
									<c:url var="editNewURL" value='/staff/edit'>
									<c:param name="classId" value="${item.classId}" />
								</c:url>
								<button type="button" class="btn btn-primary" onclick="window.location.href='${editNewURL}'">Go Into</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			<!-- Edit Modal HTML -->
			<div id="editEmployeeModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content"></div>
				</div>
			</div>
			<!-- Delete Modal HTML -->
			<div id="deleteEmployeeModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content"></div>
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
				$('#limit').val(6);
				$('#page').val(page);
				$('#formSubmit').submit();
			}
		}
	});
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
