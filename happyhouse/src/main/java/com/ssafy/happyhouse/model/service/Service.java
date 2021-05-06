package com.ssafy.happyhouse.model.service;
import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.ApartDto;



public interface Service {
	public List<ApartDto> listApart(String key, String word) throws Exception;
	public List<ApartDto> rankHigh() throws SQLException;
	public List<ApartDto> rankLow() throws SQLException;
	public List<ApartDto> searchByMyBudget() throws SQLException;
	public List<ApartDto> dongDealAvg(String dong) throws SQLException;
}
