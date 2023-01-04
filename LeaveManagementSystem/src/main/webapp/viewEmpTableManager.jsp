<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LMS | Manager Dashboard</title>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="assets/css/style.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
 </head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
<!-- login/logout session management -->
<%
if(session.getAttribute("email") ==null){
	response.sendRedirect("login.jsp");
}
%>
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
         <a href="logout" class="btn btn-navbar" type="submit">
            <i class="fa fa-power-off">&nbsp;Logout</i>
          </a>
        <!-- </a> -->
      </li>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item">
           <button class="btn btn-navbar" type="submit">
            <div class="nav-item text-white" id="time-container"></div>
            </button>
         <!--  </a> -->
        </li>
        </ul>
  </nav>
  <aside class="main-sidebar text-white elevation-4">
    <a href="" class="brand-link">
      <img src="CSS/icons.png" class="brand-image">
      <span class="brand-text font-weight-larger" id="logo">LMS</span></a>
      
 <div class="sidebar">
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="manager_dashboard?id=<c:out value='${manager.id}'/>" class="nav-link">
                <i class='fa fa-home'></i>
                <p class="text-white">
                  &nbsp;&nbsp;Home
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="apply_leave_manager?id=<c:out value='${manager.id}'/>" class="nav-link">
              <i class="fa fa-user"></i>
                 <p class="text-white">
                  &nbsp;&nbsp;Apply Leave
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="manage_leaves_manager?id=<c:out value='${manager.id}'/>" class="nav-link">
                <i class="fa fa-list-alt"></i>
              <p class="text-white">
                &nbsp;&nbsp;Manage Leave</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="view_leaves_manager?id=<c:out value='${manager.id}'/>" class="nav-link">
              <i class="fa fa-address-book"></i>
                 <p class="text-white">
                  &nbsp;&nbsp;My Leave History
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="viewholidaysmanager?id=<c:out value='${manager.id}'/>" class="nav-link">
                <i class="fas fa-gifts"></i>
              <p class="text-white">
                &nbsp;&nbsp;Holidays
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="../UI/Leavepolicy.html" class="nav-link">
                <i class="fa fa-address-book"></i>
             <p class="text-white">
              &nbsp;&nbsp;Leave Policy</p> 
            </a>
          </li>
          <li class="nav-item">
            <a href="viewemployees_manager?id=<c:out value='${manager.id}'/>" class="nav-link">
              <i class="fa fa-address-book"></i>
                 <p class="text-white">
                  &nbsp;&nbsp;Employees
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="view_manager_profile?id=<c:out value='${manager.id}'/>" class="nav-link">
                <i class="fas fa-user-cog"></i>
             <p class="text-white">
              &nbsp;&nbsp;My Profile</p>
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </aside>
   <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
		<div class="container" align="center">
			<h3>
				 Employee Directory
			</h3>
			<div class="d-flex justify-content-between">
			<br>
		
			<form action="#">
					<!-- Search form -->
					<input class="form-control" type="text" placeholder="Search By Name.."
						aria-label="Search" name="searchName">
				</form>
			</div>
			<br>
		
			<table class="table table-dark table-striped caption-top table-hover">
				<thead class="thead-dark">
					<tr>
						<th>Id </th>
						<th>Full Name</th>
						<th>Email</th>
						<th>Contact</th>
						<th>Designation</th>
						<th>Role</th>
						<th>Reporting Person</th>
						<th>DOJ</th>
						<th>Address</th>
						<!-- <th>Action</th> -->
					</tr>
				</thead>
				
				<tbody class="table-group-divider">
				<c:forEach items="${employees }" var="employee">
					<tr class="table-active">
					  <th scope="row">${employee.id}</th>
					  <td >${employee.fullname }</td>
					  <td >${employee.email}</td>
					  <td >${employee.contact}</td>
					  <td >${employee.designation }</td>
					  <td >${employee.role}</td>
					  <td >${employee.reportingPerson}</td>
					  <td >${employee.doj}</td>
					  <td >${employee.address}</td>
					  <%-- <td ><a href="edit_emp?id=<c:out value='${employee.id}'/>" class="acn_item" ><i class="fa fa-solid fa-pen" style='color: #9d8189;'></i></a>&nbsp;&nbsp;
						  <a href="delete_emp?id=<c:out value='${employee.id}'/>" class="acn_item"><i class="fa fa-solid fa-trash" style='color: #9d8189;'></i></a>
					  </td> --%>
					</tr>
					</c:forEach>
				  </tbody>
		
			</table>
			
		</div>
      </div>
      <!-- </div> -->
    </section>
  </div>
  <aside class="control-sidebar control-sidebar-dark">
  </aside>
</div>
<script>
function updateTime() {
  // Getting the current time
  var currentTime = new Date();
  // Format the time as HH:MM:SS
  var formattedTime = currentTime.getHours() + ':' + currentTime.getMinutes() + ':' + currentTime.getSeconds();
   // Update the container element with the formatted time
  document.getElementById('time-container').innerHTML = formattedTime;
}
// Update the time every second
setInterval(updateTime, 1000);
</script>
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/style.min.js"></script>
</body>
</html>