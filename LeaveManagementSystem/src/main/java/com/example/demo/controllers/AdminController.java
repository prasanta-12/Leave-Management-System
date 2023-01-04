package com.example.demo.controllers;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Admin;
import com.example.demo.model.Employee;
import com.example.demo.model.Holidays;
import com.example.demo.model.Leave;
import com.example.demo.model.Manager;
import com.example.demo.repository.AdminRepository;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.HolidayRepository;
import com.example.demo.repository.LeaveRepository;
import com.example.demo.repository.ManagerRepository;
import com.example.demo.service.AdminService;

import com.example.demo.service.EmpService;
import com.example.demo.service.ManagerService;
import com.example.demo.service.SendMail;

@Controller
public class AdminController {

	@Autowired
	AdminRepository adminRepository;
	@Autowired
	HolidayRepository holidayRepository;
	@Autowired
	EmployeeRepository empRepository;
	@Autowired
	ManagerRepository manRepository;
	@Autowired
	LeaveRepository lvRepository;
	@Autowired
	private SendMail mailservice;
	//Admin Dashboard
	@GetMapping("/adm_dashboard")
	public ModelAndView viewAdminDetails(@RequestParam("id") int id) {
//		ModelAndView mview=new ModelAndView();
//		mview.setViewName("adminDashboard.jsp");
		System.out.println("Admin id : "+id);
		Admin admin=adminRepository.findById(id);
		System.out.println("Admin object : "+admin);
	   ModelAndView mview=new ModelAndView();
	   mview.setViewName("adminDashboard.jsp");
	   mview.addObject("admin", admin);	   
	   return mview;
	}
	//Adding A Holiday
	@GetMapping("/add_holiday")
	public ModelAndView addHoliday(Holidays holiday ,HttpSession session) {
		int id=holiday.getAdminId();
		System.out.println("Admin Id inside addholiday :"+id);
		Holidays oldHoliday=holidayRepository.findByStartHDate(holiday.getStartHDate());
		if(oldHoliday !=null) {
			String holiExistsErr="Holiday already exists for this date try other date";
			session.setAttribute("holiExistsErr", holiExistsErr);
			return new ModelAndView("redirect:/viewholidays?id="+id);
		}
		holidayRepository.save(holiday);
		return new ModelAndView("redirect:/viewholidays?id="+id);
	}
	//View List of Holidays
	@GetMapping("/viewholidays")
	public ModelAndView displayHolidayDetails(@RequestParam("id") int id) {
		Admin admin=adminRepository.findById(id);
		List<Holidays> holidays=holidayRepository.findAll();
		ModelAndView mview=new ModelAndView();
		mview.setViewName("holidays.jsp");
		mview.addObject("holidays", holidays);
		mview.addObject("admin", admin);
		return mview;
	}
	//Getting  holiday list database for apply Leave
	 @GetMapping("/data")
	    public ResponseEntity<List<Date>> getData() {
	        List<Holidays> holidays = holidayRepository.findAll();
	        List<Date> dates=new ArrayList<>();
	        for(Holidays h:holidays) {
	        	dates.add(h.getStartHDate());
	        }
	        return ResponseEntity.ok(dates);
	    }
	 
