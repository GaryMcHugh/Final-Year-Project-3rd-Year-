<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Display</title>
<meta charset="utf-8" content="">
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
	<%!public class Patient {
		String URL = "jdbc:mysql://localhost:3306/medical?useSSL=false";
		String USERNAME = "Gary";
		String PASSWORD = "password";

		Connection connection = null;
		PreparedStatement selectPatient = null;
		ResultSet resultSet = null;

		public Patient() {
			try {

				connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

				selectPatient = connection.prepareStatement(
						"SELECT PatientID, FirstName, LastName, Gender, DOB, MobileNo, HomeNo, Injury, DoctorName FROM patient WHERE PatientID = ?");

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		public ResultSet getPatients(String id) {

			try {
				selectPatient.setString(1, id);
				resultSet = selectPatient.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return resultSet;
		}
	}%>
	<%
		String patientId = new String();

		if (request.getParameter("id") != null) {
			patientId = request.getParameter("id");
		}

		Patient patient = new Patient();
		ResultSet patients = patient.getPatients(patientId);
	%>
	<img src="MediDB.png" width="250" height="100" alt="" />
	<br />
	<div class="col-md-1 col-md-offset-0">
		<a href="MainMenu.jsp">
			<button type="submit" class="btn btn-default" name="submit">
				<img src="home.png" width="20" height="20" alt="" />
			</button>
		</a>
	</div>
	<h3 align="left">
		<u>Patient List</u>
	</h3>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>Patient id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Gender</th>
				<th>Date Of Birth</th>
				<th>Mobile No</th>
				<th>Home No</th>
				<th>Injury</th>
				<th>Doctor</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (patients.next()) {
			%>
			<tr>
				<td><%=patients.getString("PatientID")%></td>
				<td><%=patients.getString("FirstName")%></td>
				<td><%=patients.getString("LastName")%></td>
				<td><%=patients.getString("Gender")%></td>
				<td><%=patients.getString("DOB")%></td>
				<td><%=patients.getString("MobileNo")%></td>
				<td><%=patients.getString("HomeNo")%></td>
				<td><%=patients.getString("Injury")%></td>
				<td><%=patients.getString("DoctorName")%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>




</body>
</html>