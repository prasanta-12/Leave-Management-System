package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.model.Employee;
import com.example.demo.model.Leave;
import com.example.demo.model.Manager;


@Service
public class ManagerService {

	public int calcutaleLeaveBalance(Manager manager, Leave leave,String leaveType) {
		int count=0;
		int applied=leave.getDaycount();
		switch(leaveType) {
		case "Sick Leave":
			count=manager.getSickLeave()-applied;
			break;
		case "Casual Leave":
			count=manager.getCasualLeave()-applied;
			break;
		case "Personal Leave":
			count=manager.getPersonalLeave()-applied;
			break;
		case "Maternity Leave":
			count=manager.getMaternityLeave()-applied;
			break;
		case "Petarnity Leave":
			count=manager.getPaternityLeave()-applied;
			break;
		case "Marriage Leave":
			count=manager.getMarriageLeave()-applied;
			break;
		case "Adoption Leave":
			count=manager.getAdoptionLeave()-applied;
			break;
		default:count=-1;
			}
		
		return count;
		
	}
	public void approveLeave(Leave leave,Employee employee) {
		String leaveType=leave.getLeaveType();
		int leaveBalance=0;
		switch(leaveType) {
		case "Sick Leave":
			leaveBalance=employee.getSickLeave()-leave.getDaycount();
			employee.setSickLeave(leaveBalance);
			break;
		case "Casual Leave":
			leaveBalance=employee.getCasualLeave()-leave.getDaycount();
			employee.setCasualLeave(leaveBalance);
			break;
		case "Personal Leave":
			leaveBalance=employee.getPersonalLeave()-leave.getDaycount();
			employee.setPersonalLeave(leaveBalance);
			break;
		case "Maternity Leave":
			leaveBalance=employee.getMaternityLeave()-leave.getDaycount();
			employee.setMaternityLeave(leaveBalance);
			break;
		case "Patarnity Leave":
			leaveBalance=employee.getPaternityLeave()-leave.getDaycount();
			employee.setPaternityLeave(leaveBalance);
			break;
		case "Marriage Leave":
			leaveBalance=employee.getMarriageLeave()-leave.getDaycount();
			employee.setMarriageLeave(leaveBalance);
			break;
		case "Adoption Leave":
			leaveBalance=employee.getAdoptionLeave()-leave.getDaycount();
			employee.setAdoptionLeave(leaveBalance);
			break;
		default:;
			}
		System.out.println("Inside Manage Service approve function :"+leaveBalance);
	leave.setStatus("Approved");
	}
	
}
