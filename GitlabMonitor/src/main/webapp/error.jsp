<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/GitlabMonitor/static/css/bootstrap.css">
<link rel="stylesheet" href="/GitlabMonitor/static/js/jquery/css/ui-lightness/jquery-ui-1.9.1.custom.css" type="text/css" charset="utf-8">
</head>
<body>

<nav class="navbar navbar-inverse" style="margin-bottom:0">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Gitlab Monitor</a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/GitlabMonitor/">Home <span class="sr-only">(current)</span></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Student <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/GitlabMonitor/student/summary">Student Summary</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="/GitlabMonitor/student/commit">Student Detail</a></li>
          </ul>
        </li>
        
		<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Project <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/GitlabMonitor/project/summary">Project Summary</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="/GitlabMonitor/project/commit">Project Detail</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="/GitlabMonitor/project/score">Project Score</a></li>
          </ul>
        </li>
      </ul>

    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="jumbotron">
<div class="container">
<h1>Gitlab Monitor<small>&nbsp;&nbsp;let us help you</small></h1>
</div>
</div>
<div class="container">
<div class="row">

  <div class="col-md-2">
  </div>
  
  <div class="col-md-8">
    <h1>A-oh ~ Game over!</h1>
    <h3>You win some.you lose some.For a military commander,winning or losing a battle is a common occurrence; Victories or defeats are ordinary things to a general.</h3>
  	<h3>Just try again~</h3>
  </div>
  
  <div class="col-md-2">
  </div>
  
</div>
</div>

</body>
<script src="/GitlabMonitor/static/js/library/jquery-1.11.3.js"></script>
<script src="/GitlabMonitor/static/js/library/bootstrap.min.js"></script>
</html>