package com.example.demo.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@DynamicUpdate
@Table(name="holidays_lms")
public class Holidays {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
	private int adminId;
	private String hDayName;
	private Date startHDate;
	private String  hDayDesc;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String gethDayName() {
		return hDayName;
	}
	public void sethDayName(String hDayName) {
		this.hDayName = hDayName;
	}
	
	public Date getStartHDate() {
		return startHDate;
	}
	public void setStartHDate(Date startHDate) {
		this.startHDate = startHDate;
	}
	public String gethDayDesc() {
		return hDayDesc;
	}
	public void sethDayDesc(String hDayDesc) {
		this.hDayDesc = hDayDesc;
	}
	@Override
	public String toString() {
		return "Holidays [id=" + id + ", adminId=" + adminId + ", hDayName=" + hDayName + ", startHDate=" + startHDate
				+ ", hDayDesc=" + hDayDesc + "]";
	}
	
	
	
	
}