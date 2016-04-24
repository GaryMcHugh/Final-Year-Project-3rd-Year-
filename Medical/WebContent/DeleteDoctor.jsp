<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Delete Doctor</title>
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
<style type="text/css">
IMG.displayed {
	display: block;
	margin-left: 350px;
	margin-right: auto
}
</style>
</head>
<body>
	<img src="MediDB.png" class="displayed" width="200" height="75" alt="" />
	<br />
	<div class="col-md-2 col-md-offset-3">
		<a href="MainMenu.jsp">
			<button type="submit" class="btn btn-default" name="submit">
				<img src="home.png" width="20" height="20" alt="" />
			</button>
		</a>
	</div>
	<h2 align="left">&nbsp;&nbsp;&nbsp;&nbsp;Delete Doctor</h2>
	<%!public class Doctor {
		String URL = "jdbc:mysql://localhost:3306/medical?useSSL=false";
		String USERNAME = "Gary";
		String PASSWORD = "password";

		Connection connection = null;
		PreparedStatement selectDoctors = null;
		PreparedStatement deleteDoctor = null;
		ResultSet resultSet = null;

		public Doctor() {
			try {

				connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

				selectDoctors = connection.prepareStatement(
						"SELECT DoctorID, FirstName, LastName, Gender, DOB, MobileNo, HomeNo, JobTitle FROM doctor");

				deleteDoctor = connection.prepareStatement("DELETE FROM doctor WHERE DoctorID = ?");

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		public ResultSet getDoctors() {

			try {
				resultSet = selectDoctors.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return resultSet;
		}

		public int deleteDoctor(Integer id) {
			int result = 0;

			try {
				deleteDoctor.setInt(1, id);
				result = deleteDoctor.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return result;
		}

	}%>

	<%
		int result = 0;

		Doctor doctor = new Doctor();
		ResultSet doctors = doctor.getDoctors();

		Integer doctorId = new Integer(0);

		if (request.getParameter("submit") != null) {
			doctorId = Integer.parseInt(request.getParameter("doctor"));
			result = doctor.deleteDoctor(doctorId);
		}
	%>

	<div class="container">
		<form class="form-inline" action="DeleteDoctor.jsp" method="POST">
			<div class="row">

				<div class="col-md-2"></div>

				<div class="col-md-2">
					<div class="form-group">
						<br /> <label for="InputDoctor_ID">Doctor's:</label> <select
							class="form-control" name="doctor">
							<%
								while (doctors.next()) {
							%>
							<option value='<%=doctors.getInt("DoctorID")%>'><%=doctors.getString("FirstName")%>
								<%=doctors.getString("LastName")%></option>
							<%
								}
							%>
						</select>
					</div>

					<div class="form-group">
						<br /> <label for="InputFirstName">First Name:</label> <input
							class="form-control" id="InputFirstName" type="text"
							placeholder="Joe" readonly>
					</div>

					<div class="form-group">
						<br /> <label for="InputGender">Gender:
							&nbsp;&nbsp;&nbsp;</label> <br /> <select class="form-control"
							id="InputGender" type="text" readonly>
						</select>
					</div>

					<div class="form-group">
						<br /> <label for="InputMobileNo">Mobile-No: </label> <input
							class="form-control" id="InputMobileNo" type="text"
							placeholder="0871234567" readonly>
					</div>

					<div class="form-group">
						<br /> <label for="InputInjury">Job Title:
							&nbsp;&nbsp;&nbsp;</label> <br /> <select class="form-control"
							name="jobTitle" readonly>
							<option>Surgeon</option>
							<option>Nurse</option>
							<option>Paramedic</option>
							<option>Dermatologist</option>
							<option>Neurologist</option>
							<option>Oncologist</option>
							<option>Orthopedist</option>
						</select>
					</div>
				</div>

				<div class="col-md-2"></div>

				<div class="col-md-2"></div>

				<div class="col-md-2">
					<div class="form-group">
						<br /> <br /> <br /> <br /> <br /> <label for="InputLastName">Last
							Name: </label> <input class="form-control" id="InputLastName" type="text"
							placeholder="Bloggs" readonly>
					</div>

					<div class="form-group">
						<br /> <label for="InputDOB">Date Of Birth: </label> <input
							class="form-control" id="InputDOB" type="text"
							placeholder="YYYYMMDD" readonly>
					</div>

					<div class="form-group">
						<br /> <label for="InputHomeNo">Home-No: </label> <input
							class="form-control" id="InputHomeNo" type="text"
							placeholder="09512345" readonly>
					</div>

					<div class="col-md-2"></div>
				</div>
				<div class="col-md-6 col-md-offset-3 text-center">
					<br />
					<button type="submit" class="btn btn-success" name="submit">Delete</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>