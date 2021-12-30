<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="logo">
		<img class="img-logo" src="<c:url value='template/assets/images/logo.png'/>" alt="" />
	</div>
	<!-- form -->
	<div class="container">
		<div class="row">
			<div class="col-md-5 mx-auto">
				<div id="first">
					<div class="myform form ">
						<div class="logo mb-3">
							<div class="col-md-12 text-center">
								<h1>Sign in</h1>
							</div>
						</div>
						<c:if test="${param.incorrectAccount != null}">
							<div class="alert alert-danger">Username or password
								incorrect</div>
						</c:if>
						<c:if test="${param.accessDenied != null}">
							<div class="alert alert-danger">you Not authorize</div>
						</c:if>
						<form action="<c:url value='j_spring_security_check'/>"
							method="post" name="login">
							<div class="form-group">

								<input type="text" name="j_username" class="form-control"
									id="email" aria-describedby="emailHelp" placeholder="Email">
							</div>
							<div class="form-group">

								<input type="password" name="j_password" id="password"
									class="form-control" aria-describedby="emailHelp"
									placeholder="Password">
							</div>
							<div class="form-group"></div>
							<div class="col-md-12 text-center ">
								<button type="submit"
									class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
							</div>
							<div class="col-md-12 ">
								<div class="login-or">
									<hr class="hr-or">
									<span class="span-or">or</span>
								</div>
							</div>
							<div class="col-md-12 mb-3">
							<div class="g-signin2" data-onsuccess="onSignIn"></div>
								<p class="text-center">
									<a href="javascript:void();" class="google btn mybtn"><i
										class="fa fa-google-plus"> </i>Google </a>
								</p>
							</div>
							<div class="form-group">
								<p class="text-center">
									Don't have account? <a href="#" id="signup">Sign up here</a>
								</p>
							</div>
						</form>

					</div>
				</div>
				<div id="second">
					<div class="myform form ">
						<div class="logo mb-3">
							<div class="col-md-12 text-center">
								<h1>Signup</h1>
							</div>
						</div>
						<form action="#" name="registration">
							<div class="form-group">
								<label for="exampleInputEmail1">First Name</label> <input
									type="text" name="firstname" class="form-control"
									id="firstname" aria-describedby="emailHelp"
									placeholder="Enter Firstname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Last Name</label> <input
									type="text" name="lastname" class="form-control" id="lastname"
									aria-describedby="emailHelp" placeholder="Enter Lastname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input
									type="password" name="password" id="password"
									class="form-control" aria-describedby="emailHelp"
									placeholder="Enter Password">
							</div>
							<div class="col-md-12 text-center mb-3">
								<button type="submit"
									class=" btn btn-block mybtn btn-primary tx-tfm">Get
									Started For Free</button>
							</div>
							<div class="col-md-12 ">
								<div class="form-group">
									<p class="text-center">
										<a href="#" id="signin">Already have an account?</a>
									</p>
								</div>
							</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>