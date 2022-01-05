<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="manageclassURL" value="/trainer/manageclass?page=1&limit=4" />
<c:url var="homeURL" value="/trainer/home" />
<c:url var="changepwdURL" value="/" />
<c:url var="classAPI" value="/api/class" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		<div id="breadcrumbs">
		</div>
		<div id="main-content">
			<div class="right-content">
				<div id="Create-Code" class="tab-content">
				<div id="message" style="display: none; color: red"></div>
					<label>Current Password *</label>
					<div class="form-group pass_show">
						<input  type="password"  id="cpw" class="form-control"
							placeholder="Current Password" required>
					</div>
					<br>
					<label>New Password *</label>
					<div class="form-group pass_show">
						<input type="password" id="npw"
							class="form-control" placeholder="New Password" required>
					</div>
					<br>
					<label>Confirm Password *</label>
					<div class="form-group pass_show">
						<input type="password" id="cfpw"
							class="form-control" placeholder="Confirm Password" required>
					</div>
					<br>
					<button onclick="checkPassword()">Change Password</button>
				</div>
			</div>
		</div>
	</div>
		<script type="text/javascript">
		function displayMess(mess){
			$("#message").text(mess)
			$("#message").fadeIn(500, function(){
				$("#message").fadeOut(3000)	
			})
		}
		
		
		function checkPassword(){
			console.log(123)
			if($("#cpw").val().trim() === "" || $("#npw").val().trim() === "" || $("#cfpw").val().trim() === ""){
				displayMess("Password must not be empty or contains only white space!")
			}else{
				$.ajax({
					type: "GET",
					url: "http://localhost:8080/cms-btec/api/user/cpw?pwd="+$("#cpw").val(),
					success: function(res){
						if(res){
							changePwd()
						}
					},
					error: function(res){
						displayMess("Current password is incorrect !")
					}
				})
			}
		}
		
		function changePwd(){
			if($("#npw").val().length < 8){
				displayMess("Password length must equal or greater than 8 letters");
			}
			else{
				if($("#npw").val() !== $("#cfpw").val()){
					displayMess("Confirm password is not same as new password, try again !")
					$("#cfpw").val("")
				}
				else{
					$.ajax({
						type: "PUT",
						url: "http://localhost:8080/cms-btec/api/user/cpw?pwd="+$("#npw").val(),
						success: function(res){
							if(res){
								window.location.replace("http://localhost:8080/cms-btec/logout")
							}
						},
						error: function(res){
							displayMess("error !")
						}
					})	
				}
			}
		}
	</script>
	</body>
</html>