package com.ssafy.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.dto.ApartDto;
import com.ssafy.dto.InterestingDto;



public interface InterestingDao {
	public List<InterestingDto> listInterestingApart() throws SQLException;
	//public void insertArea(InterestingDto interestDto) throws SQLException;
}
