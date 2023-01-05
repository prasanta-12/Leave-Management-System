<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LMS | Edit Manager</title>
    <!-- bootstrap modal-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha512-I5TkutApDjnWuX+smLIPZNhw+LhTd8WrQhdCKsxCFRSvhFx2km8ZfEpNIhF9nq04msHhOkE8BMOBj5QE07yhMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="assets/css/style.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">

<style>
    .submitBtn{
    background-color: #9d8189;
    border: none;
    color: white;
    font-weight: 550;
    transition-duration: 400ms;
  }
  .submitBtn:hover{
    background-color: #f4acb7;
    border: none;
    transition-duration: 400ms;
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
            <a href="view_admin_profile?id=<c:out value='${admin.id}'/>" class="dropdown-item text-white">
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
    <form action="reset_pass_admin" name="ResetForm" id="ResetForm" onsubmit="return Validation()" method="post">
          <div class="modal-body ">
            <div class="container-fluid">

                <div class="row p-3">
                      <div class="col-md-10">
                        <label  class="form-label">Email</label>
                        <input type="email" class="form-control" name="email"  id="email" required>
                        <span id="emailerror" class="text-danger font-weight-bold"></span>
                      </div>
                </div>
                <!-- <div class="row p-3"> -->
                    <div class="col-md-10" >
                       <!--  <label  class="form-label">Enter old Password</label> -->
                        <input type="hidden" class="form-control" name="oldPass" id="oldPass"value="${admin.password}" required>
                        <span id="oldPassErr" class="text-danger font-weight-bold"></span>
                      </div>
                <!-- </div> -->
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
                    <button type="submit" class="btn btn-primary " >Reset</button>
                </div>
              </div>
            </div>
          </div>
        </form>
    </div>
  <aside class="main-sidebar text-white elevation-4">
   <a href="" class="brand-link">
      <img src="CSS/icons.png" class="brand-image">
      <span class="brand-text font-weight-larger" id="logo">BIZHUB</span></a>

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
            <a href="apply_leave_admin?id=<c:out value='${admin.id}'/>" class="nav-link">
              <i class="fa fa-user"></i>
                 <p class="text-white">
                  &nbsp;&nbsp;Apply Leave
              </p>
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
            <a href="view_leaves_admin?id=<c:out value='${admin.id}'/>" class="nav-link">
               <i class='fa fa-history'></i>
              <p class="text-white">
                &nbsp;&nbsp;My Leave History</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="AddLeavepolicy.jsp" class="nav-link">
                <i class="fa fa-address-book"></i>
             <p class="text-white">
              &nbsp;&nbsp;Leave Policy</p> 
            </a>
          </li>
          <li class="nav-item">
            <a href="viewholidays?id=<c:out value='${admin.id}'/>" class="nav-link">
                <i class="fas fa-gifts"></i>
              <p class="text-white">
                &nbsp;&nbsp;Holiday
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="set_add_emp?id=<c:out value='${admin.id}'/>" class="nav-link">
                <i class="fa fa-user-plus"></i>
                <p class="text-white">
                  &nbsp;&nbsp;Add Employee
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
            <a href="#" class="nav-link">
                <i class="fas fa-project-diagram"></i>
                <p class="text-white">
                  &nbsp;&nbsp;Project
              </p>
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
        </ul>
      </nav>
    </div>
  </aside>

  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="container" align="center">
          <h3 class="m-2" style="padding-top:3px;">
               Update Manager
          </h3>
        </div>
        <br>
        <section class="container my-2 w-50 p-2 text-dark shadow bg-white " id="form-data">
    
            <form class="row g-3 p-3" action="update_manager" name="addEmpForm"  id="form" onsubmit="return validation()">
                
                <div class="col-md-6">
                  <label for="fullName" class="form-label">Full name</label>
                  <input type="hidden" value="${manager.id}" name="id">
                    <input type="text" value="${manager.fullname}" class="form-control" id="fullName" name="fullname" required>
                   <span id="usererror" class="text-danger font-weight-bold"></span>
                </div>
    
    
                <div class="col-md-6">
                  <label for="email" class="form-label">Email</label>
                  <input type="email" value="${manager.email}" class="form-control" id="email" name="email" required>
                  <span id="emailerror" class="text-danger font-weight-bold"></span>
                </div>
    
                <div class="col-md-6">
                  <label for="contact" class="form-label">Contact</label>
                  <input type="number" value="${manager.contact}" class="form-control" id="contact" name="contact" required>
                  <span id="contacterror" class="text-danger font-weight-bold"></span>
                </div>
    
                <div class="col-md-6">
                    <label for="designation" class="form-label">Choose Designation</label>
                    <select id="designation" name="designation" class="form-select" >
                      <option   selected>${manager.designation}</option>
                      <option>Frontend Developer</option>
                      <option>Backend Developer</option>
                      <option>Fullstack Developer</option>
                    </select>
                    <span id="designationerror" class="text-danger font-weight-bold"></span>
                  </div>
    
                <div class="col-md-6">
                  <label for="role" class="form-label">Choose Role</label>
                  <select id="role" name="role" class="form-select">
                    <option  selected>${manager.role}</option>
                    <!-- <option>Employee</option> -->
                    <option>Manager</option>
                  </select>
                  <span id="roleerror" class="text-danger font-weight-bold"></span>
                </div>
    
                <div class="col-md-6">
                  <label for="status" class="form-label">Status</label>
                  <select id="status" name="status" class="form-select">
                    <option  selected>${manager.status}</option>
                    <option>Active</option>
                    <option>Inactive</option>
                  </select>
                  <span id="statuserror" class="text-danger font-weight-bold"></span>
              </div>
    
                <div class="col-md-6">
                  <label for="birthdate" class="form-label">Birth Date</label>
                  <input type="date" value="${manager.dob}" class="form-control" id="birthdate" name="dob"  required>
              </div>
              
              <div class="col-md-6">
                <label for="joiningdate" class="form-label">Joining Date</label>
                <input type="date" value="${manager.doj}" class="form-control" id="joiningdate" name="doj"  required>
            </div>
            <div class="col-12">
              <label for="inputEmail" class="form-label">Address</label>
              <textarea class="form-control" name="address" id="inputEmail" cols="3" rows="2">${manager.address}</textarea>
            </div>
                
            <div class="col-12">
              <button type="submit" class="btn submitBtn">Submit</button>
            </div>
    
              </form>
        </section>
      </div>
      </div>
    </section>
  </div>
  <aside class="control-sidebar control-sidebar-dark">
  </aside>
</div>
  <!-- script tag start here -->
<script >

//date validations-joining date
    var date=new Date();
    var currDate=date.getDate();
    
    var currMonth=date.getMonth()+1;
    var maxMonth=currMonth+(11-date.getMonth());
    // console.log("Max Month "+maxMonth);
    if(currDate<10){
      currDate='0'+currDate;
    }
    if(currMonth<10){
      currMonth='0'+currMonth;
    }
    if(maxMonth<10){
      currMonth='0'+maxMonth;
    }
    var currYear=date.getUTCFullYear();
    var maxYear=date.getUTCFullYear()+1;
    var minDate=currYear+"-"+currMonth+"-"+currDate;
    var maxDate=maxYear+"-"+currMonth+"-"+currDate;
  
    var minYear=date.getUTCFullYear()-18;
    var minBirthDate=currYear+"-"+currMonth+"-"+currDate;
    var maxBirthDate=minYear+"-"+currMonth+"-"+currDate;
    

    document.getElementById("joiningdate").setAttribute('min',minDate);
    document.getElementById("joiningdate").setAttribute('max',maxDate);

   // document.getElementById("birthdate").setAttribute('min',minBirthDate);
    document.getElementById("birthdate").setAttribute('max',maxBirthDate);

//validations
  function validation(){

  let valid=true;
  const fullName=document.getElementById('fullName').value;
  const email=document.getElementById('email').value;
  const contact=document.getElementById('contact').value;
  const designation=document.getElementById('designation').value;
  const role=document.getElementById('role').value;
  const status=document.getElementById('status').value;
  const location=document.getElementById('location').value;
  
  const fullNamecheck=/^[A-Za-z ]{2,30}$/;
  const emailcheck=/^[A-Za-z_.0-9]{3,}@[A-Za-z]{3,}[.]{1}[a-zA-Z.]{2,6}$/;
  const contactcheck=/^[6789]{1}[0-9]{9}$/;


  // check name of employee
  if (fullNamecheck.test(fullName)){
    document.getElementById('usererror').innerHTML=""
  }
  else{
    document.getElementById('usererror').innerHTML="Name is Invalid";
    valid=false;
  }

  // check email of employee
  if (emailcheck.test(email)){
    document.getElementById('emailerror').innerHTML=""
  }
  else{
    document.getElementById('emailerror').innerHTML="Email is Invalid";
    valid=false;
  }

  // check contact of employee
  if (contactcheck.test(contact)){
    document.getElementById('contacterror').innerHTML=""
  }
  else{
    document.getElementById('contacterror').innerHTML="Contact Number is Invalid";
    valid=false;
  }

    // check designation
    if (designation !=="Choose..."){
    document.getElementById('designationerror').innerHTML=""
    }
  else{
    document.getElementById('designationerror').innerHTML="Choose Designation";
    valid=false;
  }

    // check role
    if (role !=="Choose..."){
    document.getElementById('roleerror').innerHTML=""
    }
  else{
    document.getElementById('roleerror').innerHTML="Choose Role";
    valid=false;
  }

   // check status
   if (status !=="Choose..."){
    document.getElementById('statuserror').innerHTML=""
    }
  else{
    document.getElementById('statuserror').innerHTML="Choose Status";
    valid=false;
  }

   // check location
   if (location!=="Choose..."){
    document.getElementById('locationerror').innerHTML=""
    }
  else{
    document.getElementById('locationerror').innerHTML="Choose Status";
    valid=false;
  }

  //check reporting person
  if (status !=="Choose..."){
    document.getElementById('reporterror').innerHTML=""
    }
  else{
    document.getElementById('reporterror').innerHTML="Choose reporting person";
    valid=false;
  }

  return valid;
  }

  //time 
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