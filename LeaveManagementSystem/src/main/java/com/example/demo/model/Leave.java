package com.example.demo.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name="leave_lms")
@DynamicUpdate
public class Leave {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int empId;
	private int daycount;
	private String empName;
	private String empEmail;	
	private String role;
	private String reportingPerson;
	private String leaveType;
	private Date sdate;
	private Date edate;
	private String status;
	private String reason;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public int getDaycount() {
		return daycount;
	}
	public void setDaycount(int daycount) {
		this.daycount = daycount;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getReportingPerson() {
		return reportingPerson;
	}
	public void setReportingPerson(String reportingPerson) {
		this.reportingPerson = reportingPerson;
	}
	public String getLeaveType() {
		return leaveType;
	}
	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}
	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	@Override
	public String toString() {
		return "Leave [id=" + id + ", empId=" + empId + ", daycount=" + daycount + ", empName=" + empName
				+ ", empEmail=" + empEmail + ", role=" + role + ", reportingPerson=" + reportingPerson + ", leaveType="
				+ leaveType + ", sdate=" + sdate + ", edate=" + edate + ", status=" + status + ", reason=" + reason
				+ "]";
	}
	
	
	
	
	
}
