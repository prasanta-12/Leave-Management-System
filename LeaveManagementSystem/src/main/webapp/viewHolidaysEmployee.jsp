<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LMS | Holidays</title>
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
          <!-- </a> -->
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
               <!-- Holyday Table start -->
    <div class="container" id="hDayTable">
      <table class="table table-dark table-striped caption-top table-hover" >
          <caption>Holiday List</caption>
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