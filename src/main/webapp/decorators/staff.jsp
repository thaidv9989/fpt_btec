<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file = "/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Final Cms</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="google-signin-client_id" content="262933892162-f7bk4h6fh8hljn32nlpre1i71h7hm0e1.apps.googleusercontent.com" />
<!-- link header -->
<link rel="stylesheet"href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js">
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="<c:url value='/template/assets/js/test2.js' />"></script>
<script src="<c:url value='/template/assets/js/test3.js' />"></script>
<!-- <link rel="stylesheet"href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.0/bootstrap-table.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.9.1/extensions/editable/bootstrap-table-editable.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.9.1/extensions/export/bootstrap-table-export.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.9.1/extensions/filter-control/bootstrap-table-filter-control.js"></script> -->
<link rel="stylesheet" href="<c:url value='/template/assets/css/test2.css' />" />
<link rel="stylesheet" href="<c:url value='/template/assets/css/main.css' />" />
<link rel="stylesheet" href="<c:url value='/template/assets/css/upcoming-events.css' />" />
<link rel="stylesheet" href="<c:url value='/template/assets/css/search-nav.css' />" />
<link rel="stylesheet" href="<c:url value='/template/assets/css/calendar.css' />" />
<%-- <link rel="stylesheet" href="<c:url value='/template/assets/css/content-overview.css' />" /> --%>
<link rel="stylesheet" href="<c:url value='/template/assets/css/sidebar-nav-class.css' />" />
<link rel="stylesheet" href="<c:url value='/template/assets/css/view-sub-asm.css' />" />
<link rel="stylesheet" href="<c:url value='/template/assets/css/slideshow.css' />" />
<%-- <link rel="stylesheet" href="<c:url value='/template/assets/css/table.css' />" /> --%>
<link rel="stylesheet" href="<c:url value='/template/assets/css/alert.css' />" />
<link rel="stylesheet" href="<c:url value='/template/assets/css/update-profile.css' />" />
<link rel="stylesheet" href="<c:url value='/template/assets/css/responsive.css' />" />
<link rel="stylesheet" href="<c:url value='/template/assets/fonts/fontawesome-free-5.15.4-web/css/all.css' />" />
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Nunito" />
<%-- <script src="<c:url value='/template/assets/js/ace-extra.min.js' />"></script>
<script src="<c:url value='/template/assets/js/jquery.2.1.1.min.js' />"></script>
<script type='text/javascript' src='<c:url value="/template/assets/js/jquery-2.2.3.min.js" />'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript' src='<c:url value="/template/assets/js/jquery/jquery-2.2.3.min.js" />'></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> --%>

</head>
<body>

	<%@ include file = "/common/staff/header.jsp" %>

	<dec:body/>
	
	<%@ include file = "/common/staff/footer.jsp" %>
	    <%-- <script src="<c:url value='/template/assets/js/paging.js' />"></script> --%>
	<script src="<c:url value='/template/assets/js/calendar.js' />"></script>
	<script src="<c:url value='/template/assets/js/drop-user.js' />"></script>
	<script src="<c:url value='/template/assets/js/fixed-nav-top.js' />"></script>
	<script src="<c:url value='/template/assets/js/showpass.js' />"></script>
	<script src="<c:url value='/template/assets/js/sidebar-nav-class.js' />"></script>
	<%-- <script src="<c:url value='/template/assets/js/slideshow.js' />"></script> --%>
	<script src="<c:url value='/template/assets/js/table.js' />"></script>
	<%-- <script src="<c:url value='/template/assets/js/tablink.js' />"></script> --%>
	<script src="<c:url value='/template/assets/js/responsive.js' />"></script>
	<%-- <script src="<c:url value='/template/assets/js/edit-content.js' />"></script> --%>
	<script src="<c:url value='/template/assets/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/template/assets/js/jquery-ui.custom.min.js' />"></script>
	<script src="<c:url value='/template/assets/js/jquery.ui.touch-punch.min.js' />"></script>
	<script src="<c:url value='/template/assets/js/jquery.easypiechart.min.js' />"></script>
	<script src="<c:url value='/template/assets/js/jquery.sparkline.min.js' />"></script>
	<script src="<c:url value='/template/assets/js/jquery.flot.min.js' />"></script>
	<script src="<c:url value='/template/assets/js/jquery.flot.pie.min.js' />"></script>
	<script src="<c:url value='/template/assets/js/jquery.flot.resize.min.js' />"></script>
	<script src="<c:url value='/template/assets/js/ace-elements.min.js' />"></script>
	<script src="<c:url value='/template/assets/js/ace.min.js' />"></script>
	<script src="<c:url value='/template/assets/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/template/assets/js/google.js'/>"></script>
</body>
</html>