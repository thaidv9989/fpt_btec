<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
    <%@ page import="com.btec.util.SecurityUtils" %>
<c:url var="userAPI" value="/api/user"/>
<c:url var="updateProfileURL" value="/staff"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div id="content">
        <!-- <div id="breadcrumbs">
          <ul class="breadcrumb">
            <li><a href="">Home</a></li>
            <li>Update Profile</li>
          </ul>
        </div> -->
        <div class="clear"></div>
        <div id="main-content">
          <div class="right-content">
            <div class="nav-tab">
              <button
                class="btn tablink first-tab"
                onclick="openTab(event,'Class-Overview')"
              >
                Update profile
              </button>
            </div>
            <c:if test="${not empty message}">
				<div class="alert alert-${alert}">
					<strong>${message}!</strong>
				</div>
	      	</c:if>
            <div id="update-profile">
              <form:form role="form" id="formUpdateProfile" modelAttribute="userinfo" enctype="multipart/form-data">
                <table class="table-user-info">
                  <tr>
                    <th>Full Name</th>
                    <td>
                      <form:input
                        cssClass="input-user-info"
                        path="fullName"
                      />
                    </td>
                  </tr>
                  <tr>
                    <th>Email Address</th>
                    <td>
                      <form:input
                        cssClass="input-user-info"
                        path="email"
                      />
                    </td>
                  </tr>
                  
                  <tr>
                    <th>Phone Number</th>
                    <td>
                      <form:input
                        cssClass="input-user-info"
                        path="phoneNumber"
                      />
                    </td>
                  </tr>
                  <tr>
                    <th>Date Of Birth</th>
                    <td>
                      <form:input
                      	type="date"
                        cssClass="input-user-info"
                        path="dob"
                      />
                    </td>
                  </tr>
                  <!-- <tr>
                    <th>Decription</th>
                    <td>
                      <div id="editor">
                        <textarea class="input-user-info" name="user-desc" style="resize: none;" id="" cols="30" rows="5"></textarea>
                      </div>
                    </td>
                  </tr> -->
                  <tr>
                    <th></th>
                    <td>
                      <button id="btnUpdateProfile" class="btn btn-update-profile">
                        Update Profile
                      </button>
                      <button type="button" onclick="history.back()" class="btn btn-cancel-update-profile">
                        Cancel
                      </button>
                    </td>
                  </tr>
                  <form:hidden path="username"/>
                </table>
              </form:form>
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
                <i class="fas fa-calendar-check"></i
                ><span>Upcoming Events</span>
              </div>
              <div>
                <div class="panel panel-danger">
                  <div class="panel-heading">
                    <h3 class="panel-title">
                      <span class="glyphicon glyphicon-calendar"></span> 
                      Calendar Events
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
                              <span class="panel-title strong all-caps">
                                Dec
                              </span>
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
                    <a href="#" class="btn btn-default btn-block"
                      >More Events »</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <script type="text/javascript">
      $('#btnUpdateProfile').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formUpdateProfile').serializeArray();
			$.each(formData, function (i, v) {
	            data[""+v.name+""] = v.value;
	        });
		    var username = $('#username').val();
		    if (username == "") {
		    	addAsm(data);
		    } else {
		    	updateProfile(data);
		    }
		});
      
      function updateProfile(data) {
			$.ajax({
	            url: '${userAPI}',
	            type: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${updateProfileURL}/"+result.username+"?success=true&message=update_success";
	            },
	            error: function (error) {
	            	window.location.href = "${contentdetailURL}?classId="+result.classId+"&asmId="+result.asmId+"&message=error_system";
	            }
	        });
		}
      </script>
</body>
</html>