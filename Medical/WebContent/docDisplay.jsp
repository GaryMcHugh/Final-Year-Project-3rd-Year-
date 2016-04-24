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
	<%!public class Doctor {
		String URL = "jdbc:mysql://localhost:3306/medical?useSSL=false";
		String USERNAME = "Gary";
		String PASSWORD = "password";

		Connection connection = null;
		PreparedStatement selectDoctor = null;
		ResultSet resultSet = null;

		public Doctor() {
			try {

				connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

				selectDoctor = connection.prepareStatement(
						"SELECT DoctorID, FirstName, LastName, Gender, DOB, MobileNo, HomeNo, JobTitle FROM doctor WHERE DoctorID = ?");

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		public ResultSet getDoctors(String id) {

			try {
				selectDoctor.setString(1, id);
				resultSet = selectDoctor.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return resultSet;
		}
	}%>
	<%
		String doctorId = new String();

		if (request.getParameter("id") != null) {
			doctorId = request.getParameter("id");
		}

		Doctor doctor = new Doctor();
		ResultSet doctors = doctor.getDoctors(doctorId);
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
		<u>Doctor List</u>
	</h3>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>Doctor id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Gender</th>
				<th>Date Of Birth</th>
				<th>Mobile No</th>
				<th>Home No</th>
				<th>Job Title</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (doctors.next()) {
			%>
			<tr>
				<td><%=doctors.getString("DoctorID")%></td>
				<td><%=doctors.getString("FirstName")%></td>
				<td><%=doctors.getString("LastName")%></td>
				<td><%=doctors.getString("Gender")%></td>
				<td><%=doctors.getString("DOB")%></td>
				<td><%=doctors.getString("MobileNo")%></td>
				<td><%=doctors.getString("HomeNo")%></td>
				<td><%=doctors.getString("JobTitle")%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>




</body>
</html>