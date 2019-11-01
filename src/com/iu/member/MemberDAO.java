package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	public int memberDelete(Connection conn,String id) throws Exception{
		int result = 0;
		String sql = "delete member where id = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, id);
		result = st.executeUpdate();
		st.close();
		return result;
	}
	
	public int memberUpdate(Connection conn, MemberDTO memberDTO) throws Exception{
		String sql = "update member set pw = ? , name = ?, email = ?, phone=? where id = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, memberDTO.getPw());
		st.setString(2, memberDTO.getName());
		st.setString(3, memberDTO.getEmail());
		st.setString(4, memberDTO.getPhone());
		st.setString(5, memberDTO.getId());
		int result = st.executeUpdate();
		st.close();
		return result;
	}
	
	public MemberDTO memberLogin(Connection conn,MemberDTO memberDTO) throws Exception {
		String sql = "select * from member where id = ? and pw = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			memberDTO.setName(rs.getString("name"));
			memberDTO.setEmail(rs.getString("email"));
			memberDTO.setPhone(rs.getString("phone"));
			memberDTO.setGrade(rs.getInt("grade"));
		}
		else
		{
			memberDTO = null;
		}
		rs.close();
		st.close();
		return memberDTO;
	}

	public int memberJoin(Connection con, MemberDTO memberDTO) throws Exception{
		
		String sql = "insert into member "
				+ "values(?,?,?,?,?,3)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getPhone());
		
		
		int result = st.executeUpdate();
		
		return result;
	}
}