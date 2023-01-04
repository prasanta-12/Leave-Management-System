package com.example.demo.repository;

import java.sql.Date;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Holidays;


public interface HolidayRepository extends JpaRepository<Holidays, Integer>{

	Holidays findByStartHDate(Date startHDate);
}
