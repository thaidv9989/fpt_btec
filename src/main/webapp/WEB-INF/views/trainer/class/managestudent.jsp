<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="mngtraineeURL" value="/trainer/manage-trainee">
	<c:param name="classId" value="${classinfo.classId }"/>
</c:url>
<c:url var="removeUserURl" value="/api/trainer/class"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="content">
		<div id="breadcrumbs">
			<ul class="breadcrumb">
				<li><a href="">Home</a></li>
				<li><a href="manage-class.html">Manage Class</a></li>
				<li>BHAF-1911-2.2</li>
			</ul>
		</div>
		<div id="main-content">
			<div id="Manage-Student" class="tab-content">
				<div class="table-wrapper">
					<div class="table-title">
						<div class="row">
							<div class="col-sm-6">
								<h2 style="margin-bottom: 5px;">Trainee List</h2>
							</div>
							
						</div>
					</div>
					<div class="table-content">
						<table class="table table-striped table-hover .w-auto">
							<thead>
								<tr>		
									<th>Name</th>
									<th>DOB</th>
									<th>Email</th>
									<th>Phone</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="users" items="${userList.listResult}">
								<input type="hidden" id="classId" name="classId" value="${classinfo.classId}"/>
								<input type="hidden" id="username" name="username" value="${users.username}"/>
								<tr>
									<td>${users.fullName}</td>
									<td>${users.dob}</td>
									<td>${users.email}</td>
									<td>${users.phoneNumber}</td>
									<td><button type="button" id="btnEditUser" title="Edit"
											class="btn-edit-asm"><i class="fas fa-user-edit"></i> Edit</button>
										<button style="background-color: #D11A2A; color : #fff;" id="btnRemoveUser" class="btn btn-delete" type ="button" onclick="warningBeforeDelete()">
											<i class="fas fa-trash"></i> Delete
										</button>
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
									<h4 class="modal-title">Edit Trainee</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;
									</button>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label>Name</label> <input type="text" class="form-control"
											required />
									</div>
									<div class="form-group">
										<label>Date of Birth</label> <input type="date"
											class="form-control" required />
									</div>
									<div class="form-group">
										<label>Phone</label> <input type="text" class="form-control"
											required />
									</div>
									<div class="form-group">
										<label>Grade</label> <input type="text" class="form-control"
											required />
									</div>
								</div>
								<div class="modal-footer">
									<input type="button" class="btn btn-default"
										data-dismiss="modal" value="Cancel" />
									<input type="submit" class="btn btn-info" value="Save" />
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
									<h4 class="modal-title">Delete Trainee</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;
									</button>
								</div>
								<div class="modal-body">
									<p>Are you sure you want to delete these Records?</p>
									<p class="text-warning">
										<small>This action cannot be undone.</small>
									</p>
								</div>
								<div class="modal-footer">
									<input type="button" class="btn btn-default"
										data-dismiss="modal" value="Cancel" />
									<input type="submit" class="btn btn-danger" value="Delete" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	function warningBeforeDelete() {
		swal({
		  title: "Delete Confirm",
		  text: "Are you sure you want to delete? This action cannot be undone",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-success",
		  cancelButtonClass: "btn-danger",
		  confirmButtonText: "Confirm",
		  cancelButtonText: "Cancel",
		}).then(function(isConfirm) {
		  if (isConfirm) {
			  	var classId = $('#classId');
			  	var users = $('#username').map(function () {
		            return $(this).val();
		        }).get();
				removeUser(users);
		  }
		});
	} 
	
	function removeUser(data, classId) {
        $.ajax({
            url: '${removeUserURl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${mngtraineeURL}&message=delete_success";
            },
            error: function (error) {
            	window.location.href = "${mngtraineeURL}&message=error_system";
            }
        });
    }
	</script>
</body>
</html>