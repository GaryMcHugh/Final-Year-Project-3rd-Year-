<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Main menu</title>
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
		<form action="">
			<div class="row">
				<h2 align="center">Main Menu</h2>
				<br /> <br />
				<div class="col-md-2"></div>

				<div class="col-md-2">
					<p>
						<a href="AddPatient.jsp">
							<button type="button" class="btn btn-primary">Add
								Patient</button>
						</a> <br /> <br /> <a href="FindPatient.jsp">
							<button type="button" class="btn btn-primary">Find
								Patient</button>
						</a> <br /> <br /> <a href="DeletePatient.jsp">
							<button type="button" class="btn btn-primary">Delete
								Patient</button>
						</a> <br /> <br /> <a href="TableView.jsp">
							<button type="button" class="btn btn-primary">View
								Patients</button>
						</a>
					</p>
				</div>

				<div class="col-md-2"></div>

				<div class="col-md-2"></div>
				<div class="col-md-2">
					<p>
						<a href="AddDoctor.jsp">
							<button type="button" class="btn btn-primary">Add Doctor</button>
						</a> <br /> <br /> <a href="FindDoctor.jsp">
							<button type="button" class="btn btn-primary">Find
								Doctor</button>
						</a> <br /> <br /> <a href="DeleteDoctor.jsp">
							<button type="button" class="btn btn-primary">Delete
								Doctor</button>
						</a> <br /> <br /> <a href="DoctorView.jsp">
							<button type="button" class="btn btn-primary">View
								Doctors</button>
						</a>
					</p>
				</div>
				<div class="col-md-2"></div>
			</div>
		</form>
	</div>

</body>
</html>