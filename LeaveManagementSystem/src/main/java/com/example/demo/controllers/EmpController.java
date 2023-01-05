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
import com.example.demo.service.EmpService;
import com.example.demo.service.ManagerService;
import com.example.demo.service.SendMail;

@Controller
public class EmpController {
	@Autowired
	EmployeeRepository empRepository;
	@Autowired
	HolidayRepository holidayRepository;
	@Autowired
	LeaveRepository lvRepository;
	@Autowired
	private SendMail mailservice;
	
	//Employee Dashboard
	
	   @RequestMapping("/employee_dashboard") 
	   public ModelAndView viewEmployeeDashboard(@RequestParam("id") int id) {
		System.out.println("employee id : "+id);
		Employee employee=empRepository.findById(id);
	   ModelAndView mview=new ModelAndView();
	   mview.setViewName("employeeDashboard.jsp");
	   mview.addObject("employee", employee);
	   
	   return mview; 
	   }
	 //Employee Profile
		@RequestMapping("/view_employee_profile")
		public ModelAndView sendEmployeeProfile(HttpServletRequest request) {
			System.out.println("Employee id : "+request.getParameter("id"));
			int id=Integer.parseInt(request.getParameter("id"));
			Employee employee=empRepository.getReferenceById(id);
			request.setAttribute("employee",employee);
			ModelAndView mview=new ModelAndView();
			mview.setViewName("employeeProfile.jsp");
			mview.addObject("employee", employee);
			return mview;
		}
		//View List of Holidays
		@RequestMapping("/viewholidaysemployee")
		public ModelAndView displayHolidayDetailsEmployee(@RequestParam("id") int id) {
			List<Holidays> holidays=holidayRepository.findAll();
			Employee employee=empRepository.findById(id);
			ModelAndView mview=new ModelAndView();
			mview.setViewName("viewHolidaysEmployee.jsp");
			mview.addObject("holidays", holidays);
			mview.addObject("employee", employee);
			return mview;
		}
		//View Apply Leave Form for Employee
 		@RequestMapping("/set_leave_employee")
 		public ModelAndView applyLeaveManager(@RequestParam("id") int id) {
 			Employee employee=empRepository.findById(id);
 			ModelAndView mview=new ModelAndView();
 			mview.setViewName("applyLeaveEmployee.jsp");
 			mview.addObject("employee", employee);
 			return mview;
 		}
 		//Apply Leave
 	  @RequestMapping("/apply_leave_employee")
 	  public ModelAndView submitLeaveEmployee(Leave leave, HttpSession session) {
 		  int id=leave.getEmpId();
 		  System.out.println("From apply leave employee empId: "+ id);
// 		  List<Leave> leaves=lvRepository.findAllByEmpId(id);
 		  Employee employee=empRepository.findById(id);
 		  EmpService eservice=new EmpService();
 		  int count =eservice.calcutaleLeaveBalance(leave,employee);
 		  if(count>=0) {
 			  leave.setStatus("To Approve");
 			  lvRepository.save(leave);
 			 String fromEmail=leave.getEmpEmail();
 			 String toEmail=leave.getReportingPerson();
 			
 			String msgBody="Hi, "+leave.getEmpName()+" have applied for leave for : "+leave.getDaycount()+" days";
 			mailservice.sendMail(toEmail,"applied for leave BIZHUB ",msgBody,fromEmail);
 		  }
 		  else {
 			 String dayExcidedEmp="Applied Leave days are more than available leave balance";
 			session.setAttribute("dayExcidedEmp", dayExcidedEmp);
 			return new ModelAndView("redirect:/set_leave_employee?id="+id);
 		  }
 		  return new ModelAndView("redirect:/view_leaves_employee?id="+id);
 	  }
 	  //view My leave History for employee
 	  @RequestMapping("/view_leaves_employee")
 	  public ModelAndView viewLeavesEmployee(@RequestParam("id") int id) {
 		 System.out.println("From view leave employee empId: "+ id);
 		 ModelAndView mview=new ModelAndView();
 		Employee employee=empRepository.findById(id);
 		List<Leave> leaves=lvRepository.findAllByEmpId(id);
 		System.out.println(leaves);
 		mview.setViewName("viewLeaveEmployee.jsp");
			mview.addObject("employee", employee);
			mview.addObject("leaves", leaves);
 		 return mview;
 	  }
 	 @RequestMapping("/reset_pass_emoloyee")
		public ModelAndView resetPassword(@RequestParam("email") String email,@RequestParam("oldPass1") String oldPass,@RequestParam("newPass") String newPass, HttpSession session) {
		Employee emoloyee=empRepository.findByEmailAndPassword(email, oldPass);
			if(emoloyee!=null) {
			emoloyee.setPassword(newPass);
			empRepository.save(emoloyee);				
			}
			return new ModelAndView("redirect:/logout");
		}
 	  @RequestMapping("/view_leave_policy_employee") 
	   public ModelAndView viewLeavePolicyEmployee(@RequestParam("id") int id) {
		System.out.println("employee id : "+id);
		Employee employee=empRepository.findById(id);
	   ModelAndView mview=new ModelAndView();
	   mview.setViewName("viewLeavePolicyEmployee.jsp");
	   mview.addObject("employee", employee);
	   
	   return mview; 
	   }

}
