<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LMS | My Profile</title>
    <!-- bootstrap modal-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha512-I5TkutApDjnWuX+smLIPZNhw+LhTd8WrQhdCKsxCFRSvhFx2km8ZfEpNIhF9nq04msHhOkE8BMOBj5QE07yhMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="assets/css/style.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
   <style>
    .bg-info {
    background-color: #9d8189 !important;
}
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
            <a href="adm_dashboard?id=<c:out value='${admin.id}'/>" class="nav-link">
                <i class='fa fa-home'></i>
                <p class="text-white">
                  &nbsp;&nbsp; Home
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="set_add_emp?id=<c:out value='${admin.id}'/>" class="nav-link">
                <i class="fa fa-user-plus"></i>
                <p class="text-white">
                  &nbsp;&nbsp; Add Employee
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="viewemployees?id=<c:out value='${admin.id}'/>" class="nav-link">
                <i class="fa fa-th-list"></i>
                <p class="text-white">
                  &nbsp;&nbsp;Manage Employee
              </p>
            </a>
          </li>
           <li class="nav-item">
            <a href="viewprojects?id=<c:out value='${admin.id}'/>" class="nav-link">
                <i class="fas fa-project-diagram"></i>
                <p class="text-white">
                  &nbsp;&nbsp;Project
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="viewholidays?id=<c:out value='${admin.id}'/>" class="nav-link">
                <i class="fas fa-gifts"></i>
              <p class="text-white">
                &nbsp;&nbsp; Holiday
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="apply_leave_admin?id=<c:out value='${admin.id}'/>" class="nav-link">
              <i class="fa fa-user"></i>
                 <p class="text-white">
                  &nbsp;&nbsp;Apply Leave
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="view_leaves_admin?id=<c:out value='${admin.id}'/>" class="nav-link">
                <i class="fa fa-list-alt"></i>
              <p class="text-white">
                &nbsp;&nbsp;My Leave History</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="manage_leaves_admin?id=<c:out value='${admin.id}'/>" class="nav-link">
                <i class="fa fa-list-alt"></i>
              <p class="text-white">
                &nbsp;&nbsp;Manage Leave</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
                <i class="fa fa-address-book"></i>
             <p class="text-white">
              &nbsp;&nbsp;Add Leave Policy</p> 
            </a>
          </li>
          <li class="nav-item">
            <a href="set_add_manager?id=<c:out value='${admin.id}'/>" class="nav-link">
              <i class='fas fa-user-lock'></i>
             <p class="text-white">
              &nbsp;&nbsp;Add Manager</p> 
            </a>
          </li>
          <li class="nav-item">
            <a href="viewmanagers?id=<c:out value='${admin.id}'/>" class="nav-link">
              <i class='fas fa-user-edit'></i>
             <p class="text-white">
              &nbsp;&nbsp;Manage Manager</p> 
            </a>
          </li>
          <li class="nav-item">
            <a href="view_admin_profile?id=<c:out value='${admin.id}'/>" class="nav-link">
                <i class='fas fa-user-cog'></i>
                <p class="text-white">
                  &nbsp;&nbsp;My Profile
              </p>
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </aside>
  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row d-flex justify-content-center">
            <div class="col-md-10 mt-5 pt-2">
              <div class="row z-depth-3 text-dark shadow bg-white" style="padding-bottom: 10px;
                                                padding-top: 10px;
                                                padding-left: 10px;"  >
  
  
                <div class="col-sm-4 bg-info rounded-left">
                  <div class="card-block text-center text-white">
                    <i class="fas fa-user-tie fa-7x mt-5"></i>
                    <h2 class="font-weight-bold mt-4">${admin.username}</h2>
                    <p>${admin.role}</p>
                    <i class="far fa-edit fa-2x mt-4"></i>
                  </div>
                </div>
                <div class="col-sm-8 bg-white rounded-right">
                  <h3 class="mt-3 text-center">${admin.fullname}</h3>
                  <hr >
                  <div class="row" style="padding-left: 25px; padding-right: 25px;">
                    <div class="col-sm-6">
                      <p class="font-weight-bold" style="margin-bottom: 0px;">Full Name</p>
                      <h6 class="text-muted" style="padding-top: 3px;">${admin.fullname}</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Email</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">${admin.email}</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Contact</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">${admin.contact}</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Designation</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">${admin.designation}</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Role</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">${admin.role}</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Location</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">Mumbai</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Reporting Person</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">${admin.reportingPerson}</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Status</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">${admin.status}</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Date of Birth</p>
                      <h6 class="text-muted" style="padding-top: 3px;">${admin.dob}</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Date of Joining</p>
                      <h6 class="text-muted" style="padding-top: 3px;">${admin.doj}</h6>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
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
