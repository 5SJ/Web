package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.User_inquiryDTO;

public class User_inquiryDAO {


	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;

	public User_inquiryDAO() {
		Context init;
		try {
			init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/odos");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<User_inquiryDTO> listAll() {
		ArrayList<User_inquiryDTO> res = new ArrayList<User_inquiryDTO>();

		try {
			sql = "select * from user_inquiry order by u_date desc";

			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();

			while(rs.next()) {
				User_inquiryDTO dto = new User_inquiryDTO();

				dto.setU_id(rs.getString("u_id"));
				dto.setU_index(rs.getInt("u_index"));
				dto.setU_state(rs.getInt("u_state"));
				dto.setU_type(rs.getInt("u_type"));
				dto.setU_title(rs.getString("u_title"));
				dto.setU_content(rs.getString("u_content"));
				dto.setU_date(rs.getTimestamp("u_date"));
				dto.setU_file(rs.getString("u_file"));
				dto.setU_recontent(rs.getString("u_recontent"));
				dto.setU_redate(rs.getTimestamp("u_redate"));

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
	
	public ArrayList<User_inquiryDTO> listFilter(int u_type){
		ArrayList<User_inquiryDTO> res = new ArrayList<User_inquiryDTO>();
		try {
			sql = "select * from user_inquiry where u_type = ? order by u_date desc";

			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, u_type);
			rs = ptmt.executeQuery();

			while(rs.next()) {
				/* sql = "select * from user_inquiry where u_id = ?"; */

				User_inquiryDTO dto = new User_inquiryDTO();

				dto.setU_id(rs.getString("u_id"));
				dto.setU_index(rs.getInt("u_index"));
				dto.setU_state(rs.getInt("u_state"));
				dto.setU_type(rs.getInt("u_type"));
				dto.setU_title(rs.getString("u_title"));
				dto.setU_content(rs.getString("u_content"));
				dto.setU_date(rs.getTimestamp("u_date"));
				dto.setU_file(rs.getString("u_file"));
				dto.setU_recontent(rs.getString("u_recontent"));
				dto.setU_redate(rs.getTimestamp("u_redate"));

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

	public ArrayList<User_inquiryDTO> list(String u_id){
		ArrayList<User_inquiryDTO> res = new ArrayList<User_inquiryDTO>();

		try {
			sql = "select * from user_inquiry where u_id = ? order by u_date desc";

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, u_id);
			rs = ptmt.executeQuery();

			while(rs.next()) {
				/* sql = "select * from user_inquiry where u_id = ?"; */

				User_inquiryDTO dto = new User_inquiryDTO();

				dto.setU_id(rs.getString("u_id"));
				dto.setU_index(rs.getInt("u_index"));
				dto.setU_state(rs.getInt("u_state"));
				dto.setU_type(rs.getInt("u_type"));
				dto.setU_title(rs.getString("u_title"));
				dto.setU_content(rs.getString("u_content"));
				dto.setU_date(rs.getTimestamp("u_date"));
				dto.setU_file(rs.getString("u_file"));
				dto.setU_recontent(rs.getString("u_recontent"));
				dto.setU_redate(rs.getTimestamp("u_redate"));

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

	public User_inquiryDTO detail(int u_index) {

		User_inquiryDTO res = null;

		sql = "select * from user_inquiry where u_index = ?";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, u_index);
			rs = ptmt.executeQuery();

			if(rs.next()) {

				res = new User_inquiryDTO();

				res.setU_index(rs.getInt("u_index"));
				res.setU_id(rs.getString("u_id"));
				res.setU_state(rs.getInt("u_state"));
				res.setU_title(rs.getString("u_title"));
				res.setU_date(rs.getTimestamp("u_date"));
				res.setU_content(rs.getString("u_content"));
				res.setU_file(rs.getString("u_file"));
				res.setU_recontent(rs.getString("u_recontent"));
				res.setU_redate(rs.getTimestamp("u_redate"));
				res.setU_type(rs.getInt("u_type"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}

	public int insert(User_inquiryDTO dto) {

		int res = 0;
		try {
			sql = "SHOW TABLE STATUS WHERE NAME = 'USER_INQUIRY'";
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();

			if(rs.next()) {
				res = rs.getInt("auto_increment");
			}

			sql = "insert into user_inquiry (u_index, u_type, u_title, u_id, u_content, u_file) "
					+ "values(?, ?, ?, ?, ?, ?)";

			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, dto.getU_index());
			ptmt.setInt(2, dto.getU_type());
			ptmt.setString(3, dto.getU_title());
			ptmt.setString(4, dto.getU_id());
			ptmt.setString(5, dto.getU_content());
			ptmt.setString(6, dto.getU_file());

			rs = ptmt.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}

	public int total(String u_id) {

		sql = "select count(*) from user_inquiry where u_id = ?";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, u_id);
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

	public int delete(User_inquiryDTO dto) {

		try {
			sql = "delete from user_inquiry where u_index = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, dto.getU_index());
			
			return ptmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return 0;
	}

	public int modify(User_inquiryDTO dto) {
		try {

			sql = "update user_inquiry set u_title = ?, u_type = ?, u_id=?, u_file = ?, u_content = ? where u_index = ?";

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getU_title());
			ptmt.setInt(2, dto.getU_type());
			ptmt.setString(3, dto.getU_id());
			ptmt.setString(4, dto.getU_file());
			ptmt.setString(5, dto.getU_content());
			ptmt.setInt(6, dto.getU_index());
			return ptmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return 0;
	}
	
	public int fileDelete(User_inquiryDTO dto) {
		int res = 0;
		try {		

			sql = "update user_inquiry set u_file = null where u_index = ?";
			
			ptmt =con.prepareStatement(sql);
			ptmt.setInt(1, dto.getU_index());
			res = ptmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}

	// 0818
	public int answerModi(int u_index) {
		try {

			sql = "update user_inquiry set u_state = 1 where u_index = ?";

			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, u_index);
			return ptmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return 0;
	}


	public int answer(User_inquiryDTO dto) {
		try {

			sql = "update user_inquiry set u_state = ?, u_id = ?, u_recontent = ? where u_index = ?";


			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, 2);
			ptmt.setString(2, dto.getU_id());
			ptmt.setString(3, dto.getU_recontent());
			ptmt.setInt(4, dto.getU_index());

			return ptmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return 0;
	}


	public void close() {
		if(rs!=null) try { rs.close();} catch (SQLException e) {}
		if(ptmt!=null) try { ptmt.close();} catch (SQLException e) {}
		if(con!=null) try { con.close();} catch (SQLException e) {}
	}

}