	//View Apply Leave Form for Admin
		@RequestMapping("/apply_leave_admin")
		public ModelAndView applyLeaveAdmin(@RequestParam("id") int id) {
			Admin admin=adminRepository.findById(id);
			ModelAndView mview=new ModelAndView();
			mview.setViewName("applyLeaveAdmin.jsp");
			mview.addObject("admin",admin);
			return mview;
		}
		//Apply Leave Admin
	 	  @RequestMapping("/apply_leave_form_admin")
	 	  public ModelAndView submitLeaveAdmin(Leave leave, HttpSession session) {
	 		  int id=leave.getEmpId();
	 		  System.out.println("From apply leave admin empId: "+ id);
//	 		  List<Leave> leaves=lvRepository.findAllByEmpId(id);
	 		  Admin admin=adminRepository.findById(id);
	 		  AdminService aservice=new AdminService();
	 		  int count =aservice.calcutaleLeaveBalance(leave, admin);
	 		  if(count>=0) {
	 			  leave.setStatus("To Approve");
	 			  lvRepository.save(leave);
	 			 String fromEmail=leave.getEmpEmail();
	 			 String toEmail=leave.getReportingPerson();
	 			
	 			String msgBody="Hi, "+leave.getEmpName()+" have applied for leave for : "+leave.getDaycount()+" days";
	 			mailservice.sendMail(toEmail,"applied for leave BIZHUB ",msgBody,fromEmail);
	 		  }
	 		  else {
	 			 String dayExcided="Applied Leave days are more than available leave balance";
	 			session.setAttribute("dayExcided", dayExcided);
	 			return new ModelAndView("redirect:/apply_leave_admin?id="+id);
	 		  }
	 		  return new ModelAndView("redirect:/view_leaves_admin?id="+id);
	 	  }
	 	//view My leave History for admin
	 	  @RequestMapping("/view_leaves_admin")
	 	  public ModelAndView viewLeavesAdmin(@RequestParam("id") int id) {
	 		 System.out.println("From view leave admin empId: "+ id);
	 		 ModelAndView mview=new ModelAndView();
	 		Admin admin=adminRepository.findById(id);
	 		List<Leave> leaves=lvRepository.findAllByEmpId(id);
	 		System.out.println(leaves);
	 		mview.setViewName("viewLeaveAdmin.jsp");
 			mview.addObject("admin", admin);
 			mview.addObject("leaves", leaves);
	 		 return mview;
	 	  }
	 
	 
	 // Adding an employee by Admin
	 @GetMapping("/add_emp")
		public ModelAndView addEmployee(Employee employee,HttpSession session) {
		 List<Admin>admins=adminRepository.findAll();
		 Employee oldEmp=empRepository.findByEmail(employee.getEmail());
		 EmpService empsirvice=new EmpService();
		 
		 Admin admin=new Admin();
		 int id=0;
		 for(Admin a:admins) {
			 id=a.getId();
			 admin=a;
		 }
		 if(oldEmp!=null) {
			String EmExtErr="Email already exists try other email";
				session.setAttribute("EmExtErr", EmExtErr);
				return new ModelAndView("redirect:/set_add_emp?id="+id);
		 }
		 empsirvice.initializeLT(employee);
		 empsirvice.generateUsernameAndPassword(employee);
		 String semail=employee.getEmail();
			empsirvice.generateUsernameAndPassword(employee);
//			String username=employee.getEmail();
			String password=employee.getPassword();
			String userAndPass="Hi, your BIZHUB account has been created. Your Username is : "+semail+" and Password : "+password;
			mailservice.sendMail(semail,"Username And Password for BIZHUB ",userAndPass,admin.getEmail());
			
			empRepository.save(employee);
			return new ModelAndView("redirect:/viewemployees?id="+id);
		}
	 // Setting data(List of managers) in add employee from in Reporting Manager drop-down
	 @GetMapping("/set_add_emp")
		public ModelAndView setEmployee(@RequestParam("id") int id) {
		 Admin admin=adminRepository.findById(id);
		 List<Manager> managers=manRepository.findAll();
			ModelAndView mview=new ModelAndView();
			mview.setViewName("addEmp.jsp");
			mview.addObject("managers", managers);
			mview.addObject("admin", admin);
			return mview;
		}
	 // View Employee List
	 @GetMapping("/viewemployees")
		public ModelAndView displayEmployeeDetails(@RequestParam("id") int id) {
		    Admin admin=adminRepository.findById(id);
			List<Employee> employees=empRepository.findAllByStatus("Active");
			ModelAndView mview=new ModelAndView();
			mview.setViewName("viewEmpTbl.jsp");
			mview.addObject("employees", employees);
			mview.addObject("admin", admin);
			return mview;
		}
	 //Delete an Employee
		@GetMapping("/delete_emp")
		public ModelAndView deleteEmployee(@RequestParam("id") int id) {
			List<Admin> admins=adminRepository.findAll();
			int adminId=0;
			for(Admin a:admins) {
				adminId=a.getId();
			}
			System.out.println(id);
			Employee employee=empRepository.findById(id);
			employee.setStatus("Inactive");
			empRepository.save(employee);
			return new ModelAndView("redirect:/viewemployees?id="+adminId);
		}
		//set edit page for employee an Employee
		@GetMapping("/edit_emp")
		public ModelAndView editEmployee(@RequestParam("id") int id) {
			Employee employee=empRepository.findById(id);
			ModelAndView mview=new ModelAndView();
			List<Admin> admins=adminRepository.findAll();
			List<Manager> managers=manRepository.findAll();
			Manager repMan=manRepository.findByEmail(employee.getReportingPerson());
			Admin admin=new Admin();
			for(Admin a:admins) {
				admin=a;
			}
			mview.setViewName("editEmployee.jsp");
			mview.addObject("employee", employee);
			mview.addObject("managers", managers);
			mview.addObject("repMan", repMan);
			mview.addObject("admin", admin);
			return mview;
			
		}
		//Update an employee
		@RequestMapping("/update_emp")
		public ModelAndView updateEmployee(Employee employee) {
			List<Admin> admins=adminRepository.findAll();
			int adminId=0;
			for(Admin a:admins) {
				adminId=a.getId();
			}
			empRepository.save(employee);
			return new ModelAndView("redirect:/viewemployees?id="+adminId);
		}
	 
//     View Admin Profile
		@RequestMapping("/view_admin_profile")
		public ModelAndView sendAdminProfile(HttpServletRequest request) {
			System.out.println("admin id : "+request.getParameter("id"));
			int id=Integer.parseInt(request.getParameter("id"));
			Admin admin=adminRepository.getReferenceById(id);
			request.setAttribute("admin", admin);
			ModelAndView mview=new ModelAndView();
			mview.setViewName("adminProfile.jsp");
			mview.addObject("admin", admin);
			return mview;
		}
		
