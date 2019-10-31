package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoticeDAO {
	
	// 이전글 받아오기
	public NoticeDTO noticeSelectPrev(Connection conn, int num) throws Exception {
		String sql = "select * from notice where num = (select max(num) from notice where num < ?)";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		NoticeDTO noticeDTO = null;
		if (rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("Reg_date"));
			noticeDTO.setHit(rs.getInt("Hit"));
		}
		rs.close();
		st.close();
		return noticeDTO;
	}
	// 다음글 받아오기
	public NoticeDTO noticeSelectNext(Connection conn, int num) throws Exception {
		String sql = "select * from notice where num = (select min(num) from notice where num > ?)";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		NoticeDTO noticeDTO = null;
		if (rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("Reg_date"));
			noticeDTO.setHit(rs.getInt("Hit"));
		}
		rs.close();
		st.close();
		return noticeDTO;
	}

	// 마지막 글 글번호 가져오기
	public int listCount(Connection conn) throws Exception {
		int result = 0;
		String sql = "select max(num) from notice";
		PreparedStatement st = conn.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		if (rs.next()) {
			result = rs.getInt("max(num)");
		}
		return result;
	}

	// 처음 글 글번호 가져오기
	public int firstSelect(Connection conn) throws Exception {
		int result = 0;
		String sql = "select min(num) from notice";
		PreparedStatement st = conn.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		if (rs.next()) {
			result = rs.getInt("min(num)");
		}
		return result;
	}

	// noticeDelete
	public int noticeDelete(Connection conn, int num) throws Exception {
		String sql = "delete notice where num = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		int result = st.executeUpdate();
		st.close();
		return result;
	}

	// List
	public ArrayList<NoticeDTO> noticeList(Connection conn) throws Exception {
		ArrayList<NoticeDTO> noticeDTOs = new ArrayList<NoticeDTO>();
		String sql = "select * from notice order by num desc";
		PreparedStatement st = conn.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("Hit"));
			noticeDTOs.add(noticeDTO);
		}
		rs.close();
		conn.close();
		return noticeDTOs;
	}

	// Insert
	public int noticeWrite(Connection conn, NoticeDTO noticeDTO) throws Exception {
		String sql = "insert into notice values(notice_seq.nextval,?,?,?,sysdate,?)";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getWriter());
		st.setString(3, noticeDTO.getContents());
		st.setInt(4, noticeDTO.getHit());
		int result = st.executeUpdate();
		st.close();
		return result;
	}

	// Notice Select
	public NoticeDTO noticeSelect(Connection conn, int num) throws Exception {
		String sql = "select * from notice where num = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		NoticeDTO noticeDTO = null;
		if (rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("Reg_date"));
			noticeDTO.setHit(rs.getInt("Hit"));
		}
		rs.close();
		st.close();
		return noticeDTO;
	}

	// Update
	public int noticeUpdate(Connection conn, NoticeDTO noticeDTO) throws Exception {
		int result = 0;
		String sql = "update notice set title = ?, writer = ?, contents = ? where num = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getWriter());
		st.setString(3, noticeDTO.getContents());
		st.setInt(4, noticeDTO.getNum());
		result = st.executeUpdate();
		st.close();
		return result;
	}
}
