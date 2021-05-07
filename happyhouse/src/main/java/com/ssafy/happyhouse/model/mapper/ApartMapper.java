package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.BaseAddress;
import com.ssafy.happyhouse.model.HouseDeal;

public interface ApartMapper {
	List<HouseDeal> selectHouseDeal(Map<String, Object> map) throws SQLException;
	BaseAddress selectBaseAddress(Map<String, Object> map) throws SQLException;
	HouseDeal search(int no);
	
	List<String> selectDong(String gu) throws SQLException;
	List<String> selectGu(String city) throws SQLException;
	List<String> selectCity() throws SQLException;
}
