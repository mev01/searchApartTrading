package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.ApartDto;
import com.ssafy.happyhouse.model.BaseAddress;
import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.HousePageBean;

public interface ApartService {
	// past service
	public List<ApartDto> listApart(String key, String word) throws Exception;
	public List<ApartDto> rankHigh() throws SQLException;
	public List<ApartDto> rankLow() throws SQLException;
	public List<ApartDto> searchByMyBudget() throws SQLException;
	public List<ApartDto> dongDealAvg(String dong) throws SQLException;
	
	// add service
	List<HouseDeal> searchAll(HousePageBean Bean);
	HouseDeal serach(int no);
	List<String> getCityList() throws SQLException;
	List<String> getGuList(String city) throws SQLException;
	List<String> getDongList(String gu) throws SQLException;
	List<HouseDeal> searchArea(String gu, String dong) throws SQLException;
	BaseAddress searchDong(String gu, String dong) throws SQLException;
}
