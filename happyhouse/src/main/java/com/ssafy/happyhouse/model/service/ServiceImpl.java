package com.ssafy.happyhouse.model.service;
import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.ApartDto;
import com.ssafy.happyhouse.model.mapper.Dao;
import com.ssafy.happyhouse.model.mapper.DaoImpl;


public class ServiceImpl implements Service{
	private Dao apartDao;
	
	public ServiceImpl() {
		apartDao = new DaoImpl();
	}
	
	@Override
	public List<ApartDto> listApart(String key, String word) throws Exception {
		key = key == null ? "" : key;
		word = word == null ? "" : word;
		return apartDao.listApart(key, word);
	}

	@Override
	public List<ApartDto> rankHigh() throws SQLException {
		return apartDao.rankHigh();
	}

	@Override
	public List<ApartDto> rankLow() throws SQLException {
		return apartDao.rankLow();
	}

	@Override
	public List<ApartDto> searchByMyBudget() throws SQLException {
		return apartDao.searchByMyBudget();
	}

	@Override
	public List<ApartDto> dongDealAvg(String dong) throws SQLException {
		return null;
	}

}
