<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LMS | Manager | My Profile</title>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="assets/css/style.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  
   <!-- bootstrap modal-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha512-I5TkutApDjnWuX+smLIPZNhw+LhTd8WrQhdCKsxCFRSvhFx2km8ZfEpNIhF9nq04msHhOkE8BMOBj5QE07yhMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
 .bg-info{
   background-color: #9d8189 !important;
   }
   .fa-3x{
  font-size: 5em;
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
            <button class="btn btn-navbar" type="submit">
             <div class="nav-item text-white" id="time-container"></div>
             </button>
           </a>
         </li>
        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
            <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdownmenu dropdown-menu-right">
            <a href="view_admin_profile?id=<c:out value='${manager.id}'/>" class="dropdown-item text-white">
              <i class='fa fa-user-circle'></i> My Profile
            </a>
            <div class="dropdown-divider"></div>
            <a href="" class="dropdown-item text-white nav-link" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
             <i class='fas fa-user-lock'></i></i>Reset Password
            </a>
            <div class="dropdown-divider"></div>
            <a href="logout" class="dropdown-item text-white">
              <i class="fas fa-envelope mr-2"></i>Logout
            </a>
           </div>
        </li>
      </ul>
  </nav>
  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="staticBackdropLabel">Reset Password</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
    <form action="reset_pass_manager" name="ResetForm" id="ResetForm" onsubmit="return Validation()" method="post">
          <div class="modal-body ">
            <div class="container-fluid">
                <div class="row p-3">
                      <div class="col-md-10">
                        <label  class="form-label">Email</label>
                        <input type="email" class="form-control" name="email"  id="email" required>
                        <span id="emailerror" class="text-danger font-weight-bold"></span>
                      </div>
                </div>
                    <div class="col-md-10" >
                       <!--  <label  class="form-label">Enter old Password</label> -->
                        <input type="hidden" class="form-control" name="oldPass" id="oldPass"value="${manager.password}" required>
                        <span id="oldPassErr" class="text-danger font-weight-bold"></span>
                      </div>
                <div class="row p-3">
                    <div class="col-md-10" >
                        <label  class="form-label">Enter old Password new</label>
                        <input type="password" class="form-control" name="oldPass1" id="oldPass1" required>
                        <span id="oldPassErr1" class="text-danger font-weight-bold"></span>
                      </div>
                </div>
                <div class="row p-3">
                    <div class="col-md-10">
                        <label  class="form-label">Enter New Password</label>
                        <input type="password" class="form-control" name="newPass" id="newPass" required>
                        <span id="newPassErr" class="text-danger font-weight-bold"></span>
                      </div>
                </div>
                <div class="row p-3">
                    <div class="col-md-10">
                        <label  class="form-label">Confirm New Password</label>
                        <input type="password" class="form-control" name="connewPass" id="connewPass" required>
                        <span id="ConnewPassErr" class="text-danger font-weight-bold"></span>
                      </div>
                </div>
              </div>
                <div class="modal-footer p-3">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Reset</button>
                </div>
              </div>
            </div>
          </div>
        </form>
    </div>
  </div>
   <aside class="main-sidebar text-white elevation-4">
   <a href="" class="brand-link">
      <img src="CSS/icons.png" class="brand-image">
      <span class="brand-text font-weight-larger" id="logo">BIZHUB</span></a>     
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
            <a href="ViewLeavepolicy.jsp" class="nav-link">
                <i class="fa fa-address-book"></i>
             <p class="text-white">
              &nbsp;&nbsp;Leave Policy</p> 
            </a>
          </li>
          <li class="nav-item">
            <a href="viewemployees_manager?id=<c:out value='${manager.id}'/>" class="nav-link">
              <i class='fas fa-user-edit'></i>
                 <p class="text-white">
                  &nbsp;&nbsp;Employees
              </p>
            </a>
          </li>
         <%--  <li class="nav-item">
            <a href="view_manager_profile?id=<c:out value='${manager.id}'/>" class="nav-link">
                <i class="fas fa-user-cog"></i>
             <p class="text-white">
              &nbsp;&nbsp;My Profile</p>
            </a>
          </li> --%>
            <li class="nav-item">
            <a href="#" class="nav-link">
               <i class='fa fa-check-square-o'></i>
             <p class="text-white">
              &nbsp;&nbsp;View Project</p>
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
                    <i class="fas fa-user-tie fa-3x mt-5"></i>
                    <h2 class="font-weight-bold mt-4">${manager.username }</h2>
                    <p>${manager.role }</p>
                    <i class="far fa-edit fa-2x mt-4"></i>
                  </div>
                </div>
                <div class="col-sm-8 bg-white rounded-right">
                  <h3 class="mt-3 text-center">${manager.fullname }</h3>
                  <hr >
                  <div class="row" style="padding-left: 25px; padding-right: 25px;">
                    <div class="col-sm-6">
                      <p class="font-weight-bold" style="margin-bottom: 0px;">Full Name</p>
                      <h6 class="text-muted" style="padding-top: 3px;">${manager.fullname }</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Email</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">${manager.email }</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Contact</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">${manager.contact }</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Designation</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">${manager.designation }</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Role</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">${manager.role }</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Location</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">Mumbai</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Reporting Person</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">${manager.reportingPerson }</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Status</p>
                      <h6 class="text-muted"  style="padding-top: 3px;">${manager.status }</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Date of Birth</p>
                      <h6 class="text-muted" style="padding-top: 3px;">${manager.dob }</h6>
                    </div>
                    <div class="col-sm-6">
                      <p class="font-weight-bold"style="margin-bottom: 0px;">Date of Joining</p>
                      <h6 class="text-muted" style="padding-top: 3px;">${manager.doj }</h6>
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
