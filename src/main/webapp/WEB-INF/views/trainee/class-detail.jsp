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
                <div class="row place-list">
                    <c:if test="${empty assignment}">
                        <h2 style="color: red">This class is being prepared, please wait your mentor announcements!</h2>
                    </c:if>
                    <c:if test="${assignment.size() > 0}">
                        <div class="topic">
                            <h1 class="topic-title">Resource</h1>
                            <div class="topic-content">
                                <ul>
                                    <a href="${content}"><i class="fas fa-book"></i><span>Click Me</span></a>
                                </ul>
                            </div>
                        </div>
                        <c:forEach begin="0" end="${assignment.size()-1}" items="${assignment}" var="a" varStatus="loop">
                            <div class="topic">
                                <h1 class="topic-title">ASM ${loop.index + 1}</h1>
                                <div class="topic-content">
                                   
                                        <a href="submit-asm?id=${a.asmId}"><i class="fas fa-file-alt"></i> <span>${a.asmName}</span></a>
                                    	<span style="float: right; color: ${a.status == 1 ? "blue" : "red"}">${a.status == 1 ? "Submitted" : "No Attempt"}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <script type="text/javascript">

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
