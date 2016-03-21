<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri ="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/GitlabMonitor/static/css/bootstrap.css">
<link rel="stylesheet"
	href="/GitlabMonitor/static/js/jquery/css/ui-lightness/jquery-ui-1.9.1.custom.css"
	type="text/css" charset="utf-8">
<title>Gitlab Monitor Register</title>
</head>
<body>
	<div class="container">
	<div class="row">
	
	<div class="col-md-4">
	</div>
	
	<div class="col-md-4">
		<sf:form class="form-signin" method="post" modelAttribute="user" action="/GitlabMonitor/register/add">
			<fieldset>
			<h2 class="form-signin-heading">Please Register</h2>
			<table cellspacing="0">
				<tr>
					<th style="float: right"><sf:label path="name">Name:&nbsp;&nbsp;</sf:label></th>
					<td><sf:input path="name" type="text" class="form-control" placeholder="name" />
						<sf:errors path="name" cssClass="error" />
					</td>
				</tr>
				<tr>
					<th style="float: right"><sf:label path="email" >Email address:&nbsp;&nbsp;</sf:label></th>
					<td><sf:input path="email" type="email" class="form-control" placeholder="email" /> 
						<sf:errors path="email" cssClass="error" />
					</td>
				</tr>
				<tr>
					<th style="float: right"><sf:label path="password" >Password:&nbsp;&nbsp;</sf:label></th>
					<td><sf:password path="password" class="form-control" placeholder="password" />
						<sf:errors path="password" cssClass="error" />
					</td>
				</tr>			
			</table>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
			</fieldset>
		</sf:form>
	</div>
	
	<div class="col-md-4">
	</div>
	</div>
	</div>
</body>
<script src="/GitlabMonitor/static/js/library/bootstrap.min.js"></script>
<script src="/GitlabMonitor/static/js/library/jquery-1.11.3.js"></script>
</html>