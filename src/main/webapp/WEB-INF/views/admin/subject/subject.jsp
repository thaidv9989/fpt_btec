<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div id="content">
	<div id="breadcrumbs">
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/admin/home">Home</a></li>
			<li>Manage Subjects</li>
		</ul>
	</div>
	<div id="main-content">
		<div class="right-content">
			<div id="Class-Overview" class="tab-content class-overview">
				<div>
					Search By: <select id="search-mode">
						<option disabled="disabled" selected="selected">Select
							Search Mode</option>
						<option value="subjectName">Subject Name</option>
						<option value="subjectId">Subject ID</option>
						<option value="majorName">Major Name</option>
					</select> <input type="text" id="search-input" oninput="searchSubjects()" />
					<button onclick="getSubjects()">Reset</button>
				</div>
				<div class="row place-list">
					
					<table style="width: 100%">
						<thead>
							<tr>
								<th>ID</th>
								<th>SUBJECT</th>
								<th>MAJOR</th>
								<th>ACTION</th>
							</tr>
						</thead>
						<tbody id="table-subject">

						</tbody>
					</table>
					<form id="exform">
						<div class="form-group">
							<input type="hidden" readonly id="subjectId"> <label
								class="control-label col-sm-2">Subject Name:</label>
							<div class="col-sm-3">
								<input type="text" id="subjectName" />
							</div>
							<select id="majorselect">
								
								
							</select>
						</div>
					</form>
					<button onclick="addSubject()">Add new</button>
				</div>
				<script type="text/javascript">
                    getSubjects()
                    getMajors()
                    function checkInput(){
                        if($("#search-mode").val() === null){
                            alert("You must Select Search Mode !")
                            $("#search-input").val("")
                            return false
                        }
                        return true
                    }
                    function getMajors(){
            			$.ajax({
            				type: "GET",
            				url: "http://localhost:8083/cms-btec/api-majors",
            				success: function(res){
            					let data = '<option disabled="disabled" selected="selected">Select Major</option>'
            					res.forEach(major => {
            						data += '<option value="'+major.majorId+'">'+major.majorName+'</option>'
            						
            					});
            					$("#majorselect").html(data)
            				}
            			})
            		}
                    function getSubjects(){
                        $("#search-input").val("")
                        $.ajax({
                            type : "GET",
                            url  : "http://localhost:8083/cms-btec/api-subjects",
                            success: function (res) {
                                let data = ""
                                res.forEach(s => {
                                    data += '<tr>'
                                    data += '<td>'+s.subjectId+'</td>'
                                    data += '<td>'+s.subjectName+'</td>'
                                    data += '<td>'+s.majorName+'</td>'
                                    data += '<td><button onclick="deleteSubject('+s.subjectId+')">delete</button></td>'
                                    data += '</tr>'
                                });
                                $('#table-subject').html(data)
                            }
                        })
                    }

                    function deleteSubject(id){
                        if(confirm("Are You Sure?")){
                            $.ajax({
                                type : "DELETE",
                                url  : "http://localhost:8083/cms-btec/api-subjects?id="+id,
                                success: function () {
                                    getSubjects();
                                },
                                error: function (){
                                    alert("There are classes are belong to this subject, this subject cannot be deleted !")
                                }
                            })
                        }
                    }
                    function addSubject(){
                    	console.log($("#subjectName").val().trim())
                    	console.log( $("#majorselect").val())
            			if($("#subjectName").val().trim() === "" || $("#majorselect").val() === null){
            				alert("You must select Major Name and Subject Name must not be null or full of white space")
            			}
            			else{
            					var json = {
            							subjectName: $("#subjectName").val(),
            							majorId: $("#majorselect").val()
            						}
            					
            						$.ajax({
            							type: "POST",
            							url: "http://localhost:8083/cms-btec/api-subjects",
            							data: JSON.stringify(json),
            							contentType: "application/json",
            							success: function(res){
            								alert("Created Successfully !")
            								getSubjects();
            								resetForm();
            							},
            							error: function(err){
            								alert("THERE ARE ERROR IN THIS SYSTEM, GO CHECK IT NOW")
            							}
            						})			
            			}
            		}
                    function searchSubjects(){
                        if(checkInput()){
                            if($("#search-input").val().trim() !== ""){
                                if($("#search-mode").val() === "subjectId"){
                                    $.ajax({
                                        type : "GET",
                                        url  : "http://localhost:8083/cms-btec/api-subjects?subjectId="+$('#search-input').val(),
                                        success: function (res) {
                                            let data = ""
                                            res.forEach(s => {
                                                data += '<tr>'
                                                data += '<td>'+s.subjectId+'</td>'
                                                data += '<td>'+s.subjectName+'</td>'
                                                data += '<td>'+s.majorName+'</td>'
                                                data += '<td><button onclick="deleteSubject('+s.subjectId+')">delete</button></td>'
                                                data += '</tr>';
                                            });
                                            $('#table-subject').html(data)
                                        },
                                        error: function (){
                                            alert("Subject ID must be a Natural Number equal or greater than zero")
                                        }
                                    })
                                }
                                if($("#search-mode").val() === "subjectName"){
                                    $.ajax({
                                        type : "GET",
                                        url  : "http://localhost:8083/cms-btec/api-subjects?subjectName="+$('#search-input').val(),
                                        success: function (res) {
                                            let data = ""
                                            res.forEach(s => {
                                                data += '<tr>'
                                                data += '<td>'+s.subjectId+'</td>'
                                                data += '<td>'+s.subjectName+'</td>'
                                                data += '<td>'+s.majorName+'</td>'
                                                data += '<td><button onclick="deleteSubject('+s.subjectId+')">delete</button></td>'
                                                data += '</tr>'
                                            });
                                            $('#table-subject').html(data)
                                        }
                                    })
                                }
                                if($("#search-mode").val() === "majorName"){
                                    $.ajax({
                                        type : "GET",
                                        url  : "http://localhost:8083/cms-btec/api-subjects?majorName="+$("#search-input").val(),
                                        success: function (res) {
                                            let data = ""
                                            res.forEach(s => {
                                                data += '<tr>'
                                                data += '<td>'+s.subjectId+'</td>'
                                                data += '<td>'+s.subjectName+'</td>'
                                                data += '<td>'+s.majorName+'</td>'
                                                data += '<td><button onclick="deleteSubject('+s.subjectId+')">delete</button></td>'
                                                data += '</tr>'
                                            });
                                            $('#table-subject').html(data)
                                        }
                                    })
                                }
                            }
                        }
                    }
                </script>
				<ul class="pagination" id="pagination"></ul>
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