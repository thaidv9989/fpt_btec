<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="manageclassURL" value="/trainer/manageclass?page=1&limit=4" />
<c:url var="homeURL" value="/trainer/home" />
<c:url var="changepwdURL" value="/" />
<c:url var="classAPI" value="/api/class" />
<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
.pass_show {
	position: relative
}

.pass_show .ptxt {
	position: absolute;
	top: 50%;
	right: 10px;
	z-index: 1;
	color: #f36c01;
	margin-top: -10px;
	cursor: pointer;
	transition: .3s ease all;
}

.pass_show .ptxt:hover {
	color: #333333;
}
</style>
<body>
	<div id="content">
		<div id="breadcrumbs"></div>
		<c:if test="${not empty message}">
			<div class="alert alert-${alert}">
				<strong>${message}!</strong>
			</div>
		</c:if>
		<div class="row">
			<div class="col-sm-4">
				<div id="Create-Code" class="tab-content" style="border: 1px solid; margin-top: 50px; ">
					<input type="hidden" id="username" value="${username}" /> <label>Current
						Password</label>
					<div class="form-group pass_show">
						<input type="password" id="cpw" value="dasak" class="form-control"
							placeholder="Current Password">
					</div>
					<br> <label>New Password</label>
					<div class="form-group pass_show">
						<input type="password" id="npw" class="form-control"
							placeholder="New Password">
					</div>
					<br> <label>Confirm Password</label>
					<div class="form-group pass_show">
						<input type="password" id="cpf" class="form-control"
							placeholder="Confirm Password">
					</div>
					<br> <input type="submit"
						class="col-xs-12 btn btn-primary btn-load btn-lg"
						data-loading-text="Changing Password..." value="Change Password">
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('.pass_show').append('<span class="ptxt">Show</span>');
		});

		$(document).on('click', '.pass_show .ptxt', function() {

			$(this).text($(this).text() == "Show" ? "Hide" : "Show");

			$(this).prev().attr('type', function(index, attr) {
				return attr == 'password' ? 'text' : 'password';
			});

		});
	</script>
</body>
</html>