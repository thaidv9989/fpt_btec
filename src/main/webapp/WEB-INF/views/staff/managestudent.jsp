<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="mngtraineeURL" value="/trainer/manage-trainee">
	<c:param name="classId" value="${classinfo.classId }"/>
</c:url>
<c:url var="removeUserURl" value="/api/class/removeuser"/>
<c:url var="addTraineeURl" value="/api/class/addtrainee"/>
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
			 <button type="button" class="btn btn-secondary" onclick="history.back()"><i class="fas fa-arrow-left"></i> Go Back</button>
		</div>
		<div id="mng-content">
			<div id="Manage-Student" class="">
				<div class="container">
					<div class="title">
						<div class="row">
							<div class="col-sm-6">
								<h2 style="margin-bottom: 5px;">Trainee List</h2>
							</div>
							
						</div>
					</div>
					<div class="table-content">
						<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
				            <thead>
				              <tr>
				              	<th></th>
								<th>FullName</th>
								<th>Email</th>
								<th>Gender</th>
								<th>Actions</th>
				              </tr>
				            </thead>
				            <tfoot>
				              <tr>
				              	<th></th>
								<th>FullName</th>
								<th>Email</th>
								<th>Gender</th>
								<th>Actions</th>
				              </tr>
				            </tfoot>
				            <tbody>
					            <c:forEach var="user" items="${users.listResult}">
						        <tr>
						          <td class="bs-checkbox "><input type="checkbox" id="checkbox_${user.username}" value="${user.username}"></td>
						          <td>${user.fullName}</td>
								  <td>${user.email}</td>
								  <td><c:if test="${user.gender == 'm'}">Male</c:if><c:if test="${user.gender == 'f'}">Female</c:if></td>
								  <td>
								  <c:url var="editNewURL" value='/admin/user-manage/edit/${item.username}'/>
								  	<!-- <button type="button" data-toggle="modal" data-target="userDetailModal" class="btn btn-info">
								  		<i class="fas fa-eye"></i> View Detail
							  		</button> -->
							  		<button class="btn btn-info" data-toggle="modal" data-target="#myModal_${user.username}">
							          <i class="fas fa-eye"></i> View Detail
							        </button>
						  			<div class="modal fade" id="myModal_${user.username}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								        <div class="modal-dialog">
								          <div class="modal-content">
								            <div class="modal-header">
								              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								              <h4 class="modal-title" id="myModalLabel">Detail Infomation of ${user.fullName}</h4>
								            </div>
								            <div class="modal-body">
								              <label for="exampleInputEmail1">Full Name</label>
								              <input type="text" name="" id="" value="${user.fullName}" class="form-control" disabled>						             
								              <label for="exampleInputEmail1">Gender</label>
								              <c:if test="${user.gender == 'm' }"><input type="text" name="" id="" value="Male" class="form-control" disabled></c:if>
								              <c:if test="${user.gender == 'f' }"><input type="text" name="" id="" value="Female" class="form-control" disabled></c:if>
								              <label for="exampleInputEmail1">Email address</label>
								              <input type="text" name="" id="" value="${user.email}" class="form-control" disabled>
								              <label for="exampleInputEmail1">Phone Number</label>
								              <input type="text" name="" id="" value="${user.phoneNumber}" class="form-control" disabled>
								              <label for="exampleInputEmail1">Date of Birth</label>
								              <input type="text" name="" id="" value="${user.dob}" class="form-control" disabled>
								              <label for="exampleInputEmail1">Country</label>
								              <input type="text" name="" id="" value="${user.country}" class="form-control" disabled>
								              <%-- <label for="exampleInputEmail1">Join Date</label>
								              <input type="date" name="" id="" value="${user.createDate}" class="form-control" disabled> --%>
								            </div>
								            <div class="modal-footer">
								              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								            </div>
								          </div>
								          <!-- /.modal-content -->
								        </div>
								        <!-- /.modal-dialog -->
								      </div>
								  	<button type="button" class="btn btn-danger" onclick="warningBeforeRemove()"><i class="fas fa-user-slash"></i> Remove</button>
								  	<input type="hidden" id="username" name="username" value="${user.username}"/>
								  </td>
						        </tr>
						        </c:forEach>
				            </tbody>
				          </table>
					</div>
					<button type="button" class="btn btn-success" data-toggle="modal" data-target=".bd-example-modal-lg">Add New Trainee to Class</button>
					<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					      <table id="addmodal" class="table table-striped table-bordered" style="width:100%">
					        <thead>
					            <tr>
					            	<th></th>
					                <th>Username</th>
					                <th>Full Name</th>
					                <th>Gender</th>
					                <th>Action</th>
					            </tr>
					        </thead>
					        <tbody>
					        <c:forEach var="trainee" items="${trainees.listResult}">
					            <tr>
					            	<td><input type="checkbox" id="checkboxaddtrainee" value="${trainee.username}"/></td>
					                <td>${trainee.username}</td>
					                <td>${trainee.fullName}</td>
					                <td><c:if test="${trainee.gender == 'm'}">Male</c:if><c:if test="${trainee.gender == 'f'}">Female</c:if></td>
					                <td></td>
					            </tr>
				            </c:forEach>
					        </tbody>
					        
					    </table>
					    <button type="button" class="btn btn-success" onclick="warningBeforeAddUser()"><i class="fas fa-user-plus"></i> Add Trainee</button>
					    <input type="hidden" id="classId" name="username" value="${classinfo.classId}"/>
					    </div>
					    
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	function warningBeforeRemove() {
		let isRemove = confirm('Are you sure you want to remove these users ???');
		if (isRemove == true) {
			var usernames = $('tbody input[type=checkbox]:checked').map(function () {
	            return $(this).val();
	        }).get();
			alert(usernames, classId);
			/* removeUser(usernames); */
		}
	} 
	
	function warningBeforeAddUser() {
		let isRemove = confirm('Are you sure you want to add this trainee to the class???');
		if (isRemove == true) {
			var usernames = $('tbody input[type=checkbox]#checkboxaddtrainee:checked').map(function () {
	            return $(this).val();
	        }).get();
			var classId = $('#classId').map(function () {
	            return $(this).val();
	        }).get();
			addTrainee(usernames, classId);
		}
	} 
	
	function addTrainee(data) {
        $.ajax({
            url: '${addTraineeURl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
            	alert('Add Trainee to Class Successful !!!');
                window.location.reload();
            },
            error: function (error) {
            	alert('Somethings Went Wrong !');
            }
        });
    }
	
	function removeUser(data) {
        $.ajax({
            url: '${removeUserURl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
            	alert('Remove These User Successfull !!!');
                window.location.reload();
            },
            error: function (error) {
            	alert('Somethings Went Wrong !');
            }
        });
    }
	</script>
	
</body>
</html>