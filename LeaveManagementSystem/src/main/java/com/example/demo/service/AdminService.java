package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.model.Admin;
import com.example.demo.model.Employee;
import com.example.demo.model.Leave;
import com.example.demo.model.Manager;

@Service
public class AdminService {

	
	public void initializeLT(Manager manager) {
		manager.setSickLeave(15);
		manager.setCasualLeave(15);
		manager.setPersonalLeave(15);
		manager.setMaternityLeave(180);
		manager.setPaternityLeave(30);
		manager.setMarriageLeave(15);
		manager.setAdoptionLeave(30);
	}
	public int calcutaleLeaveBalance(Leave leave,Admin admin) {
		int count=0;
		String leaveType=leave.getLeaveType();
		int applied=leave.getDaycount();
		switch(leaveType) {
		case "Sick Leave":
			count=admin.getSickLeave()-applied;
			break;
		case "Casual Leave":
			count=admin.getCasualLeave()-applied;
			break;
		case "Personal Leave":
			count=admin.getPersonalLeave()-applied;
			break;
		case "Maternity Leave":
			count=admin.getMaternityLeave()-applied;
			break;
		case "Petarnity Leave":
			count=admin.getPaternityLeave()-applied;
			break;
		case "Marriage Leave":
			count=admin.getMarriageLeave()-applied;
			break;
		case "Adoption Leave":
			count=admin.getAdoptionLeave()-applied;
			break;
		default:count=-1;
			}
		
		return count;
	}
	public void approveLeave(Leave leave,Manager manager) {
		String leaveType=leave.getLeaveType();
		int leaveBalance=0;
		switch(leaveType) {
		case "Sick Leave":
			leaveBalance=manager.getSickLeave()-leave.getDaycount();
			manager.setSickLeave(leaveBalance);
			break;
		case "Casual Leave":
			leaveBalance=manager.getCasualLeave()-leave.getDaycount();
			manager.setCasualLeave(leaveBalance);
			break;
		case "Personal Leave":
			leaveBalance=manager.getPersonalLeave()-leave.getDaycount();
			manager.setPersonalLeave(leaveBalance);
			break;
		case "Maternity Leave":
			leaveBalance=manager.getMaternityLeave()-leave.getDaycount();
			manager.setMaternityLeave(leaveBalance);
			break;
		case "Patarnity Leave":
			leaveBalance=manager.getPaternityLeave()-leave.getDaycount();
			manager.setPaternityLeave(leaveBalance);
			break;
		case "Marriage Leave":
			leaveBalance=manager.getMarriageLeave()-leave.getDaycount();
			manager.setMarriageLeave(leaveBalance);
			break;
		case "Adoption Leave":
			leaveBalance=manager.getAdoptionLeave()-leave.getDaycount();
			manager.setAdoptionLeave(leaveBalance);
			break;
		default:;
			}
		System.out.println("Inside Manage Service approve function :"+leaveBalance);
	leave.setStatus("Approved");
	}
	
}
