<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LMS | My Leave History</title>
  <link rel="stylesheet" href="assets/css/empStyle.css">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="assets/css/style.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/all.min.css">
  <style>
       #logo{
            text-align: left;
            color: white;
            
        }
        /* Add Holiday Button */
        .btnHday{
            border:2px solid #f4acb7 ;
            color: white;
            margin-right: 1.5rem;
            transition-duration: 500ms;
            
        }
        .btnHday:hover{
            border:3px solid #f4acb7 ;
            border:none;
            background-color: #f4acb7;
            color: whitesmoke;
            transition-duration: 500ms;
        }
        /* Add holiday Modal */
        /* Add Holliday Button */
        #savebtn{
            background-color: #9d8189;
            border: 1px solid #9d8189;
            padding: 0.3rem 1rem;
        }
        .modal-footer{
            padding-right: 3rem;
        }
        .modal-header{
            background-color: #f4acb7;
            color: white;
        }
        .modal-content{
            border: none;
        }
        /* Table Action */
        .acn_item{
            color: #9d8189;
            transition-duration: 300ms;
            
        }
        .acn_item:hover{
            color: #f4acb7;
            font-size: large;
            transition-duration: 300ms;
        }
        /* invalid form */
        .invalidForm{
          color: rgb(189, 2, 2);
        }
        /* Side Navigation Bar start */
    aside{
      background-color: #9d8189;
    }
    .navbar{
      background-color: #9d8189;
    }
    
a {
  color: #ffffff;
  text-decoration: none;
  background-color: transparent;
}

a:hover {
  color: #ffffff;
  text-decoration: none;
}

.fa, .fas {
font-size: medium;
color: white;
}


body{
font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
font-size: 1rem;
}
</style>
 </head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
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
       <!--  </a> -->
      </li>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item">
           <button class="btn btn-navbar" type="submit">
            <div class="nav-item text-white" id="time-container"></div>
            </button>
          <!-- </a> -->
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
              <a href="employee_dashboard?id=<c:out value='${employee.id}'/>" class="nav-link">
                  <i class='fa fa-home'></i>
                  <p class="text-white">
                    &nbsp;&nbsp; Home
                </p>
              </a>
            </li>
            <li class="nav-item">
              <a href="set_leave_employee?id=<c:out value='${employee.id}'/>" class="nav-link">
                <i class="fa fa-user"></i>
                   <p class="text-white">
                    &nbsp;&nbsp;Apply Leave
                </p>
              </a>
            </li>
            <li class="nav-item">
              <a href="view_leaves_employee?id=<c:out value='${employee.id}'/>" class="nav-link">
                <i class="fa fa-address-book"></i>
                   <p class="text-white">
                    &nbsp;&nbsp;My Leave History
                </p>
              </a>
            </li>
            <li class="nav-item">
              <a href="viewholidaysemployee?id=<c:out value='${employee.id}'/>" class="nav-link">
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
              <a href="view_employee_profile?id=<c:out value='${employee.id}'/>" class="nav-link">
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
			<table class="table table-dark table-striped caption-top table-hover">
				<thead class="thead-dark">
					<tr>
						<th>SL</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Leave Type</th>
						<th>Day Count</th>
						<th>Status</th>
					</tr>
				</thead>
				
				<tbody class="table-group-divider">
				<c:forEach items="${leaves }" var="leave">
				<tr class="table-active">
                        <th scope="row">${leave.id }</th>
                        <td>${leave.sdate }</td>
                        <td>${leave.edate }</td>
                        <td>${leave.leaveType }</td>
                        <td>${leave.daycount }</td>
                        <td>${leave.status }</td>
                      </tr>
				</c:forEach>
                  
				  </tbody>
		
			</table>
			
			
			<h3>Leave Balance</h3>
			<table class="table table-dark table-striped caption-top table-hover">
				<thead class="thead-dark">
					<tr>
						<th> </th>
						<th>Sick Leave</th>
						<th>Casual Leave</th>
						<th>Personal Leave</th>
						<th>Maternity Leave</th>
						<th>Paternity Leave</th>
						<th>Marriage Leave</th>
						<th>Adoption Leave</th>
					</tr>
				</thead>
				
				<tbody class="table-group-divider">
				<%-- <c:forEach items="${leaves }" var="leave"> --%>
				<tr class="table-active">
                        <th scope="row">Days</th>
                        <td>${employee.sickLeave }</td>
                        <td>${employee.casualLeave }</td>
                        <td>${employee.personalLeave }</td>
                        <td>${employee.maternityLeave }</td>
                        <td>${employee.paternityLeave }</td>
                        <td>${employee.marriageLeave }</td>
                        <td>${employee.adoptionLeave }</td>
                        
                      </tr>
				<%-- </c:forEach> --%>
                  
				  </tbody>
		
			</table>
		</div>
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