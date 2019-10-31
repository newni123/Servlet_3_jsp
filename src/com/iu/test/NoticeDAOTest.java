package com.iu.test;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import java.sql.Connection;

import org.junit.Test;

import com.iu.notice.NoticeDAO;
import com.iu.notice.NoticeDTO;
import com.iu.point.PointDAO;
import com.iu.util.DBConnector;

public class NoticeDAOTest {
	@Test
	public void deleteTest() throws Exception{
		Connection conn = DBConnector.getConnection();
		NoticeDAO noticeDAO = new NoticeDAO();
		int result = noticeDAO.noticeDelete(conn, 11);
		assertEquals(result, 1);
	}
	//@Test
	public void updateTest() throws Exception{
		Connection conn = DBConnector.getConnection();
		NoticeDAO noticeDAO = new NoticeDAO();
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNum(2);
		noticeDTO.setTitle("Test2_2");
		noticeDTO.setWriter("Writer2_2");
		noticeDTO.setContents("Content2_2");
		int result = noticeDAO.noticeUpdate(conn, noticeDTO);
		assertEquals(result, 1);
	}
	
	//@Test
	public void selectOneTest() throws Exception{
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection conn = DBConnector.getConnection();
		NoticeDTO noticeDTO = noticeDAO.noticeSelect(conn, 1);
		assertNull(noticeDTO);
		conn.close();
	}
	
	//@Test
	public void test() throws Exception {
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection conn = DBConnector.getConnection();
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setTitle("Test6");
		noticeDTO.setWriter("Writer6");
		noticeDTO.setContents("Content6");
		noticeDAO.noticeWrite(conn, noticeDTO);
	}

}
