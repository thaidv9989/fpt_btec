<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Enter The Password To Access</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
</head>
<body>
        <div style="text-align: center">
            <h2>Enter The Password To Access</h2>
            <input type="hidden" id="classId" value="${classes}">
            <input type="text" id="password" required placeholder="Enter password">
            <button onclick="checkPass()">Let go</button>
        </div>
    <script type="text/javascript">
        function joinClass(json){
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/cms-btec/api/class/join-class",
                data: JSON.stringify(json),
                contentType: "application/json",
                success: function (res){
                    console.log(res)
                    window.location.replace("http://localhost:8080/cms-btec/trainee/class-details?id="+$("#classId").val())
                },
                error: function (res){
                    console.log(res)
                    alert("Something went wrong [X.X]")
                }
            })
        }

        function checkPass(){
            let json = {
                classId: $("#classId").val(),
                password: $("#password").val()
            }
            if($("#password").val().trim() !== ""){
                console.log(json);
                $.ajax({
                    type: "POST",
                    url: "http://localhost:8080/cms-btec/api/class/cp",
                    data: JSON.stringify(json),
                    contentType: "application/json",
                    success: function (res){
                        console.log(res)
                        if(res){
                            joinClass(json)
                        }
                    },
                    error: function (){
                        alert("Password is incorrect, please enter correct password !")
                    }
                })
            }else{
                alert("Password must not be empty or contains only whitespace !")
                $("#password").val("")
            }
        }
    </script>
</body>
</html>
