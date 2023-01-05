package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@DynamicUpdate
@Table(name="manager_lms")
public class Manager {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    private int id;	
	private String  fullname ;	
	private String email ;	
	private String username;
	private String password ;	
	private String contact;	
	private String designation ;	
	private String  role;		
	private String reportingPerson ;	
	private String status ;	
	private String dob ;	
	private String  doj;	
	private String  address;
	private int sickLeave;
	private int casualLeave;
	private int personalLeave;
	private int maternityLeave;
	private int paternityLeave;
	private int marriageLeave;
	private int adoptionLeave;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getSickLeave() {
		return sickLeave;
	}
	public void setSickLeave(int sickLeave) {
		this.sickLeave = sickLeave;
	}
	public int getCasualLeave() {
		return casualLeave;
	}
	public void setCasualLeave(int casualLeave) {
		this.casualLeave = casualLeave;
	}
	public int getPersonalLeave() {
		return personalLeave;
	}
	public void setPersonalLeave(int personalLeave) {
		this.personalLeave = personalLeave;
	}
	public int getMaternityLeave() {
		return maternityLeave;
	}
	public void setMaternityLeave(int maternityLeave) {
		this.maternityLeave = maternityLeave;
	}
	public int getPaternityLeave() {
		return paternityLeave;
	}
	public void setPaternityLeave(int paternityLeave) {
		this.paternityLeave = paternityLeave;
	}
	public int getMarriageLeave() {
		return marriageLeave;
	}
	public void setMarriageLeave(int marriageLeave) {
		this.marriageLeave = marriageLeave;
	}
	public int getAdoptionLeave() {
		return adoptionLeave;
	}
	public void setAdoptionLeave(int adoptionLeave) {
		this.adoptionLeave = adoptionLeave;
	}
	@Override
	public String toString() {
		return "Manager [id=" + id + ", fullname=" + fullname + ", email=" + email + ", username=" + username
				+ ", password=" + password + ", contact=" + contact + ", designation=" + designation + ", role=" + role
				+ ", reportingPerson=" + reportingPerson + ", status=" + status + ", dob=" + dob + ", doj=" + doj
				+ ", address=" + address + ", sickLeave=" + sickLeave + ", casualLeave=" + casualLeave
				+ ", personalLeave=" + personalLeave + ", maternityLeave=" + maternityLeave + ", paternityLeave="
				+ paternityLeave + ", marriageLeave=" + marriageLeave + ", adoptionLeave=" + adoptionLeave + "]";
	}
	
}
