package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer > {
	Employee findByEmailAndPassword(String email, String password);
	Employee findByUsername(String username);
	Employee findByEmail(String email);
	Employee findById(int id);
	List<Employee> findAllByStatus(String status);
	List<Employee> findAllByReportingPersonAndStatus(String reportingPerson,String status);
	
	
}
