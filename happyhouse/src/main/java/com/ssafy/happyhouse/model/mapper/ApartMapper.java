package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.BaseAddress;
import com.ssafy.happyhouse.model.HouseDeal;

public interface ApartMapper {
	List<HouseDeal> selectHouseDeal(String gu, String dong) throws SQLException;
	BaseAddress selectBaseAddress(String gu, String dong) throws SQLException;
	HouseDeal search(int no);
	
	List<String> selectDong(String gu) throws SQLException;
	List<String> selectGu(String city) throws SQLException;
	List<String> selectCity() throws SQLException;
}
