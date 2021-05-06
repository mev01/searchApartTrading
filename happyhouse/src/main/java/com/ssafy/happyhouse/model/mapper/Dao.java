package com.ssafy.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.dto.ApartDto;


public interface Dao {
	public List<ApartDto> listApart(String key, String word) throws SQLException;
	public List<ApartDto> rankHigh() throws SQLException;
	public List<ApartDto> rankLow() throws SQLException;
	public List<ApartDto> searchByMyBudget() throws SQLException;
	public List<ApartDto> dongDealAvg(String dong) throws SQLException;
}
