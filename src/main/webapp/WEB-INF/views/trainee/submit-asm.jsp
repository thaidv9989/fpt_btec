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
                    <input type="hidden" id="asmId"  value="${assignment.asmId}">
                    <input type="hidden" id="subAsmId" value="">
                    <input type="hidden" id="asmDueInSecond" value="${due}">
                    <table>
                        <tr>
                            <th>NAME</th>
                            <td>${assignment.asmName}</td>
                        </tr>
                        <tr>
                            <th>BRIEF</th>
                            <td><a href="${assignment.asmBrief}"><i class="fas fa-briefcase"> Brief </i></a></td>
                        </tr>
                        <tr>
                            <th>DUE</th>
                            <td>${assignment.asmDateDue} ${assignment.asmTimeDue}</td>
                        </tr>
                        <tr>
                            <th>SUBMISSION TYPE</th>
                            <td id="submitType">${assignment.subType}</td>
                        </tr>
                        <tr>
                            <th>SUBMISSION STATUS</th>
                            <td id="submit-status">No Attempt</td>
                        </tr>
                        <tr>
                            <th>SUBMISSION FILE</th>
                            <td id="submit-file">--</td>
                        </tr>
                        <tr>
                            <th>GRADE</th>
                            <td id="submit-grade">--</td>
                        </tr>
                        <tr>
                            <th>LAST MODIFIED</th>
                            <td id="submit-time">--</td>
                        </tr>
                    </table>
                    <div id="buttonUpload">
                        <button onclick="showFormEdit()">Edit Submission</button>
                    </div>
                    <div id="formButtonEdit">
                        <form id="formEdit">
                            <input id="fileEdit" required type="file" name="fileSubmit" formenctype="multipart/form-data"/>
                            <button type="submit">Submit File</button>
                        </form>
                    </div>
                    <div id="formUpload">
                        <h3>Hãy Submit Assignment Trầm Kẽm này đi bruh</h3>
                        <form id="formSubmit">
                            <input id="fileSubmit" required type="file" name="fileSubmit" formenctype="multipart/form-data"/>
                            <button type="submit">Submit File</button>
                        </form>
                    </div>
                </div>
                <script type="text/javascript">
                    $("#formUpload").hide();
                    $("#buttonUpload").hide();
                    $("#formButtonEdit").hide();
                    getSubmissionInfo();

                    function showFormEdit(){
                        $("#formButtonEdit").show();
                        $("#buttonUpload").hide();
                    }



                    $("#formEdit").on("submit", function (e){
                        e.preventDefault();
                        let a = $("#fileEdit").val().split(".").pop()
                        console.log($("#subAsmId").val())
                        let b = $("#submitType").text()
                        if(a === b){
                            $.ajax({
                                type: "POST",
                                url: "http://localhost:8083/cms-btec/trainee-api/upload",
                                data: new FormData(this),
                                enctype: 'multipart/form-data',
                                processData: false,
                                contentType: false,
                                cache: false,
                                success: function (res){
                                    $("#fileEdit").val("");
                                    $("#formButtonEdit").hide();
                                    let json = {
                                        subAsmId: $("#subAsmId").val(),
                                        asmId: $("#asmId").val(),
                                        comment: "hello",
                                        fileName: res
                                    }
                                    editAsm(json)
                                },
                                error: function (res) {
                                    alert("fail")
                                }
                            })
                        }
                        else{
                            alert("File extension must be: "+ b.toUpperCase())
                            $("#fileSubmit").val("");
                        }
                    })

                    function getSubmissionInfo(){
                        $.ajax({
                            type: "GET",
                            url: "http://localhost:8083/cms-btec/trainee-api/submission-info?asmId="+$("#asmId").val(),
                            success: function (res){
                                if(res == ""){
                                    $("#formUpload").show()
                                }
                                else{
                                    if($("#asmDueInSecond").val() - res.modifiedDate < 0){
                                        $("#submit-status").text("Overdue You Failed Bro :(")
                                    }else{
                                        console.log(res)
                                        $("#submit-time").text(new Date(res.modifiedDate).toLocaleString())
                                        if(res.subStatus == 1){
                                            $("#submit-status").text("Waiting for Grading")
                                        }
                                        if(res.subStatus == 2){
                                            $("#submit-status").text("Graded")
                                        }
                                        if(res.grade != -1){
                                            $("#submit-grade").text(res.grade)
                                        }
                                        $("#buttonUpload").show();
                                        $("#submit-file").text(res.fileName.split("-").pop());
                                        $("#subAsmId").val(res.subAsmId);
                                    }
                                }
                            },
                            error: function () {
                                alert("Something went wrong [x_x]")
                            }
                        })
                    }

                    function submitAsm(json){
                        $.ajax({
                            type: "POST",
                            url: "http://localhost:8083/cms-btec/trainee-api/submit-asm",
                            data: JSON.stringify(json),
                            contentType: "application/json",
                            success: function (res) {
                                alert("File submitted successfully")
                                getSubmissionInfo()
                                $("#buttonUpload").show();
                            }
                        })
                    }

                    function editAsm(json){
                        $.ajax({
                            type: "POST",
                            url: "http://localhost:8083/cms-btec/trainee-api/edit-asm",
                            data: JSON.stringify(json),
                            contentType: "application/json",
                            success: function (res) {
                                alert("File submitted successfully")
                                getSubmissionInfo()
                                $("#buttonUpload").show();
                            }
                        })
                    }


                    $("#formSubmit").on("submit", function (e){
                        e.preventDefault();
                        let a = $("#fileSubmit").val().split(".").pop()
                        console.log(a)
                        let b = $("#submitType").text().toLowerCase()
                        if(a === b){
                            $.ajax({
                                type: "POST",
                                url: "http://localhost:8083/cms-btec/trainee-api/upload",
                                data: new FormData(this),
                                enctype: 'multipart/form-data',
                                processData: false,
                                contentType: false,
                                cache: false,
                                success: function (res){
                                    $("#fileSubmit").val("");
                                    $("#buttonUpload").show();
                                    $("#formUpload").hide();
                                    let json = {
                                        asmId: $("#asmId").val(),
                                        comment: "hello",
                                        fileName: res
                                    }
                                    submitAsm(json)
                                },
                                error: function (res) {
                                    alert("fail")
                                }
                            })
                        }
                        else{
                            alert("File extension must be: "+ b.toUpperCase())
                            $("#fileSubmit").val("");

                        }
                    })
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
