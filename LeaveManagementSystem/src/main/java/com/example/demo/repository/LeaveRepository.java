package com.example.demo.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Leave;

public interface LeaveRepository extends JpaRepository<Leave, Integer> {

	List<Leave> findAllByEmpId(int empId);
	Leave findById(int id);
	
	List<Leave> findAllByReportingPerson(String reportingPerson);
	
}
