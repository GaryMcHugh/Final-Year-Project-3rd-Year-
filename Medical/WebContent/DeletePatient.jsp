<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Delete Patient</title>
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
	<h2 align="left">&nbsp;&nbsp;&nbsp;Delete Patient</h2>

	<%!public class Patient {
		String URL = "jdbc:mysql://localhost:3306/medical?useSSL=false";
		String USERNAME = "Gary";
		String PASSWORD = "password";

		Connection connection = null;
		PreparedStatement selectPatients = null;
		PreparedStatement deletePatient = null;
		ResultSet resultSet = null;

		public Patient() {
			try {

				connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

				selectPatients = connection.prepareStatement(
						"SELECT PatientID, FirstName, LastName, Gender, DOB, MobileNo, HomeNo, Injury, DoctorName FROM patient");

				deletePatient = connection.prepareStatement("DELETE FROM patient WHERE PatientID = ?");

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		public ResultSet getPatients() {

			try {
				resultSet = selectPatients.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return resultSet;
		}

		public int deletePatient(Integer id) {
			int result = 0;

			try {
				deletePatient.setInt(1, id);
				result = deletePatient.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return result;
		}

	}%>

	<%
		int result = 0;

		Patient patient = new Patient();
		ResultSet patients = patient.getPatients();

		Integer patientId = new Integer(0);

		if (request.getParameter("submit") != null) {
			patientId = Integer.parseInt(request.getParameter("patient"));
			result = patient.deletePatient(patientId);
		}
	%>
	<div class="container">
		<form class="form-inline" action="DeletePatient.jsp" method="POST">
			<div class="row">

				<div class="col-md-2"></div>

				<div class="col-md-2">
					<div class="form-group">
						<br /> <label for="InputPatient_ID">Patient's:</label> <select
							class="form-control" name="patient">
							<%
								while (patients.next()) {
							%>
							<option value='<%=patients.getInt("PatientID")%>'><%=patients.getString("FirstName")%>
								<%=patients.getString("LastName")%></option>
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
							&nbsp;&nbsp;&nbsp;</label> <select class="form-control" name="gender"
							readonly>
							<option>Male</option>
							<option>Female</option>
						</select> <br />
					</div>

					<div class="form-group">
						<br /> <label for="InputMobileNo">Mobile-No: </label> <input
							class="form-control" id="InputMobileNo" type="text"
							placeholder="0871234567" readonly>
					</div>

					<div class="form-group">
						<br /> <label for="InputInjury">Injury:
							&nbsp;&nbsp;&nbsp;</label> <select class="form-control" name="injury"
							readonly>
							<option>Broken Arm</option>
							<option>Broken Leg</option>
							<option>Pneumonia</option>
							<option>Asthma attack</option>
							<option>Stroke</option>
							<option>Heart Attack</option>
							<option>Other</option>
						</select> <br />
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

					<div class="form-group">
						<br /> <label for="InputDoctorName">Doctor: </label> <input
							class="form-control" id="InputDoctorName" type="text"
							placeholder="Joe Bloggs" readonly>
					</div>
				</div>

				<div class="col-md-2"></div>
			</div>
			<div class="col-md-6 col-md-offset-3 text-center">
				<br />
				<button type="submit" class="btn btn-success" name="submit">Delete</button>
			</div>
		</form>
	</div>

</body>
</html>