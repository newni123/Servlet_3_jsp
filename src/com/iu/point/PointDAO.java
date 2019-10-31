package com.iu.point;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class PointDAO {

	//update
	public int update(Connection conn,PointDTO pointDTO) throws Exception{
		int result = 0;
		String sql = "update point set name = ?, kor = ?, eng = ?, mat = ?, total = ?, avg = ? where num = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1,pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMat());
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAvg());
		st.setInt(7, pointDTO.getNum());
		result = st.executeUpdate();
		st.close();
		return result;
	}
	// selectList
	public ArrayList<PointDTO> selectList(Connection conn) throws Exception {
		ArrayList<PointDTO> pointDTOs = new ArrayList<PointDTO>();
		String sql = "select * from point order by num desc";
		PreparedStatement st = conn.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			PointDTO pointDTO = new PointDTO();
			pointDTO.setNum(rs.getInt("num"));
			pointDTO.setName(rs.getString("name"));
			pointDTO.setKor(rs.getInt("kor"));
			pointDTO.setEng(rs.getInt("eng"));
			pointDTO.setMat(rs.getInt("mat"));
			pointDTO.setTotal(rs.getInt("total"));
			pointDTO.setAvg(rs.getDouble("avg"));
			pointDTOs.add(pointDTO);
		}
		rs.close();
		st.close();
		
		return pointDTOs;
	}
	
	
	// insert
	public int insert(Connection conn,PointDTO pointDTO) throws Exception {
		int result = 0;
		String sql = "insert into point values(point_seq.nextval,?,?,?,?,?,?)";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMat());
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAvg());
		result = st.executeUpdate();
		st.close();
		return result;
		
	}
	// delete
	public int delete(Connection conn,int num) throws Exception {
		int result = 0;
		String sql = "delete point where num = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1,num);
		result = st.executeUpdate();
		st.close();
		return result;
	}
	// selectOne
	public PointDTO selectOne(Connection conn,int num) throws Exception{
		String sql = "select * from point where num = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		PointDTO pointDTO = null;
		if(rs.next()) {
			pointDTO = new PointDTO();
			pointDTO.setNum(rs.getInt("num"));
			pointDTO.setName(rs.getString("name"));
			pointDTO.setKor(rs.getInt("kor"));
			pointDTO.setEng(rs.getInt("eng"));
			pointDTO.setMat(rs.getInt("mat"));
			pointDTO.setTotal(rs.getInt("total"));
			pointDTO.setAvg(rs.getDouble("avg"));
		}
		rs.close();
		st.close();
		return pointDTO;
	}
	
}
