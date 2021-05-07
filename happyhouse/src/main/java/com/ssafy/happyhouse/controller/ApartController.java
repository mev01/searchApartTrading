package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.BaseAddress;
import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.service.ApartService;


@Controller
@RequestMapping("/apart")
public class ApartController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private ApartService apartservice;
	
	@GetMapping("/list")
	public String list() {
		return "houseinfo/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/city", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public List<String> getCity(Model model) {
		try {
			return apartservice.getCityList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/{city}", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public List<String> getGu(@PathVariable String city, Model model) {
		try {
			return apartservice.getGuList(city);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/{city}/{gu}", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public List<String> getDong(@PathVariable String city, @PathVariable String gu, Model model) {
		try {
			return apartservice.getDongList(gu);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/{city}/{gu}/{dong}", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public BaseAddress getAdd(@PathVariable String city, @PathVariable String gu, @PathVariable String dong, Model model) {
		try {
			model.addAttribute("city", city);
			model.addAttribute("gu", gu);
			model.addAttribute("dong", dong);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("gu", gu);
			map.put("dong", dong);
			
			System.out.println(apartservice.searchDong(map).toString());
			return apartservice.searchDong(map);
//			map.put("dongcode", add.getDongcode());
//			
//			model.addAttribute("baseAddress", add);
//			model.addAttribute("houseDealList", apartservice.searchArea(map));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/list/{dongcode}/{dong}", method = RequestMethod.GET, headers = { "Content-type=application/json" })
	public List<HouseDeal> getApart(@PathVariable String dongcode, @PathVariable String dong, Model model) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("dongcode", dongcode);
			map.put("dong", dong);
			
			return apartservice.searchArea(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
