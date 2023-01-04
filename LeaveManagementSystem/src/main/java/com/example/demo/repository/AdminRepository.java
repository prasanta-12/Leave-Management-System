package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Admin;

public interface AdminRepository extends JpaRepository<Admin, Integer>{

	Admin findByEmailAndPassword(String email, String password);
	Admin findById(int id);
	Admin findByEmail(String email);
}
