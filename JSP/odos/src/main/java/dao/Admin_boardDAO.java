package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Admin_boardDTO;

public class Admin_boardDAO {

	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;

	public Admin_boardDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/odos");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

//	public ArrayList<Admin_boardDTO> list(int a_type, int first, int limit){
	public ArrayList<Admin_boardDTO> list(int a_type){
		ArrayList<Admin_boardDTO> res = new ArrayList<Admin_boardDTO>();

//		sql = "select * from admin_board where a_type = ? order by a_fix desc, a_index desc, a_index limit ?,?";
		sql = "select * from admin_board where a_type = ? order by a_fix desc, a_index desc";

		try {
			ptmt = con.prepareStatement(sql);

			ptmt.setInt(1, a_type);
//			ptmt.setInt(2, first);
//			ptmt.setInt(3, limit);

			rs = ptmt.executeQuery();

			while(rs.next()) {
				Admin_boardDTO dto = new Admin_boardDTO();

				dto.setA_index(rs.getInt("a_index"));
				dto.setA_type(rs.getInt("a_type"));
				dto.setA_cnt(rs.getInt("a_cnt"));
				dto.setA_title(rs.getString("a_title"));
				dto.setA_content(rs.getString("a_content"));
				dto.setA_file(rs.getString("a_file"));
				dto.setA_fix(rs.getString("a_fix"));
				dto.setA_date(rs.getTimestamp("a_date"));

				res.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}

	// 조회수 늘리기
	public int addCnt(int a_index) {
		int res = 0;
		
		sql = "update admin_board set a_cnt = a_cnt + 1 where a_index = ?";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, a_index);
			res = ptmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	public Admin_boardDTO detail(int a_index) {

		Admin_boardDTO res = null;

		sql = "select * from admin_board where a_index = ?";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, a_index);
			rs = ptmt.executeQuery();

			if(rs.next()) {
				res = new Admin_boardDTO();

				res.setA_index(rs.getInt("a_index"));
				res.setA_type(rs.getInt("a_type"));
				res.setA_cnt(rs.getInt("a_cnt"));
				res.setA_title(rs.getString("a_title"));
				res.setA_content(rs.getString("a_content"));
				res.setA_file(rs.getString("a_file"));
				res.setA_date(rs.getTimestamp("a_date"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return res;

	}

	// a_type만 데려온다
	public int chgType(int a_type) {

		try {
			sql = "select * from admin_board where a_type = ?";

			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, a_type);
			rs = ptmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}


	public int insert(Admin_boardDTO dto) {
		
		int res = 0;
		try {
			sql = "show table status where name = 'admin_board'";
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt("auto_increment");
			}

			sql = "insert into admin_board (a_type, a_title, a_content, a_file, a_fix) "
					+ "values(?, ?, ?, ?, ?)";

			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, dto.getA_type());
			ptmt.setString(2, dto.getA_title());
			ptmt.setString(3, dto.getA_content());
			ptmt.setString(4, dto.getA_file());
			ptmt.setString(5, dto.getA_fix());
			// ptmt.setString(5, dto.getA_fix());

			rs = ptmt.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}

	public int total(int a_type){

		sql = "select count(*) from admin_board where a_type = ?";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, a_type);
			rs = ptmt.executeQuery();

			rs.next();
			return rs.getInt(1);	
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close();
		}

		return 0;
	}

	// 08-16
	public int delete(Admin_boardDTO dto) {

		try {
			sql = "delete from admin_board where a_index = ?";

			ptmt = con.prepareStatement(sql);

			ptmt.setInt(1, dto.getA_index());

			return ptmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return 0;
	}

	//08-17
	public int fileDelete(Admin_boardDTO dto) {
		int res = 0;
		try {		
			// upfile의 내용을 null로 바꿈
			sql = "update admin_board set a_file = null where a_index = ?";

			ptmt =con.prepareStatement(sql);
			ptmt.setInt(1, dto.getA_index());
			res = ptmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}

		return res;
	}


	public int modify(Admin_boardDTO dto) {
		try {

			sql = "update admin_board set a_title = ?, a_type = ?, a_fix = ?, a_file = ?, a_content = ? where a_index = ?";

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getA_title());
			ptmt.setInt(2, dto.getA_type());
			ptmt.setString(3, dto.getA_fix());
			ptmt.setString(4, dto.getA_file());
			ptmt.setString(5, dto.getA_content());
			ptmt.setInt(6, dto.getA_index());
			return ptmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return 0;
	}
	
	
	public ArrayList<Admin_boardDTO> Banner(){
		ArrayList<Admin_boardDTO> res = new ArrayList<Admin_boardDTO>();

		sql = "select * from admin_board where a_type = 1 and a_fix = 'y'";

		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();

			while(rs.next()) {
				Admin_boardDTO dto = new Admin_boardDTO();

				dto.setA_index(rs.getInt("a_index"));
				dto.setA_title(rs.getString("a_title"));
				dto.setA_content(rs.getString("a_content"));
				dto.setA_file(rs.getString("a_file"));

				res.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}

	public void close() {
		if(rs!=null) try { rs.close();} catch (SQLException e) {}
		if(ptmt!=null) try { ptmt.close();} catch (SQLException e) {}
		if(con!=null) try { con.close();} catch (SQLException e) {}
	}

}
