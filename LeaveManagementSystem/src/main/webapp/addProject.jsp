<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LMS | Projects</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="assets/css/style.min.css">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <!-- bootstrap modal-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha512-I5TkutApDjnWuX+smLIPZNhw+LhTd8WrQhdCKsxCFRSvhFx2km8ZfEpNIhF9nq04msHhOkE8BMOBj5QE07yhMA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body class="hold-transition sidebar-mini">
  <div class="wrapper">
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
        <li class="nav-item ">
        <a href="" class="nav-link" data-bs-toggle="modal" data-bs-target="#static">Project <i class='fa fa-plus-circle' style='color: white'></i></a>
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
            <!--  <div class="row p-3"> -->
                    <div class="col-md-10" >
                       <!--  <label  class="form-label">Enter old Password</label> -->
                        <input type="hidden" class="form-control" name="oldPass" id="oldPass"value="${admin.password}" required>
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
            <a href="viewprojects?id=<c:out value='${admin.id}'/>" class="nav-link">
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
          <div class="d-flex justify-content-between">
          <br>
        <!-- Project Table start -->
    <div class="container" id="projectTable">
      <table class="table table-dark table-striped caption-top table-hover">
				<thead class="thead-dark">
          <tr>
            <th>PID</th>
            <th>Project Name</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Description</th>
            <th>Team</th>
            <th>Manager ID</th>
         
          </tr>
				</thead>
				
				<tbody class="table-group-divider">
				<c:forEach items="${projects }" var="project">
					<tr class="table-active">
					  <td>${project.id}</td>
					  <td>${project.projectName}</td>
					  <td>${project.strDate}</td>
					  <td>${project.ndDate}</td>
					  <td>${project.projectDesc}</td>
					   <td >${project.projectTeam}</td>
					  <td>${project.projectManager}</td>
                     
					<!--   <td datalabel="Action"><a href="#" class="acn_item" ><i class='fas fa-pencil-alt' style='color: #9d8189;'></i></a>&nbsp;&nbsp;
              <a href="#" class="acn_item"><i class='fa fa-trash-alt' style='color: #9d8189;'></i>
              </a>
          </td>
				 -->	</tr>
				 </c:forEach>
				  </tbody>
		
			</table>
<!-- Project Table end -->
      </div>
  </div>
  <aside class="control-sidebar control-sidebar-dark">
  </aside>
</div>
      </section>
     
    </div>
    <aside class="control-sidebar control-sidebar-dark">
    </aside>
  </div>
  <!-- Side Navigation bar end -->
  <!-- Modal -->
  <div class="modal fade"  id="static" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="staticBackdropLabel">Add a Project</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form  name="projectForm" id="projectForm" action="add_project"   onsubmit="return Validation()" >
          <div class="modal-body ">
              <div class="container-fluid">
    
                  <div class="row p-3">
                      <div class="col-md-10" >
                          <label  class="form-label">Project Name</label>
                          <input type="text" class="form-control" name="inputName" id="inputName" required>
                          <span id="prjnameerror" class="text-danger font-weight-bold"></span>
                        </div>
                    </div>
                    <div class="row p-3">
                      <div class="col-md-5" >
                          <label  class="form-label">Start Date</label>
                          <input type="date" class="form-control" name="strDate"  id="strDate"required>
                      </div>
                      <div class="col-md-5" >
                          <label  class="form-label">End Date</label>
                          <input type="date" class="form-control" name="ndDate" id="ndDate"required>
                      </div>
                    </div>
                    <div class="row p-3">
                      <div class="col-md-5" >
                          <label for="projectTeam" class="form-label">Assign to team </label>
                          <input type="text" class="form-control" name="projectTeam" id="projectTeam"required>
                          <span id="assignteamerror" class="text-danger font-weight-bold"></span>
                      </div>
                      <div class="col-md-5" >
                          <label for="projectManager" class="form-label">Reporting Manager</label>
                          <select id="projectManager" class="form-select" name="projectManager" required="required">
                    <option selected>Choose...</option>
                    <c:forEach items="${managers }" var="manager">
                    <option value="${manager.id}">${manager.fullname}</option>
                    </c:forEach>
                  </select>
                          <span id="prjmangerror" class="text-danger font-weight-bold"></span>
                      </div>
                    </div>
                    <div class="row p-2">
                      <div class="col-md-10" >
                          <label for="projectDesc" class="form-label">Description of project</label>
                          <textarea class="form-control" id="projectDesc" name="projectDesc" id="" cols="1" rows="1" required></textarea>
                          <span id="descprjerror" class="text-danger font-weight-bold"></span>
                        </div>
                    </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="submit" class="btn btn-primary " id="savebtn">Save</button>
                  </div>
              </form>
      </div>
    </div>
  </div>
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