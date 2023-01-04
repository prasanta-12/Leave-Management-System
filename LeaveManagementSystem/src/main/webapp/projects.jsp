<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>LMS | Manage Projects</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha512-I5TkutApDjnWuX+smLIPZNhw+LhTd8WrQhdCKsxCFRSvhFx2km8ZfEpNIhF9nq04msHhOkE8BMOBj5QE07yhMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="assets/css/style.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <style>
     .modal-header{
            background-color: #f4acb7;
            color: white;
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
      <li class="nav-item ">
        <a href="" class="nav-link" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Project <i class='fa fa-plus-circle' style='color: white'></i></a>
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

  <div class="modal fade"  id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="staticBackdropLabel">Add a Project</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="add_project" name="projectForm" id="projectForm" onsubmit="return isValidForm()" method="post">
        <div class="modal-body ">
          <div class="container-fluid">
            <div class="row p-3">
                <div class="col-md-10" id="projectName">
                    <label  class="form-label">Project Name</label>
                    <input type="text" class="form-control" name="projectName" required>
                    <div class="invalidForm">
                    </div>
                  </div>
              </div>
              <div class="row p-3">
                <div class="col-md-5" id="strDate">
                    <label  class="form-label">Start Date</label>
                    <input type="date" class="form-control" name="strDate" id="Sdate" required>
                    <div class="invalidForm">
                    </div>
                </div>
                <div class="col-md-5" id="ndDate">
                    <label  class="form-label">End Date</label>
                    <input type="date" class="form-control" name="ndDate" id="Edate" required>
                    <div class="invalidForm">
                    </div>
                </div>
              </div>
              <div class="row p-3">
                <div class="col-md-5" id="projectTeam">
                    <label for="projectTeam" class="form-label">Assign to team </label>
                    <input type="text" class="form-control" name="projectTeam" required>
                    <div class="invalidForm">
                    </div>
                </div>
                <div class="col-md-5" id="projectManager">
                    <label for="projectManager" class="form-label">Reporting Manager</label>
                    <input type="text" class="form-control" name="projectManager" required>
                    <div class="invalidForm">
                    </div>
                </div>
              </div>
              <div class="row p-2">
                <div class="col-md-10" id="projectDesc">
                    <label for="projectDesc" class="form-label">Description of project</label>
                    <textarea class="form-control" id="projectDesc" name="projectDesc" id="" cols="2" rows="1" required></textarea>
                    <div class="invalidForm">
                    </div>
                  </div> 
              </div>
              </div>
            </div>
            </form>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn"  style='background-color: #9d8189;' id="savebtn">Save</button>
             </div>
      </div>
      </div> 
    </div>
  </div>
  <aside class="main-sidebar text-white elevation-4">
    <a href="" class="brand-link">
      <img src="CSS/icons.png" class="brand-image">
      <span class="brand-text font-weight-larger" id="logo">LMS</span></a>
      
 <div class="sidebar">
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="adm_dashboard" class="nav-link">
                <i class='fa fa-home'></i>
                <p class="text-white">
                  &nbsp;&nbsp; Home
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="set_add_emp" class="nav-link">
                <i class="fa fa-user-plus"></i>
                <p class="text-white">
                  &nbsp;&nbsp;Add Employee
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="viewemployees" class="nav-link">
                <i class="fa fa-th-list"></i>
                <p class="text-white">
                  &nbsp;&nbsp;Manage Employee
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="projects.jsp" class="nav-link" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                <i class="fas fa-project-diagram"></i>
                <p class="text-white">
                  &nbsp;&nbsp;Add project
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="viewholidays" class="nav-link">
                <i class="fas fa-gifts"></i>
              <p class="text-white">
                &nbsp;&nbsp;Add Holiday
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="applyLeaveManager.jsp" class="nav-link">
              <i class="fa fa-user"></i>
                 <p class="text-white">
                  &nbsp;&nbsp;Apply Leave
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
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
        </ul>
      </nav>
    </div>
  </aside>
  <div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <!-- <div class="container" align="center"> -->
          <!-- <h3>
               Project Directory
          </h3> -->
          <div class="d-flex justify-content-between">
          <br>
        <!-- Project Table start -->
    <div class="container" id="projectTable">
      <table class="table table-dark table-striped caption-top table-hover m-2" >
         
          <thead>
            <tr>
              <th scope="col">Project Id</th>
              <th scope="col">Project Name</th>
              <th scope="col">Start Date</th>
              <th scope="col">End Date</th>
              <th scope="col">Description</th>
              <th scope="col">Team</th>
              <th scope="col"> Manager</th>
              <th scope="col">Action</th>
            </tr>
          </thead>
          <tbody class="table-group-divider">
            <tr class="table-active">
              <th scope="row">101</th>
              <td>Leave Management System</td>
              <td>22-12-2022</td>
              <td>06-01-2023</td>
              <td>Leave Management System for EMS</td>
              <td>Team 3</td>
              <td>Ajusha Lalasan</td>
              <td><a href="#" class="acn_item" ><i class='fas fa-pencil-alt' style='color: #9d8189;'></i></a>&nbsp;&nbsp;
                  <a href="#" class="acn_item"><i class='fa fa-trash-alt' style='color: #9d8189;'></i>
                  </a>
              </td>
            </tr>
          </tbody>
<!--   </div> -->
 
</table>
</div>
<!-- Project Table end -->
      </div>
  </div>
  <aside class="control-sidebar control-sidebar-dark">
  </aside>
  </section>
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

function countDays() {
    // Get the start and end dates from the form elements
    var startDate = new Date(document.getElementById('Sdate').value);
    var endDate = new Date(document.getElementById('Edate').value);

    // Calculate the difference in milliseconds between the two dates
    var differenceInMilliseconds = endDate - startDate;

    // Convert the difference to days
    var differenceInDays = differenceInMilliseconds / 1000 / 60 / 60 / 24;

    // Round down to the nearest whole number
    differenceInDays = Math.floor(differenceInDays);
    console.log("Date : "+differenceInDays);

    // Display the result
   // document.getElementById('currApply').innerHTML = 'Number of days: ' + differenceInDays;
}
</script>
<script src="plugins/jquery/jquery.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/style.min.js"></script>
</body>
</html>
