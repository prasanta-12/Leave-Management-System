package com.example.demo.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.HolidayRepository;
import com.example.demo.repository.LeaveRepository;
import com.example.demo.repository.ManagerRepository;
import com.example.demo.service.ManagerService;
import com.example.demo.service.SendMail;

@Controller
public class ManagerController {
	@Autowired
	ManagerRepository manRepository;
	@Autowired
	HolidayRepository holidayRepository;
	@Autowired
	LeaveRepository lvRepository;
	@Autowired
	EmployeeRepository empRepository;
	@Autowired
	private SendMail mailservice;
	
	//Manager Dashboard
	
	   @RequestMapping("/manager_dashboard") 
	   public ModelAndView viewAdminDetails(@RequestParam("id") int id) {
		System.out.println("Manager id : "+id);
		Manager manager=manRepository.findById(id);
		System.out.println("Manager object : "+manager);
	   ModelAndView mview=new ModelAndView();
	   mview.setViewName("managerDashboard.jsp");
	   mview.addObject("manager", manager);
	   
	   return mview; 
	   }
	 //View Apply Leave Form for Manager
	 		@RequestMapping("/apply_leave_manager")
	 		public ModelAndView applyLeaveManager(@RequestParam("id") int id) {
	 			Manager manager=manRepository.findById(id);
	 			ModelAndView mview=new ModelAndView();
	 			mview.setViewName("applyLeaveManager.jsp");
	 			mview.addObject("manager", manager);
	 			return mview;
	 		}
	 		//Apply Leave
	 	  @RequestMapping("/apply_leave")
	 	  public ModelAndView submitLeaveManager(Leave leave, HttpSession session) {
	 		  int id=leave.getEmpId();
	 		  System.out.println("From apply leave manager empId: "+ id);
//	 		  List<Leave> leaves=lvRepository.findAllByEmpId(id);
	 		  Manager manager=manRepository.findById(id);
	 		  ManagerService mservice=new ManagerService();
	 		  int count =mservice.calcutaleLeaveBalance(manager, leave, leave.getLeaveType());
	 		  if(count>=0) {
	 			  leave.setStatus("To Approve");
	 			  lvRepository.save(leave);
	 			  String fromEmail=leave.getEmpEmail();
	 			 String toEmail=leave.getReportingPerson();
	 			
	 			String msgBody="Hi, "+leave.getEmpName()+" have applied for leave for : "+leave.getDaycount()+" days";
	 			mailservice.sendMail(toEmail,"applied for leave BIZHUB ",msgBody,fromEmail);
	 		  }
	 		  else {
	 			 String dayExcidedMan="Applied Leave days are more than available leave balance";
	 			session.setAttribute("dayExcidedMan", dayExcidedMan);
	 			return new ModelAndView("redirect:/apply_leave_manager?id="+id);
	 		  }
//	 		 ModelAndView mview=new ModelAndView();
//	 		mview.setViewName("viewLeaveManager.jsp");
// 			mview.addObject("manager", manager);
// 			mview.addObject("leaves", leaves);
	 		  return new ModelAndView("redirect:/view_leaves_manager?id="+id);
	 	  }
	 	  //view My leave History for manager
	 	  @RequestMapping("/view_leaves_manager")
	 	  public ModelAndView viewLeavesManager(@RequestParam("id") int id) {
	 		 System.out.println("From view leave manager empId: "+ id);
	 		 ModelAndView mview=new ModelAndView();
	 		Manager manager=manRepository.findById(id);
	 		List<Leave> leaves=lvRepository.findAllByEmpId(id);
	 		System.out.println(leaves);
	 		mview.setViewName("viewLeaveManager.jsp");
 			mview.addObject("manager", manager);
 			mview.addObject("leaves", leaves);
	 		 return mview;
	 	  }
	 	  //Manage Leaves of employees 
	 	 @RequestMapping("/manage_leaves_manager")
	 	  public ModelAndView manageLeavesManager(@RequestParam("id") int id) {
			 Manager manager=manRepository.findById(id);
	 		 ModelAndView mview=new ModelAndView();
	 		List<Leave> leaves=lvRepository.findAllByReportingPerson(manager.getEmail());	
	 		System.out.println(leaves);
	 		mview.setViewName("manageLeaveManager.jsp");
			mview.addObject("manager",manager);
			mview.addObject("leaves", leaves);
	 		 return mview;
	 	  }
		 @RequestMapping("/approved_by_manager")
	 	  public ModelAndView approveLeaveManager(@RequestParam("id") int id) {
			 System.out.println("Inside approve leave handler id :"+id);
			 Leave leave=lvRepository.findById(id);
			 Employee employee=empRepository.findById(leave.getEmpId());		 
			 Manager manager=manRepository.findByEmail(leave.getReportingPerson());
			 int managerId=manager.getId();
			 System.out.println("Admin id Inside approve leave handler :"+id);
	 		 ManagerService mservice=new ManagerService();
	 		 mservice.approveLeave(leave, employee);
	 		empRepository.save(employee);
	 		lvRepository.save(leave);
	 		String fromEmail=leave.getReportingPerson();
			 String toEmail=leave.getEmpEmail();
			String msgBody="Hi, "+leave.getEmpName()+" your leave for : "+leave.getDaycount()+" days has been approved by "+manager.getFullname();
			mailservice.sendMail(toEmail,"Leave Approved BIZHUB ",msgBody,fromEmail);
	 		 return new ModelAndView("redirect:/manage_leaves_manager?id="+managerId);
	 	  }
		 @RequestMapping("/rejected_by_manager")
	 	  public ModelAndView rejectLeaveManager(@RequestParam("id") int id) {
			 System.out.println("Inside reject leave handler id :"+id);
			 Leave leave=lvRepository.findById(id);
		     Manager manager=manRepository.findByEmail(leave.getReportingPerson());		 
//			 Admin admin=adminRepository.findByEmail(leave.getReportingPerson());
			 int managerId=manager.getId();
			 System.out.println("Manager id Inside approve leave handler :"+id);
	 		 leave.setStatus("Rejected");
	 		 lvRepository.save(leave);
	 		 
	 		String fromEmail=leave.getReportingPerson();
			 String toEmail=leave.getEmpEmail();
			String msgBody="Hi, "+leave.getEmpName()+" your leave for : "+leave.getDaycount()+" days has been Rejected by "+manager.getFullname();
			mailservice.sendMail(toEmail,"Leave Rejected BIZHUB ",msgBody,fromEmail);
	 		 return new ModelAndView("redirect:/manage_leaves_manager?id="+managerId);
	 	  }
	 	  
	   
//	      View Manager Profile
		@RequestMapping("/view_manager_profile")
		public ModelAndView sendManagerProfile(HttpServletRequest request) {
//			System.out.println("manager id : "+session.getAttribute("id"));
//			int id=(int) (session.getAttribute("id"));
			System.out.println("manager id : "+request.getParameter("id"));
			int id=Integer.parseInt(request.getParameter("id"));
			System.out.println("manager id : "+id);
			Manager manager=manRepository.getReferenceById(id);
			request.setAttribute("manager", manager);
			ModelAndView mview=new ModelAndView();
			mview.setViewName("managerProfile.jsp");
			mview.addObject("manager", manager);
			return mview;
		}
		//View List of Holidays
		@RequestMapping("/viewholidaysmanager")
		public ModelAndView displayHolidayDetailsManager(@RequestParam("id") int id) {
			List<Holidays> holidays=holidayRepository.findAll();
			Manager manager=manRepository.findById(id);
			ModelAndView mview=new ModelAndView();
			mview.setViewName("viewHolidaysManager.jsp");
			mview.addObject("holidays", holidays);
			mview.addObject("manager", manager);
			return mview;
		}
		//View Employee List By Manager
		 @RequestMapping("/viewemployees_manager")
			public ModelAndView displayEmployeeDetailsManager(@RequestParam("id") int id) {
			    Manager manager=manRepository.findById(id);
				List<Employee> employees=empRepository.findAllByReportingPersonAndStatus(manager.getEmail(),"Active");
				ModelAndView mview=new ModelAndView();
				mview.setViewName("viewEmpTableManager.jsp");
				mview.addObject("employees", employees);
				mview.addObject("manager", manager);
				return mview;
			}
		

}
