package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name="projects_lms")
@DynamicUpdate
public class Project {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String projectName;
	private String strDate;
	private String ndDate;
	private String projectTeam;
	private String projectManager;
	private String projectDesc;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getStrDate() {
		return strDate;
	}
	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}
	public String getNdDate() {
		return ndDate;
	}
	public void setNdDate(String ndDate) {
		this.ndDate = ndDate;
	}
	public String getProjectTeam() {
		return projectTeam;
	}
	public void setProjectTeam(String projectTeam) {
		this.projectTeam = projectTeam;
	}
	public String getProjectManager() {
		return projectManager;
	}
	public void setProjectManager(String projectManager) {
		this.projectManager = projectManager;
	}
	public String getProjectDesc() {
		return projectDesc;
	}
	public void setProjectDesc(String projectDesc) {
		this.projectDesc = projectDesc;
	}
	@Override
	public String toString() {
		return "Project [id=" + id + ", projectName=" + projectName + ", strDate=" + strDate + ", ndDate=" + ndDate
				+ ", projectTeam=" + projectTeam + ", projectManager=" + projectManager + ", projectDesc=" + projectDesc
				+ "]";
	}
	

}
