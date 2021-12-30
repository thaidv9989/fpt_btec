<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>This is Major Management JSP Page</title>
</head>
<body>
	<div style="display: grid; justify-content: center;">
		<table style="width: 300px">
			<thead>
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>DESCRIPTION</th>
					<th>ACTION</th>
				</tr>
			</thead>
			<tbody id="major-table">

			</tbody>
		</table>
	</div>

	SEARCH BY :
	<select id="search-mode">
		<option disabled="disabled" selected="selected">Select Search Mode</option>
		<option value="name">Major Name</option>
		<option value="id">Major ID</option>
	</select>
	<input type="text" id="search-input" oninput="searchMajor()"/>
	<form id="exform">
		<input type="hidden" readonly id="majorId"><br> Name: <input
			type="text" id="majorName" /><br> Desc: <input type="text"
			id="majorDesc"/><br>
	</form>
	<button id="addMajor" onclick="validateMajorName()">Submit</button>
	<!-- <button id="updateMajor" onclick="updateMajor()">Update</button> -->
	<script type="text/javascript">
		var count = 0;
		
		function validateMajorName(){
			var result = false;
			$.ajax({
				url: "http://localhost:8083/cms-btec/api-majors/ce?name="+$("#majorName").val(),
				type: "GET",
				success: function(res){
					if(!res){
						addMajor()
						
					}
					else{
						alert("This major is existed. try another !"),
						$("#majorName").val("")
					}
				},
				error: function(res){
					console.log(res)
				}
			})
			console.log("Sau khi ra khoi ajax:", result)
			return result
		}
		
		function checkInput(){
			if(count >= 20){
				if($('#search-mode').val() === null){
					alert("YAMETEEEEEEEEEEEEEEEEEEEEE KUDASAIIIIIIIIIIIIIIIIIIIIII !")
					$('#search-input').val("")
					return false;
				}
			}
			if(count >= 10){
				if($('#search-mode').val() === null){
					alert("YOU MOTHER FUCKERRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR !")
					$('#search-input').val("")
					count += 1;
					return false;
				}
			}
			if(count >= 1){
				if($('#search-mode').val() === null){
					alert("I told you to SELECT SEARCH MODE, IDIOT!")
					$('#search-input').val("")
					count += 1;
					return false;
				}
			}
			if($('#search-mode').val() === null){
				$('#search-input').val("")
				alert("you must select search mode")
				count += 1;
				return false;
			}
			return true;
		}
		
		function searchMajor(){
			if(checkInput()){
				if($('#search-input').val().trim !== ""){
					if($('#search-mode').val() === "name"){
						$.ajax({
							type: "GET",
							url: "http://localhost:8083/cms-btec/api-majors?name="+$('#search-input').val(),
							success: function(res){
								let data = ""
									res.forEach(major => {
										data += '<tr>'
										data += '<td>'+major.majorId+'</td>'
										data += '<td>'+major.majorName+'</td>'
										data += '<td>'+major.majorDesc+'</td>'
										data += '<td><button onclick="deleteMajor('+major.majorId+')">delete</button></td>'
										data += '<tr>';
									});
									$("#major-table").html(data)
							},
							error: function(err){
								alert(err)
							}
						})
					}
					if($('#search-mode').val() === "id"){
						$.ajax({
							type: "GET",
							url: "http://localhost:8083/cms-btec/api-majors?id="+$('#search-input').val(),
							success: function(res){
								let data = ""
									res.forEach(major => {
										data += '<tr>'
										data += '<td>'+major.majorId+'</td>'
										data += '<td>'+major.majorName+'</td>'
										data += '<td>'+major.majorDesc+'</td>'
										data += '<td><button onclick="deleteMajor('+major.majorId+')">delete</button></td>'
										data += '<tr>';
									});
									$("#major-table").html(data)
							},
							error: function(err){
								alert(err)
							}
						})
					}
				}
			}
		}
		
		getTableData();
		$("#updateMajor").hide();
		
		function addMajor(){
			if($("#majorName").val().trim() === "" || $("#majorDesc").val().trim() === ""){
				alert("Major Name and Description must not be null or full of white space")
			}
			else{
					var json = {
							majorName: $("#majorName").val(),
							majorDesc: $("#majorDesc").val()
						}
						$.ajax({
							type: "POST",
							url: "http://localhost:8083/cms-btec/api-majors",
							data: JSON.stringify(json),
							contentType: "application/json",
							success: function(res){
								alert("Created Successfully !")
								getTableData();
								resetForm();
							},
							error: function(err){
								alert("THERE ARE ERROR IN THIS SYSTEM, GO CHECK IT NOW")
							}
						})			
			}
		}
		
		function getTableData(){
			$.ajax({
				type: "GET",
				url: "http://localhost:8083/cms-btec/api-majors",
				success: function(res){
					let data = ""
					res.forEach(major => {
						data += '<tr>'
						data += '<td>'+major.majorId+'</td>'
						data += '<td>'+major.majorName+'</td>'
						data += '<td>'+major.majorDesc+'</td>'
						
						data += '<td><button onclick="deleteMajor('+major.majorId+')">delete</button></td>'
						data += '<tr>';
					});
					$("#major-table").html(data)
				}
			})
		}
		
/* 		function editMajor(id){
			$.ajax({
				type: "GET",
				url: "http://localhost:8080/cms-btec/api-majors/detail?id="+id,
				success: function(res){
					$("#addMajor").hide()
					$("#updateMajor").show()
					$("#majorId").val(res.majorId)
					$("#majorName").val(res.majorName)
					$("#majorDesc").val(res.majorDesc)
				}
			})
		} */
		
		function resetForm(){
			majorId: $("#majorId").val("")
			majorName: $("#majorName").val("")
			majorDesc: $("#majorDesc").val("")
		}
		
/* 		function updateMajor(){
			var json = {
				majorId: $("#majorId").val(),
				majorName: $("#majorName").val(),
				majorDesc: $("#majorDesc").val()
			}
			$.ajax({
				type: "PUT",
				url: "http://localhost:8080/cms-btec/api-majors/detail",
				data: JSON.stringify(json),
				contentType: "application/json",
				success: function(res){
					getTableData();
					resetForm();
					$("#addMajor").show()
					$("#updateMajor").hide()
					alert("Updated Successfully !")
				},
				error: function(err){
					
				}
			})
		} */
		
		
		function deleteMajor(id){
			if(confirm("Do you really want to delete this major ?")){
				if(confirm("This is the last time to confirm, you really want to delete this major ????")){
					$.ajax({
						type: "DELETE",
						url: "http://localhost:8083/cms-btec/api-majors?id="+id,
						success: function(res){
							getTableData()
							alert("THAT POOR LITTLE MAJOR IS ON THE HEAVEN NOW, YOU BASTARD!)")
						},
						error: function(err){
							alert("YIKE! THERE ARE MANY SUBJECTs AND CLASSes BELONG TO THIS MAJOR, DELETE THEM FIRST THEN YOU CAN DELETE THIS MAJOR!")
						}
					})
				}
			}
		}
		
	</script>
</body>
</html>