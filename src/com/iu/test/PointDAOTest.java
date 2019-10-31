package com.iu.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Random;

import org.junit.Test;

import com.iu.point.PointDAO;
import com.iu.point.PointDTO;
import com.iu.util.DBConnector;

public class PointDAOTest {
	@Test
	public void updateTest() throws Exception{
		PointDTO pointDTO = new PointDTO();
		Connection conn = DBConnector.getConnection();
		pointDTO.setNum(28);
		pointDTO.setName("Suji");
		pointDTO.setKor(20);
		pointDTO.setEng(20);
		pointDTO.setMat(20);
		pointDTO.setTotal(60);
		pointDTO.setAvg(20.0);
		PointDAO pointDAO = new PointDAO();
		int result = pointDAO.update(conn, pointDTO);
		
		assertEquals(1,result);
		conn.close();
	}
	//@Test
	public void insertTest() throws Exception{
		PointDAO pointDAO = new PointDAO();
		Connection conn = DBConnector.getConnection();
		for(int i = 0 ; i < 10; i++) {
			Random rs = new Random();
			PointDTO pointDTO = new PointDTO();
			pointDTO.setName("name" + i);
			pointDTO.setKor(rs.nextInt(101));
			pointDTO.setEng(rs.nextInt(101));
			pointDTO.setMat(rs.nextInt(101));
			pointDTO.setTotal(pointDTO.getKor()+pointDTO.getEng()+pointDTO.getMat());
			pointDTO.setAvg(pointDTO.getTotal()/3.0);
			pointDAO.insert(conn, pointDTO);
			Thread.sleep(500);
		}
		conn.close();
	}
	
	//@Test
	public void selectList() throws Exception{
		PointDAO pointDAO = new PointDAO();
		Connection conn = DBConnector.getConnection();
		ArrayList<PointDTO> pointDTOs = pointDAO.selectList(conn);
		assertNotEquals(0,pointDTOs.size());
		conn.close();
	}
	
	//@Test
	public void selectOneTest() throws Exception{
		PointDAO pointDAO = new PointDAO();
		Connection conn = DBConnector.getConnection();
		PointDTO pointDTO = pointDAO.selectOne(conn, 3);
		assertNull(pointDTO);
		conn.close();
	}
	//@Test
	public void test2() throws Exception{
		Connection conn = DBConnector.getConnection();
		assertNotNull(conn);
		conn.close();
	}
	//@Test // 테스트하기 싫은건 어노테이션을 주석처리 
	public void test() throws Exception {
		PointDAO pointDAO = new PointDAO();
		Connection conn = DBConnector.getConnection();
		int result = pointDAO.delete(conn, 2121);
		// 단정문
		assertEquals(1,result);
		conn.close();
	}
}
