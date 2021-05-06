package com.ssafy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.dto.ApartDto;
import com.ssafy.dto.InterestingDto;
import com.ssafy.util.DBUtil;

public class InterestingDaoImpl implements InterestingDao{
	
	
	@Override
	public List<InterestingDto> listInterestingApart() throws SQLException{
		// 관심지역에 있는 동과 일치하는 곳만 housedeal 리스트 보여줌.
		List<InterestingDto> list = new ArrayList<InterestingDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnect();
			StringBuilder sql = new StringBuilder();
			sql.append("select housedeal.no, housedeal.dong, housedeal.aptname,INTERESTAREA.interesting \n");
			sql.append("from housedeal,INTERESTAREA \n");
			sql.append("where INTERESTAREA.no=housedeal.no \n");
			sql.append("order by INTERESTAREA.interesting desc \n");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				InterestingDto interestingDto = new InterestingDto();
				interestingDto.setNo(rs.getInt("no"));
				interestingDto.setDong(rs.getString("dong"));
				interestingDto.setAptName(rs.getString("AptName"));
				interestingDto.setInteresting(rs.getInt("interesting"));
				list.add(interestingDto);
			}
		} finally {
			DBUtil.close(rs, pstmt, conn);
		}
		
		return list;
	}

	/*
	 * @Override public void insertArea(InterestingDto dto) throws SQLException {
	 * InterestingDto interestDto = null;
	 * 
	 * Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * try { conn = DBUtil.getConnect(); String sql = "";
	 * sql+="INSERT INTO interestarea (code, dong) VALUES (?, ?)"; pstmt =
	 * conn.prepareStatement(sql); pstmt.setString(1, dto.getCode());
	 * pstmt.setString(2, dto.getDong()); System.out.println( dto.getCode());
	 * System.out.println( dto.getDong()); System.out.println(pstmt);
	 * pstmt.executeUpdate(); //rs = pstmt.executeQuery();
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); interestDto = null; } finally
	 * { DBUtil.close(rs, pstmt, conn); }
	 * 
	 * }
	 */
}
