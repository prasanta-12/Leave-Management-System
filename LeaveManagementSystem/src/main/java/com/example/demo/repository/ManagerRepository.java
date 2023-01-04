package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Manager;

public interface ManagerRepository extends JpaRepository<Manager, Integer>{
	Manager findByEmailAndPassword(String email, String password);
	Manager findById(int id);
	Manager findByEmail(String email);
	List<Manager> findAllByStatus(String status);

}