		 @RequestMapping("/manage_leaves_admin")
	 	  public ModelAndView manageLeavesAdmin(@RequestParam("id") int id) {
			 Admin admin=adminRepository.findById(id);
	 		 ModelAndView mview=new ModelAndView();
	 		List<Leave> leaves=lvRepository.findAllByReportingPerson(admin.getEmail());	
	 		System.out.println(leaves);
	 		mview.setViewName("manageLeaveAdmin.jsp");
			mview.addObject("admin",admin);
			mview.addObject("leaves", leaves);
	 		 return mview;
	 	  }
		 @RequestMapping("/approved_by_admin")
	 	  public ModelAndView approveLeaveAdmin(@RequestParam("id") int id) {
			 System.out.println("Inside approve leave handler id :"+id);
			 Leave leave=lvRepository.findById(id);
			 Manager manager=manRepository.findById(leave.getEmpId());		 
			 Admin admin=adminRepository.findByEmail(leave.getReportingPerson());
			 int adminId=admin.getId();
			 System.out.println("Admin id Inside approve leave handler :"+id);
	 		 AdminService aservice=new AdminService();
	 		 aservice.approveLeave(leave, manager);
	 		manRepository.save(manager);
	 		lvRepository.save(leave);
	 		String fromEmail=leave.getReportingPerson();
			 String toEmail=leave.getEmpEmail();
			String msgBody="Hi, "+leave.getEmpName()+" your leave for : "+leave.getDaycount()+" days has been approved by "+admin.getFullname();
			mailservice.sendMail(toEmail,"Leave Approved BIZHUB ",msgBody,fromEmail);
	 		 return new ModelAndView("redirect:/manage_leaves_admin?id="+adminId);
	 	  }
		 @RequestMapping("/rejected_by_admin")
	 	  public ModelAndView rejectLeaveAdmin(@RequestParam("id") int id) {
			 System.out.println("Inside reject leave handler id :"+id);
			 Leave leave=lvRepository.findById(id);
//			 Manager manager=manRepository.findById(leave.getEmpId());		 
			 Admin admin=adminRepository.findByEmail(leave.getReportingPerson());
			 int adminId=admin.getId();
			 System.out.println("Admin id Inside approve leave handler :"+id);
	 		 leave.setStatus("Rejected");
//	 		 lvRepository.deleteById(id);
	 		 lvRepository.save(leave);
	 		 
		 		String fromEmail=leave.getReportingPerson();
				 String toEmail=leave.getEmpEmail();
				String msgBody="Hi, "+leave.getEmpName()+" your leave for : "+leave.getDaycount()+" days has been Rejected by "+admin.getFullname();
				mailservice.sendMail(toEmail,"Leave Rejected BIZHUB ",msgBody,fromEmail);
	 		 return new ModelAndView("redirect:/manage_leaves_admin?id="+adminId);
	 	  }
		 @RequestMapping("/reset_pass_admin")
			public ModelAndView resetPassword(@RequestParam("email") String email,@RequestParam("oldPass1") String oldPass,@RequestParam("newPass") String newPass, HttpSession session) {
			Admin admin=adminRepository.findByEmailAndPassword(email, oldPass);
				if(admin!=null) {
				admin.setPassword(newPass);
				adminRepository.save(admin);				
				}
				return new ModelAndView("redirect:/logout");
			}
		 
