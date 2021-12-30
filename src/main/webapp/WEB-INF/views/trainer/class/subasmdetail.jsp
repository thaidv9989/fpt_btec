<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="subasmdetailURL" value="/trainer/classoverview/grade-subasm"/>
<c:url var="subasmAPI" value="/api/subasm"/>
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
				<li><a href="">My Classes</a></li>
				<li><a href="">Class 1</a></li>
				<li>Content Overview</li>
			</ul>
		</div>
		<div id="main-content">
			<div class="right-content">
				<div class="nav-tab">
					<button class="btn tablink first-tab"
						onclick="openTab(event,'content-overview')">
						View Assignment Submitsion</button>
				</div>
				<div id="view-sub-asm" class="tab-content content-overview">
					<embed
						src="<c:url value='../../template/assets/doc/Assignment1Pro.pdf'/>"
						type="application/pdf" class="sub-asm" />
				</div>
			</div>
			<c:if test="${not empty message}">
				<div class="alert alert-${alert}">
					<strong>${message}!</strong>
				</div>
			</c:if>
			<div id="sub-asm-grade">
				<div class="sub-asm-grade-info">
					<table class="grade-info">
						<tr>
							<th>Assignment Name</th>
							<td>Assignment 1</td>
						</tr>
						<tr>
							<th>Trainee ID</th>
							<td>Lam gi co</td>
						</tr>
						<tr>
							<th>Trainee Name</th>
							<td>${subasminfo.username}</td>
						</tr>
						<tr>
							<th>Due</th>
							<td>Tomorrow</td>
						</tr>
						<tr>
							<th>Last modified</th>
							<td>Today</td>
						</tr>
						<tr>
							<th>Grade Status</th>
							<td>${subasminfo.grade}</td>
						</tr>
					</table>
				</div>
				<div class="grade-cmt">
					<form:form role="form" id="formGradeSubasm"
						modelAttribute="subasminfo">
						<div class="grade">
							<h3>Grade</h3>
							<form:input type="number" min="1" max="100" path="grade"
								cssClass="sub-asm-grade" />
						</div>
						<div class="cmt">
							<h3>Comments</h3>
							<form:textarea style="resize: none" cssClass="sub-asm-cmt" path="comment"></form:textarea>
						</div>
						<form:hidden path="subAsmId"/>
						<button type="button" id="btnGradeSubAsm" value=""
							class="btn btn-grade-asm">Save</button>
					</form:form>

				</div>
			</div>
		</div>
	</div>
<script>
$('#btnGradeSubAsm').click(function(e) {
	e.preventDefault();
	var data = {};
	var formData = $('#formGradeSubasm').serializeArray();
	$.each(formData, function (i, v) {
        data[""+v.name+""] = v.value;
    });
	var subAsmId = $('#subAsmId').val();
    saveGrade(data);
});

function saveGrade(data) {
	$.ajax({
		url: '${subasmAPI}',
		type: 'PUT',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) {
            window.location.href = "${subasmdetailURL}?subAsmId="+result.subAsmId+"&message=update_success";
        },
        error: function (error) {
        	window.location.href = "${subasmdetailURL}?subAsmId="+result.subAsmId+"&message=error_system";
        }
	});
}
</script>

</body>
</html>