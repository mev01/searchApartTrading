package com.ssafy.happyhouse.controller;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.service.ApartService;


@Controller
@RequestMapping("/apart")
public class ApartController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private ApartService apartservice;
	
	@GetMapping("/select/{city}")
	public String getGu(@PathVariable String city, Model model) {
		try {
			model.addAttribute("city", city);
			
			model.addAttribute("guList", apartservice.getGuList(city));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "user/login";
	}
	
	@GetMapping("/select/{city}/{gu}")
	public String getDong(@PathVariable String city, @PathVariable String gu, Model model) {
		try {
			model.addAttribute("city", city);
			model.addAttribute("gu", gu);
			
			model.addAttribute("dongList", apartservice.getDongList(gu));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "user/login";
	}
	
	@GetMapping("/select/{city}/{gu}/{dong}")
	public String select(@PathVariable String city, @PathVariable String gu, @PathVariable String dong, Model model) {
		try {
			model.addAttribute("city", city);
			model.addAttribute("gu", gu);
			model.addAttribute("city", city);
			
			model.addAttribute("baseAddress", apartservice.searchDong(gu, dong));
			model.addAttribute("houseDealList", apartservice.searchArea(gu, dong));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "user/login";
	}
	
	
}
