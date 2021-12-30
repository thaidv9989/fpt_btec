<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div id="content">
    <div id="breadcrumbs">
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/trainee/home">Home</a></li>
            <li>Manage Class</li>
        </ul>
    </div>
    <div id="main-content">
        <div class="right-content">
            <div id="Class-Overview" class="tab-content class-overview">
                <div>
                    Search By Subject <input type="text" id="search-input" oninput="searchClasses()">
                </div>
                <div class="row place-list">
                        <table style="width: 100%">
                            <thead>
                                <tr>
                                    <th>ClASS</th>
                                    <th>SUBJECT</th>
                                    <th>ACTION</th>
                                </tr>
                            </thead>
                            <tbody id="trainee-classes">

                            </tbody>
                        </table>
                </div>
                <script type="text/javascript">
                    getClasses()
                    function getClasses(){
                        $.ajax({
                            type : "GET",
                            url  : "http://localhost:8080/cms-btec/trainee-api/classes",
                            success: function (res) {
                                console.log(res)
                                let data = ""
                                res.forEach(c => {
                                    data += '<tr>'
                                    data += '<td>'+c.className+'</td>'
                                    data += '<td>'+c.subjectName+'</td>'
                                    data += '<td><a href="class-details?id='+c.classId+'">View</a></td>'
                                    data += '</tr>'
                                })
                                $('#trainee-classes').html(data)
                            }
                        })
                    }

                    function searchClasses(){
                            $.ajax({
                                type : "GET",
                                url  : "http://localhost:8080/cms-btec/trainee-api/classes?subjectName="+$('#search-input').val(),
                                success: function (res) {
                                    let data = ""
                                    res.forEach(c => {
                                        data += '<tr>'
                                        data += '<td>'+c.className+'</td>'
                                        data += '<td>'+c.subjectName+'</td>'
                                        data += '<td><a href="class-details?id='+c.classId+'">View</a></td>'
                                        data += '</tr>'
                                    })
                                    $('#trainee-classes').html(data)
                                }
                            })
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
