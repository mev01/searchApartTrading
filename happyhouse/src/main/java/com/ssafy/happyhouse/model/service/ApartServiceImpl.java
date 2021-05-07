package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.ApartDto;
import com.ssafy.happyhouse.model.BaseAddress;
import com.ssafy.happyhouse.model.HouseDeal;
import com.ssafy.happyhouse.model.HousePageBean;
import com.ssafy.happyhouse.model.mapper.ApartMapper;
import com.ssafy.happyhouse.model.mapper.UserMapper;

@Service
public class ApartServiceImpl implements ApartService {
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ApartDto> listApart(String key, String word) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ApartDto> rankHigh() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ApartDto> rankLow() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ApartDto> searchByMyBudget() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ApartDto> dongDealAvg(String dong) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HouseDeal> searchAll(HousePageBean Bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HouseDeal serach(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getCityList() throws SQLException {
		return sqlSession.getMapper(ApartMapper.class).selectCity();
	}

	@Override
	public List<String> getGuList(String city) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getDongList(String gu) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HouseDeal> searchArea(String gu, String dong) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseAddress searchDong(String gu, String dong) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
