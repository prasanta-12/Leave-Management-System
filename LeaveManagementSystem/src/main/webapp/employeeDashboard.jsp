<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LMS | Employee Dashboard</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="assets/css/style.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha512-I5TkutApDjnWuX+smLIPZNhw+LhTd8WrQhdCKsxCFRSvhFx2km8ZfEpNIhF9nq04msHhOkE8BMOBj5QE07yhMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 
  <style>
  .content-wrapper{
 background-image: url("emp1.jpg");
 background-repeat: no-repeat;
 background-size: cover;
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
  

  <!-- sidebar -->
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
              <a href="view_leave_policy_employee?id=<c:out value='${employee.id}'/>" class="nav-link">
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
            <li class="nav-item">
              <a  class="nav-link" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
             <i class='fas fa-user-lock'></i></i><p class="text-white">
                &nbsp;&nbsp;Reset Password</p> 
            </a>
               
            </li>
          </ul>
        </nav>
      </div>
  </aside>
  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        
      </div>
    </section>
  </div>
  
    <!-- reset modal -->
  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="staticBackdropLabel">Reset Password</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
    <form action="reset_pass_employee" name="ResetForm" id="ResetForm" onsubmit="return Validation()" method="post">
          <div class="modal-body ">
            <div class="container-fluid">

                <div class="row p-3">
                      <div class="col-md-10">
                        <label  class="form-label">Email</label>
                        <input type="email" class="form-control" name="email"  id="email" required>
                        <span id="emailerror" class="text-danger font-weight-bold"></span>
                      </div>
                </div>
            <!--  <div class="row p-3"> -->
                    <div class="col-md-10" >
                       <!--  <label  class="form-label">Enter old Password</label> -->
                        <input type="hidden" class="form-control" name="oldPass" id="oldPass"value="${employee.password}" required>
                        <span id="oldPassErr" class="text-danger font-weight-bold"></span>
                      </div>
             <!--    </div>  -->
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
    <!-- reset modal end -->
  <aside class="control-sidebar control-sidebar-dark">
  </aside>
</div>
<script>

  function Validation(){

    let valid=true;
    const username=document.getElementById('email').value;
    const password=document.getElementById('newPass').value;
    const firstoldpassword=document.getElementById('oldPass').value;
    const secondoldpassword=document.getElementById('oldPass1').value;
    const confirmPass=document.getElementById('connewPass').value
    const emailcheck=/^[A-Za-z_.0-9]{3,}@[A-Za-z]{3,}[.]{1}[a-zA-Z.]{2,6}$/;
    const passwordcheck=/^(?=.[0-9])(?=.[!@#$%^&])[A-Za-z0-9!@#$%^&]{8,16}$/;

    // check email of employee
  if (emailcheck.test(username)){
    document.getElementById('emailerror').innerHTML=""
  }
  else{
    document.getElementById('emailerror').innerHTML="Email is Invalid";
    valid=false;
  }

  // check password of user
  /* if (passwordcheck.test(password)){
     document.getElementById('newPassErr').innerHTML=""
  }
  else{
     document.getElementById('newPassErr').innerHTML="Password is Invalid";
     valid=false;
  } */
// check password of user old pass
  if (firstoldpassword===secondoldpassword){
     document.getElementById('oldPassErr1').innerHTML=""
  }
  else{
     document.getElementById('oldPassErr1').innerHTML="Password is Invalid";
     valid=false;
  }


  // check password of user
  if (password!=confirmPass){
     document.getElementById('ConnewPassErr').innerHTML="Password did not match"
     valid=false;
  }
  else{
     document.getElementById('ConnewPassErr').innerHTML="";
     
  }
       
   return valid;
  }

</script>
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

