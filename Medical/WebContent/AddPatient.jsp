<%@ page import="java.sql.*" %>
<%Class.forName("com.mysql.jdbc.Driver"); %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Add Patient</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <style>	
  IMG.displayed {
    display: block;
    margin-left: 350px;
    margin-right: auto }
   </style>
</head>
	<body>
	<img src="MediDB.png" class="displayed" width="200" height="75"/>
	<br />
		<div class="col-md-2 col-md-offset-3">
		<a href="MainMenu.jsp">
      	<button type="submit" class="btn btn-default" name="submit">
	   	<img src="home.png" width="20" height="20"/></button></a>
   	</div>
	<h2 align="left">&nbsp;&nbsp;&nbsp;&nbsp;Add Patient</h2>
	
	<%!
	public class Patient
	{
		String URL = "jdbc:mysql://localhost:3306/medical?useSSL=false";
		String USERNAME="Gary";
		String PASSWORD="password";
		
		Connection connection =null;
		PreparedStatement insertPatient = null;
		ResultSet resultSet = null;
		
		public Patient(){
			try {
				
				connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				
				insertPatient = connection.prepareStatement("INSERT INTO patient (FirstName, LastName, Gender, DOB, MobileNo, HomeNo, Injury, DoctorName)" + " VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
				
			} catch (SQLException e){
				e.printStackTrace();
			}
		}
		
		public int setPatient (String first, String last, String gender, String dob, String mobile, String home, String injury, String doctor){
			int result =0;
			
			try{
				insertPatient.setString	(1, first);
				insertPatient.setString	(2, last);
				insertPatient.setString	(3, gender);
				insertPatient.setString	(4, dob);
				insertPatient.setString	(5, mobile);
				insertPatient.setString	(6, home);
				insertPatient.setString	(7, injury);
				insertPatient.setString	(8, doctor);
				result=insertPatient.executeUpdate();
				
			}catch (SQLException e){
				e.printStackTrace();
			}
			
			return result;
		}
	}	
%>
	
<%
	int result=0;
		
	if(request.getParameter("submit")!= null){
		
		String FirstName = new String();
		String LastName = new String();
		String Gender = new String();
		String Dob = new String();
		String MobileNo = new String();
		String HomeNo = new String();
		String Injury = new String();
		String DoctorName = new String();
		
		if(request.getParameter("first") != null){
			FirstName = request.getParameter("first");
		}
		
		if(request.getParameter("last") != null){
			LastName = request.getParameter("last");
		}
		
		if(request.getParameter("gender") != null){
			Gender = request.getParameter("gender");
		}
		
		if(request.getParameter("dob") != null){
			Dob = request.getParameter("dob");
		}
		
		if(request.getParameter("mobile") != null){
			MobileNo = request.getParameter("mobile");
		}
		
		if(request.getParameter("home") != null){
			HomeNo = request.getParameter("home");
		}
		
		if(request.getParameter("injury") != null){
			Injury = request.getParameter("injury");
		}
		
		if(request.getParameter("doctor") != null){
			DoctorName = request.getParameter("doctor");
		}
		
		
		Patient patient = new Patient();
		result = patient.setPatient(FirstName, LastName, Gender, Dob, MobileNo, HomeNo, Injury, DoctorName);
	}
%>
	
	<div class="container">
		<form class="form-inline" name="myForm" action="AddPatient.jsp" method="POST">
			<div class="row">
			
			<div class="col-md-2">
			</div>
			
			<div class="col-md-2">
			  <div class="form-group">
		  		<br />
			    <label for="InputPatient_ID">Patient_Id:</label>
			    <input class="form-control" id="InputPatient_ID" placeholder="P12345" readonly>
			  </div>
			  
  			  <div class="form-group">
		  		<br />
			    <label for="InputFirstName">First Name:</label>
			    <input class="form-control" name="first" id="InputFirstName" placeholder="Joe">
			  </div>
			  
  				<div class="form-group">
	   			  	<br />
	 			  	<label for="InputGender">Gender: &nbsp;&nbsp;&nbsp;</label>
					<select class="form-control" name="gender">
			  			<option>Male</option>
					  	<option>Female</option>
					</select>
				</div>
				
   			  <div class="form-group">
		  		<br />
			    <label for="InputMobileNo">Mobile-No:    </label>
			    <input class="form-control" name="mobile" id="InputMobileNo" placeholder="0871234567">
			  </div>
			  
   				<div class="form-group">
	   			  	<br />
	 			  	<label for="InputInjury">Injury: &nbsp;&nbsp;&nbsp;</label>
					<select class="form-control" name="injury">
			  			<option>Broken Arm</option>
					  	<option>Broken Leg</option>
			  			<option>Pneumonia</option>
					  	<option>Asthma attack</option>
			  			<option>Stroke</option>
					  	<option>Heart Attack</option>
					  	<option>Other</option>
					</select>
				</div>
			</div>
			
			<div class="col-md-2">
			</div>
			
			<div class="col-md-2">
			</div>
			
			<div class="col-md-2">
  			  <div class="form-group">
		  		<br /> <br /> <br /> <br /> <br />
			    <label for="InputLastName">Last Name:    </label>
			    <input class="form-control" name="last" id="InputLastName" placeholder="Bloggs">
			  </div>
			  
  			  <div class="form-group">
		  		<br />
			    <label for="InputDOB">Date Of Birth:    </label>
			    <input class="form-control" name="dob" id="InputDOB" placeholder="YYYYMMDD">
			  </div>
			  
   			  <div class="form-group">
		  		<br />
			    <label for="InputHomeNo">Home-No:    </label>
			    <input class="form-control" name="home" id="InputHomeNo" placeholder="09512345">
			  </div>
			  
   			  <div class="form-group">
		  		<br />
			    <label for="InputDoctorName">Doctor:    </label>
			    <input class="form-control" name="doctor" id="InputDoctorName" placeholder="Joe Bloggs">
			  </div>
			</div>
			
			<div class="col-md-2">
			</div>	
		</div>
		<div class="col-md-6 col-md-offset-3 text-center"> 
			<br />
	  		<button type="submit" class="btn btn-success" name="submit">Submit</button>
		</div>
			</form>
		</div>
	
	</body>
</html>