		 //Manage manager by admin
		 
		 // Adding an manager by Admin
		 @GetMapping("/add_manager")
			public ModelAndView addManager(Manager manager,HttpSession session) {
			 List<Admin>admins=adminRepository.findAll();
			 Manager oldManager=manRepository.findByEmail(manager.getEmail());
			 ManagerService mservice=new ManagerService();	 
			 Admin admin=new Admin();
			 int id=0;
			 for(Admin a:admins) {
				 id=a.getId();
				 admin=a;
			 }
			 if(oldManager!=null) {
				String managerExtErr="Email already exists try other email";
					session.setAttribute("managerExtErr", managerExtErr);
					return new ModelAndView("redirect:/set_add_manager?id="+id);
			 }
			 mservice.initializeLT(manager);
			 mservice.generateUsernameAndPassword(manager);
			 String semail=manager.getEmail();
				mservice.generateUsernameAndPassword(manager);
				String password=manager.getPassword();
				String userAndPass="Hi, your BIZHUB account has been created. Your Username is : "+semail+" and Password : "+password;
				mailservice.sendMail(semail,"Username And Password for BIZHUB ",userAndPass,admin.getEmail());			
				manRepository.save(manager);
				return new ModelAndView("redirect:/viewmanagers?id="+id);
			}
		 // Setting data(List of admins in add manager from in Reporting Person drop-down
		 @GetMapping("/set_add_manager")
			public ModelAndView setManager(@RequestParam("id") int id) {
			 Admin admin=adminRepository.findById(id);
			 List<Admin> admins=adminRepository.findAll();
				ModelAndView mview=new ModelAndView();
				mview.setViewName("addManager.jsp");
				mview.addObject("admin", admin);
				mview.addObject("admins", admins);
				return mview;
			}
		 // View Manager List
		 @GetMapping("/viewmanagers")
			public ModelAndView displayManagerDetails(@RequestParam("id") int id) {
			    Admin admin=adminRepository.findById(id);
				List<Manager> managers=manRepository.findAllByStatus("Active");
				ModelAndView mview=new ModelAndView();
				mview.setViewName("viewManagerTable.jsp");
				mview.addObject("managers", managers);
				mview.addObject("admin", admin);
				return mview;
			}
		 //Delete an Manager
			@GetMapping("/delete_manager")
			public ModelAndView deleteManager(@RequestParam("id") int id) {
				List<Admin> admins=adminRepository.findAll();
				int adminId=0;
				for(Admin a:admins) {
					adminId=a.getId();
				}
				System.out.println(id);
				Manager manager=manRepository.findById(id);
				manager.setStatus("Inactive");
				manRepository.save(manager);
				return new ModelAndView("redirect:/viewmanagers?id="+adminId);
			}
			//set edit page for manager an manager
			@GetMapping("/edit_manager")
			public ModelAndView editManager(@RequestParam("id") int id) {
				Manager manager=manRepository.findById(id);
				ModelAndView mview=new ModelAndView();
				List<Admin> admins=adminRepository.findAll();
				Admin admin=new Admin();
				for(Admin a:admins) {
					admin=a;
				}
				mview.setViewName("editManager.jsp");
				mview.addObject("manager", manager);
				mview.addObject("admin", admin);
				mview.addObject("admins", admins);
				return mview;
				
			}
			//Update an Manager
			@RequestMapping("/update_manager")
			public ModelAndView updateManager(Manager manager) {
				List<Admin> admins=adminRepository.findAll();
				int adminId=0;
				for(Admin a:admins) {
					adminId=a.getId();
				}
				manRepository.save(manager);
				return new ModelAndView("redirect:/viewmanagers?id="+adminId);
			}
		 
}
