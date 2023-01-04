package com.example.demo.service;

import org.springframework.stereotype.Service;
import com.example.demo.model.Employee;
import com.example.demo.model.Leave;
@Service
public class EmpService {
	public int calcutaleLeaveBalance(Leave leave,Employee employee) {
		int count=0;
		String leaveType=leave.getLeaveType();
		int applied=leave.getDaycount();
		switch(leaveType) {
		case "Sick Leave":
			count=employee.getSickLeave()-applied;
			break;
		case "Casual Leave":
			count=employee.getCasualLeave()-applied;
			break;
		case "Personal Leave":
			count=employee.getPersonalLeave()-applied;
			break;
		case "Maternity Leave":
			count=employee.getMaternityLeave()-applied;
			break;
		case "Petarnity Leave":
			count=employee.getPaternityLeave()-applied;
			break;
		case "Marriage Leave":
			count=employee.getMarriageLeave()-applied;
			break;
		case "Adoption Leave":
			count=employee.getAdoptionLeave()-applied;
			break;
		default:count=-1;
			}
		
		return count;
	}
	
	public void initializeLT(Employee employee) {
		employee.setSickLeave(15);
		employee.setCasualLeave(15);
		employee.setPersonalLeave(15);
		employee.setMaternityLeave(180);
		employee.setPaternityLeave(30);
		employee.setMarriageLeave(15);
		employee.setAdoptionLeave(30);
	}
	//Set Username and Password
		public void generateUsernameAndPassword(Employee employee) {
			StringBuilder sb=new StringBuilder();
			String fullname=employee.getFullname();
			String contact=employee.getContact();
			for(int i=0;i<fullname.length();i++) {
				char ch=fullname.charAt(i);
				if(ch==' ')break;
				
				sb.append(ch);
			}
			sb.append('@');
			sb.append(contact.substring(6, 10));
			
			employee.setUsername(sb.toString());
			employee.setPassword(sb.toString());
			
		}
		

}
