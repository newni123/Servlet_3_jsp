package com.iu.test;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.iu.member.MemberDAO;
import com.iu.member.MemberDTO;
import com.iu.util.DBConnector;

public class MemberDAOTest {
	@Test
	public void memberDeleteTest() throws Exception{
		Connection conn = DBConnector.getConnection();
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.memberDelete(conn, "daze1234");
		conn.close();
		assertEquals(1, result);
	}
	//@Test
	public void memberUpdateTest() throws Exception{
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("daze123");
		memberDTO.setPw("1234");
		memberDTO.setEmail("email");
		memberDTO.setName("name");
		memberDTO.setPhone("phone");
		Connection conn = DBConnector.getConnection();
		MemberDAO memberDAO = new MemberDAO();
		int result = memberDAO.memberUpdate(conn, memberDTO);
		conn.close();
		assertEquals(1, result);
	}
	//@Test
	public void loginTest() throws Exception{
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("daze123");
		memberDTO.setPw("1");
		MemberDAO memberDAO = new MemberDAO();
		Connection conn = DBConnector.getConnection();
		memberDTO = memberDAO.memberLogin(conn, memberDTO);
		assertNotNull(memberDTO);
	}

}
