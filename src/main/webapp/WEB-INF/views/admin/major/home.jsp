<%@ include file="/common/taglib.jsp"%>
<!-- Start Main Content -->
<div id="content">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><a href="homeURL">Home</a></li>
			<li><a href="manageaccountURL">Manage Account</a></li>
			<li>Manage Account</li>
		</ul>
	</div>
	<div id="main-content">
		<div class="container-content">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<h2 style="margin-bottom: 5px;">Manage Account</h2>
						</div>
					</div>
				</div>
				<div class="table-content">
					<table class="table table-striped table-hover .w-auto">
						<thead>
							<tr>
								<th>UserName</th>
								<th>FullName</th>
								<th>Password</th>
								<th>DOB</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${model.listResult}">
								<tr>
									<td>${item.username}</td>
									<td>${item.fullName}</td>
									<td>${item.password}</td>
									<td>${item.dob}</td>
									<td>${item.email}</td>
									<td>${item.phone}</td>
									<td><a href="#editEmployeeModal" class="edit"
										data-toggle="modal"><i class="material-icons"
											data-toggle="tooltip" title="Edit">&#xE254;</i></a> <a
										href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i
											class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- Pagination -->
				<div class="clearfix">
					<div class="hint-text">
						Showing <b>5</b> out of <b>100</b> entries
					</div>
					<div class="pagination">
						<a href="#">&laquo;</a> <a class="active" href="#">1</a> <a
							href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
						<a href="#">6</a> <a href="#">&raquo;</a>
					</div>
				</div>
				<!-- End Pagination -->
			</div>
			<!-- Edit Modal HTML -->
			<div id="editEmployeeModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<form>
							<div class="modal-header">
								<h4 class="modal-title">Edit major</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label>ID</label> <input type="text" class="form-control"
										required />
								</div>
								<div class="form-group">
									<label>Name</label> <input type="text" class="form-control"
										required />
								</div>
								<div class="form-group">
									<label>Trainer</label> <input type="text" class="form-control"
										required />
								</div>
								<div class="form-group">
									<label>number of subject</label> <input type="text"
										class="form-control" required />
								</div>
								<div class="form-group">
									<label>number of class</label> <input type="text"
										class="form-control" required />
								</div>
								<div class="form-group">
									<label>Date of created</label> <input type="date"
										class="form-control" required />
								</div>
								<div class="form-group">
									<label>Classroom</label> <input type="text"
										class="form-control" required />
								</div>
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-default"
									data-dismiss="modal" value="Cancel" /> <input type="submit"
									class="btn btn-info" value="Save" />
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Delete Modal HTML -->
			<div id="deleteEmployeeModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<form>
							<div class="modal-header">
								<h4 class="modal-title">Delete major</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
							</div>
							<div class="modal-body">
								<p>Are you sure you want to delete these Records?</p>
								<p class="text-warning">
									<small>This action cannot be undone.</small>
								</p>
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-default"
									data-dismiss="modal" value="Cancel" /> <input type="submit"
									class="btn btn-danger" value="Delete" />
							</div>
						</form>
					</div>
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
</div>
<script>
	var totalPages = $
	{
		model.totalPage
	};
	var currentPage = $
	{
		model.page
	};
	$(function() {
		window.pagObj = $('#pagination').twbsPagination({
			totalPages : totalPages,
			visiblePages : 10,
			startPage : currentPage,
			onPageClick : function(event, page) {
				if (currentPage != page) {
					$('#limit').val(2);
					$('#page').val(page);
					$('#formSubmit').submit();
				}
			}
		});
	});
</script>