<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LMS | Apply Leave</title>
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
   <!-- invalid massage -->
 <%
            String dayExcided = (String) session.getAttribute("dayExcided");
            if (dayExcided != null) {
        %>
            <script>
                alert("<%= dayExcided %>");
            </script>
        <%
            }
        %>

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
        <form action="#" name="ResetForm" id="ResetForm" onsubmit="return Validation()" method="post">
          <div class="modal-body ">
            <div class="container-fluid">

                <div class="row p-3">
                      <div class="col-md-10">
                        <label  class="form-label">Email</label>
                        <input type="email" class="form-control" name="email"  id="email" required>
                        <span id="emailerror" class="text-danger font-weight-bold"></span>
                      </div>
                </div>
                <div class="row p-3">
                    <div class="col-md-10" >
                        <label  class="form-label">Enter old Password</label>
                        <input type="password" class="form-control" name="oldPass" id="oldPass" required>
                        <span id="oldPassErr" class="text-danger font-weight-bold"></span>
                      </div>
                </div>
                <div class="row p-3">
                    <div class="col-md-10">
                        <label  class="form-label">Enter New Password</label>
                        <input type="password" class="form-control" name="newPass" id="newPass" required>
                        <span id="newPassErr" class="text-danger font-weight-bold"></span>
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
            <a href="../UI/addProject.html" class="nav-link">
                <i class="fas fa-project-diagram"></i>
                <p class="text-white">
                  &nbsp;&nbsp;Project
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="../UI/addmanager.html" class="nav-link">
              <i class='fas fa-user-lock'></i>
             <p class="text-white">
              &nbsp;&nbsp;Add Manager</p> 
            </a>
          </li>
          <li class="nav-item">
            <a href="../UI/manageMR.html" class="nav-link">
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
        <div class="row">
          <div class="col-md-8">
            <div class="container-md">
                <h3 class="text-center"><strong>Apply Leave</strong></h3>
                <form action="apply_leave_form_admin" class="row g-3 m-5" name="applyleavForm"  id="form" onsubmit="return validation()">
                  <div class="col-md-6">
                    <label for="inputEmpName" class="form-label">Name</label>
                    <input type="text" class="form-control" id="inputEmpName" name="empName" value="${admin.fullname}" readonly="readonly">
                  </div>
                  <div class="col-md-6">
                    <label for="inputEmail" class="form-label">Email</label>
                    <input type="email" class="form-control" id="inputEmail" name="empEmail" value="${admin.email}" readonly="readonly" >
                    <span id="emailerror" class="text-danger font-weight-bold"></span>
                  </div>
                  <div class="col-md-6">
                    <label for="inputEmpId" class="form-label">ID</label>
                    <input type="text" class="form-control" id="inputEmpId" name="empId" value="${admin.id}" readonly="readonly">
                  </div>
                  <div class="col-md-6">
                      <label for="inputLeave" class="form-label">Type of leave</label>
                      <select id="inputleave" class="form-select" name="leaveType" required>
                        <option selected>Choose...</option>
                        <option>Sick Leave</option>
                        <option>Casual Leave</option>
                        <option>Personal Leave</option>
                        <option>Maternity Leave</option>
                        <option>Petarnity Leave</option>
                        <option>Marriage Leave</option>
                        <option>Adoption Leave</option>
                      </select>
                      <span id="leavetypeerror" class="text-danger font-weight-bold"></span>
                  </div>
                  <div class="col-md-6">
                    <label for="inputSdate" class="form-label">Start Date</label>
                    <input type="date" class="form-control" id="Sdate" name="sdate" required>
                    <span id="Sdateerror" class="text-danger font-weight-bold" ></span>
                  </div>
                  <div class="col-md-6">
                    <label for="inputEdate" class="form-label">End Date</label>
                    <input type="date" class="form-control" id="Edate" name="edate" required>
                    <span id="Edateerror" class="text-danger font-weight-bold" ></span>
                  </div>
                  <div class="col-md-6">
                    <!-- <label for="inputEmpRole" class="form-label">Role</label> -->
                    <input type="hidden" class="form-control" id="inputEmpRole" name="role" value="${admin.role}" readonly="readonly">
                  </div>
                  <div class="col-md-6">
                    <!-- <label for="inputReportingPerson" class="form-label">Reporting Manager</label> -->
                    <input type="hidden" class="form-control" id="inputReportingPerson" name="reportingPerson" value="${admin.reportingPerson}" readonly="readonly">
                  </div>
                  <div class="col-md-6">
                      <label for="inputReason" class="form-label">Reason</label>
                      <textarea class="form-control"  id="inputReason" name="reason" cols="3" rows="2"></textarea>
                      
                    </div>
                    <div class="col-md-6">
                    <label for="currApply" class="form-label">Leave Balance</label>
                    <input type="text" class="form-control" id="currApply" name="daycount" readonly="readonly">
                  </div>
                  <div class="col-12">
                    <button type="submit" class="btn submitBtn">Submit</button>
                  </div>
                 </form>
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

  function validation(){
  
  let valid=true;
  
  const email=document.getElementById('inputEmail').value;
  const leave=document.getElementById('inputleave').value;
  
  const emailcheck=/^[A-Za-z_.0-9]{3,}@[A-Za-z]{3,}[.]{1}[a-zA-Z.]{2,6}$/;
  
  // check email of employee
  if (emailcheck.test(email)){
    document.getElementById('emailerror').innerHTML=""
  }
  else{
    document.getElementById('emailerror').innerHTML="Email is Invalid";
    valid=false;
  }
  
  
   // check type of leave
   if (leave !=="Choose..."){
    document.getElementById('leavetypeerror').innerHTML=""
    }
  else{
    document.getElementById('leavetypeerror').innerHTML="Choose Leave Type";
    valid=false;
  }
  
  
  return valid;
  }
  
  
    //date validations-disable past dates for start date and end date
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
    
  
      document.getElementById("Sdate").setAttribute('min',minDate);
      document.getElementById("Sdate").setAttribute('max',maxDate);
  
      document.getElementById("Edate").setAttribute('min',minDate);
      document.getElementById("Edate").setAttribute('max',maxDate);
  
  
    //start date and end date validation for weekend
    const startcalendar = document.getElementById("Sdate");
    const endcalendar = document.getElementById("Edate");
    /* start of check date */
    var holidays =[];
	fetch('/data')
	.then(response => response.json())
	.then(dates => {
	    // process the data
	    
		dates.forEach(date => holidays.push(date));
		 
		 
	})
	.catch(error => {
	    // handle errors
	});                     
	      console.log(holidays);
    function isHoliday(date) {
        return holidays.includes(date);
    }
    /* end of check date */
    function isWeekend(date) {
      let day = date.getDay();
      return day === 0 || day === 6;
    }
  
  
    startcalendar.addEventListener("change", function() {
      let selectedDate = new Date(startcalendar.value);
      console.log(selectedDate);
      if (isWeekend(selectedDate) || isHoliday(startcalendar.value)) {
        document.getElementById('Sdateerror').innerHTML="You cannot select Weekend or Holiday";
       
      } else {
        document.getElementById('Sdateerror').innerHTML="";
      }
    
    });
  
     endcalendar.addEventListener("change", function() {
      let selectedDate = new Date(endcalendar.value);
      if (isWeekend(selectedDate) || isHoliday(endcalendar.value)) {
        document.getElementById('Edateerror').innerHTML="You cannot select Weekend or Holiday";
        
      } else {
        document.getElementById('Edateerror').innerHTML="";
      }

    });

  // calculate date 
  
  // Add event listeners to the inputs
    startcalendar.addEventListener('change', updateResult);
     endcalendar.addEventListener('change', updateResult);
     function updateResult() {
   var date1;
     var date2;

      date1 = new Date(startcalendar.value);
      console.log("Date1"+date1);
  

      date2 = new Date(endcalendar.value);
     console.log("Date2"+date2);

     const time = Math.abs(date2 - date1);
     console.log("Time : "+time);
     const days = Math.ceil(time / (1000 * 60 * 60 * 24));
     console.log("Days : "+days);

     let numWeekdays = 0;

     for (let date = date1; date <= date2; date.setTime(date.getTime() + 86400000)) {
         let dateString = date.toISOString().slice(0, 10);
         if (!holidays.includes(dateString) && date.getDay() !== 0 && date.getDay() !== 6) {
             numWeekdays++;
         }
     }
     console.log(numWeekdays);
     
     document.getElementById("currApply").value = numWeekdays;
    /*  document.getElementById('currApply').innerHTML = 'Number of days: ' + numWeekdays;  */
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
    <!-- javascript -->
    <script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/style.min.js"></script>
</body>
</html>