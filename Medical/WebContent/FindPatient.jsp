<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Find Patient</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"
	type="text/javascript"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="container">
		<br />
		<br />
		<div class="col-md-1 col-md-offset-2">
			<a href="MainMenu.jsp">
				<button type="submit" class="btn btn-default" name="submit">
					<img src="home.png" width="20" height="20" alt="" />
				</button>
			</a>
		</div>
		<h2 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Find
			Patient</h2>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<form class="form-inline" name="myForm" action="display.jsp"
					method="POST">
					<div class="form-group">
						<br /> <label for="exampleInputEmail1">Patient_Id: </label> <input
							name="id" class="form-control" id="InputFindPatient"
							placeholder="P12345">
					</div>
					<br /> <br />
					<div class="col-md-6 col-md-offset-3">
						<button type="submit" class="btn btn-success" name="submit">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>