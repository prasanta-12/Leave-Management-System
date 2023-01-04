package com.example.demo.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.model.Admin;
import com.example.demo.model.Employee;
import com.example.demo.model.Manager;
import com.example.demo.repository.AdminRepository;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.ManagerRepository;

@Controller
public class LoginController {
	@Autowired
	AdminRepository adminRepository;
	@Autowired
	ManagerRepository manRepository;
	@Autowired
	EmployeeRepository empRepository;

	@GetMapping("/")
	public String loginPage() {
		return "login.jsp";
	}
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam("email") String email,@RequestParam("password") String password,HttpSession session) {
		Admin admin= adminRepository.findByEmailAndPassword(email, password);
		Manager manager=manRepository.findByEmailAndPassword(email, password);
		Employee employee=empRepository.findByEmailAndPassword(email, password);
//		ModelAndView mv =new ModelAndView();
		
		if(admin!=null) {
			session.setAttribute("email", email);
			ModelAndView mview=new ModelAndView();
			mview.setViewName("adminDashboard.jsp");
			mview.addObject("admin", admin);
			return mview;
		}
		else if(manager!=null) {
			session.setAttribute("email", email);
			ModelAndView mview=new ModelAndView();
			mview.setViewName("managerDashboard.jsp");
			mview.addObject("manager", manager);
			return mview;
		}
		else if(employee!=null) {
			session.setAttribute("email", email);
			ModelAndView mview=new ModelAndView();
			mview.setViewName("employeeDashboard.jsp");
			mview.addObject("employee", employee);
			return mview;
		}
		String errorMessage="Invalid Username Or Password";
		session.setAttribute("errorMessage", errorMessage);
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if(session !=null) {
			session.invalidate();
			
		}
		return "login.jsp";
	}
	
//	@RequestMapping("/logout")
//	public String logout(HttpSession session) {
//	  session.setAttribute("logoutMessage", "You have successfully logged out.");
//	  return "login.jsp";
//	}
}
