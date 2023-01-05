<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LMS | Manager | Holidays</title>
    <link rel="stylesheet" href="assets/css/empStyle.css">
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="assets/css/style.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/all.min.css">
  
   <!-- bootstrap modal-->
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>                                        
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha512-I5TkutApDjnWuX+smLIPZNhw+LhTd8WrQhdCKsxCFRSvhFx2km8ZfEpNIhF9nq04msHhOkE8BMOBj5QE07yhMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
            <a href="view_manager_profile?id=<c:out value='${manager.id}'/>" class="dropdown-item text-white">
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
            <a href="view_leavepolicy_manager?id=<c:out value='${manager.id}'/>" class="nav-link">
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
               <!-- Holyday Table start -->
    <div class="container" id="hDayTable">
      <table class="table table-dark table-striped caption-top table-hover" >
          <%-- <caption>Holiday List</caption> --%>
          <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Holiday Name</th>
            <th scope="col">Date</th>
            
            <th scope="col">Description</th>
            
            </tr>
          </thead>
          <tbody class="table-group-divider">
          <c:forEach items="${holidays }" var="holiday">
          <tr class="table-active">
              <th scope="row">${holiday.id }</th>
              <td>${holiday.hDayName }</td>
              <td>${holiday.startHDate }</td>
              
              <td>${holiday.hDayDesc }</td>
             
            </tr>
          </c:forEach>
            
            
          </tbody> 
  <!-- </div> -->
 
</table>
<!-- Holyday Table end -->
</div>
        </div>
      </section>
     
    </div>
    <aside class="control-sidebar control-sidebar-dark">
    </aside>
  </div>
  <!-- Side Navigation bar end -->

<!-- date validation -->
<script>
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

  document.getElementById("strDate").setAttribute('min',minDate);
  document.getElementById("strDate").setAttribute('max',maxDate);
  
      </script>

      <!-- javascript validation -->
      <script>
        function setError(id,error){
        element =document.getElementById(id);
        element.getElementsByClassName('invalidForm')[0].innerHTML=error;
      }
      function isValidForm(){
        var isValid=true;
        let HolidayName=document.forms['holiDForm']['hDayName'].value;
        // let Location=document.forms['holiDForm']['hDayLocation'].value;
        let HolidayDesc=document.forms['holiDForm']['hDayDesc'].value;

        const nameChecker=/^[A-Za-z ]{2,30}$/;
        console.log("Holiday Name : "+HolidayName);
        // Holiday name
        if(nameChecker.test(HolidayName) ){
          setError("hDayName","");
        }
        else{
          setError("hDayName","*should contain only character and should be atleast two characters ");
          isValid=false;
        }
        // Holiday Description
        if(HolidayDesc.length<15 ){
          setError("hDayDesc","*should be more than 15 character");
          isValid=false;
        }
        else{
          setError("hDayDesc","");
        }
        return isValid;
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