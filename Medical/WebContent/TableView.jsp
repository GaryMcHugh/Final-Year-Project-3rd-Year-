<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%	
	if (session.getAttribute("connection") == null){
		/* Class.forName instructs the Java Virtual Machine (JVM) class loader to load the specified
		 * class into memory. In this case, the name of the class (the MSQL JDBC driver) is declared
		 * in the file WEB-INF/web.xml as a context parameter called DATABASE_DRIVER. We can access
		 * the value of this parameter by calling application.getInitParameter("DATABASE_ENDPOINT").
		 */
		Class.forName(application.getInitParameter("DATABASE_DRIVER"));



		/* The Connection class is a JDBC class that represents a database connection. To connect to a
		 * database server, we need to specify the host name or IP address, the port number the database
		 * service is listening on, the name of the database schema we want to use and a valid username 
		 * and password. As these settings are used a lot in our application, they have all been defined
		 * as global variables in the file WEB-INF/web.xml as context parameters. We can access them by 
		 * calling application.getInitParameter("MY_VAL") where MY_VAL is the name of the parameter.
		 */
		Connection connection = DriverManager.getConnection(application.getInitParameter("DATABASE_ENDPOINT"), application.getInitParameter("DB_USERNAME"), application.getInitParameter("DB_PASSWORD"));
		session.setAttribute("connection", connection);
	}
	//Get the session variable that represents our database connection
	Connection connection = (Connection) session.getAttribute("connection");	
	
	/* If we get a row back from the database, the username and password are correct, so the user is 
	 * redirected to the summary page. Otherwise the user is bounced back to the sign-in page with an
	 * error message.
	 */
	
	//NB: from a command line: jar -cf medical.war *

	/*
	out.println(application.getInitParameter("APPLICATION_NAME"));
	out.println(application.getInitParameter("DATABASE_ENDPOINT"));
	out.println(application.getInitParameter("DB_USERNAME"));
	out.println(application.getInitParameter("DB_PASSWORD"));
	out.println(application.getInitParameter("SSL_HOST"));
	*/
%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Table View</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<img src="MediDB.png" width="250" height="100"/>
	<br />
	<div class="col-md-1 col-md-offset-0">
		<a href="MainMenu.jsp">
      	<button type="submit" class="btn btn-default" name="submit">
	   	<img src="home.png" width="20" height="20"/></button></a>
   	</div>
	<h3 align="left"><u>Patient List</u></h3>
	<form class="form-inline" name="myForm" action="display.jsp" method="POST">
	 	<div class="pull-right">
		    <label for="InputSearch">Search:    </label>
		    <input type="text" name="id" class="form-control" id="InputSearch" placeholder="Patient_id">
   	        <button type="submit" class="btn btn-default" name="submit">
		     <img src="search.png" width="20" height="20"/></button>
		     <br /> <br />
	 	</div>
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
		       <th>Action Items</th>
		     </tr>
		   </thead>
		    <tbody>	
		  	  	<% Statement statement = connection.createStatement();%>
	    		<% ResultSet rs = statement.executeQuery("SELECT * FROM patient");%>		
			     <%while (rs.next()){%>
			     <tr>
			        <td><%out.println(rs.getInt(1));%></td>
			        <td><%out.println(rs.getString(2));%></td>
			        <td><%out.println(rs.getString(3));%></td>
			        <td><%out.println(rs.getString(4));%></td>
			        <td><%out.println(rs.getDate(5));%></td>
			        <td><%out.println(rs.getInt(6));%></td>
			        <td><%out.println(rs.getInt(7));%></td>
			        <td><%out.println(rs.getString(8));%></td>
			        <td><%out.println(rs.getString(9));%></td>
			        <td>
			        	<a href="DeletePatient.jsp">
				        <button type="button" class="btn btn-default">
					     <img src="delete.png" width="20" height="20"/></button></a>
					     
					     <a href="AddPatient.jsp">
				        <button type="button" class="btn btn-default">
					     <img src="add.png" width="20" height="20"/></button></a>
				     </td>
			     </tr>
			     <%} %>
		    </tbody>
		  </table>
	</form>
</div>
</body>
</html>