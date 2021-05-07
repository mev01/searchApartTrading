package com.ssafy.happyhouse.controller;


import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.model.service.ApartService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ApartService apartservice;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		try {
			model.addAttribute("cityList", apartservice.getCityList());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "index";
	}
	
}
