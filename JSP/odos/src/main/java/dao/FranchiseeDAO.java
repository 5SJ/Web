package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CategoryDTO;
import dto.FranchiseeDTO;

public class FranchiseeDAO {

	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public FranchiseeDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/odos");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getId() {
		int res = 0;
		
		sql = "SHOW TABLE STATUS WHERE NAME = 'FRANCHISEE_MANAGEMENT'";
		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt("auto_increment");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public int insert(FranchiseeDTO fdto) {
		int res = 0;
		try {
			sql = "insert into member_management(m_id, m_pw, m_name, m_email, m_addr, m_point, m_state) values(?, ?, ?, ?, ?, 0, 2)";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, fdto.getF_id());
			ptmt.setString(2, fdto.getF_id());
			ptmt.setString(3, fdto.getF_name());
			ptmt.setString(4, fdto.getF_email());
			ptmt.setString(5, fdto.getF_addr());
			
			res = ptmt.executeUpdate();
		
			sql = "insert into franchisee_management(f_id, f_phone, f_day, f_time, f_info) "
					+ "values(?, ?, ?, ?, ?)";
		
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, fdto.getF_id());
			ptmt.setString(2, fdto.getF_phone());
			ptmt.setString(3, fdto.getF_day());
			ptmt.setString(4, fdto.getF_time());
			ptmt.setString(5, fdto.getF_info());
			
			res = ptmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public ArrayList<FranchiseeDTO> list() {
		ArrayList<FranchiseeDTO> list = new ArrayList<FranchiseeDTO>();
		FranchiseeDTO fdto;

		try {
			sql = "SELECT * from franchisee_management AS fm LEFT JOIN member_management AS mm on fm.F_ID = mm.M_ID order by fm.f_index desc";
			
			ptmt = con.prepareStatement(sql);
			
			rs = ptmt.executeQuery();
			
			while (rs.next()) {
				fdto = new FranchiseeDTO();
				fdto.setF_index(rs.getInt("f_index"));
				fdto.setF_id(rs.getString("f_id"));
				fdto.setF_name(rs.getString("m_name"));
				fdto.setF_addr(rs.getString("m_addr"));
				fdto.setF_phone(rs.getString("f_phone"));
				fdto.setF_day(rs.getString("f_day"));
				fdto.setF_time(rs.getString("f_time"));
				fdto.setF_info(rs.getString("f_info"));
				fdto.setF_state(rs.getInt("m_state"));
				list.add(fdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public FranchiseeDTO detail(String f_id) {
		FranchiseeDTO fdto = new FranchiseeDTO();
		try {
			sql = "SELECT * from franchisee_management AS fm LEFT JOIN member_management AS mm on fm.F_ID = mm.M_ID WHERE mm.M_ID=?";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, f_id);
			rs = ptmt.executeQuery();
			while (rs.next()) {
				fdto.setF_index(rs.getInt("f_index"));
				fdto.setF_id(rs.getString("f_id"));
				fdto.setF_name(rs.getString("m_name"));
				fdto.setF_addr(rs.getString("m_addr"));
				fdto.setF_phone(rs.getString("f_phone"));
				fdto.setF_day(rs.getString("f_day"));
				fdto.setF_time(rs.getString("f_time"));
				fdto.setF_info(rs.getString("f_info"));
				fdto.setF_state(rs.getInt("m_state"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return fdto;
	}
	
	public FranchiseeDTO detailForNum(int f_index) {
		FranchiseeDTO fdto = new FranchiseeDTO();
		try {
			sql = "SELECT * from franchisee_management AS fm LEFT JOIN member_management AS mm on fm.F_ID = mm.M_ID WHERE fm.f_index=?";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, f_index);
			
			rs = ptmt.executeQuery();
			while (rs.next()) {
				fdto.setF_index(rs.getInt("f_index"));
				fdto.setF_id(rs.getString("f_id"));
				fdto.setF_name(rs.getString("m_name"));
				fdto.setF_addr(rs.getString("m_addr"));
				fdto.setF_phone(rs.getString("f_phone"));
				fdto.setF_day(rs.getString("f_day"));
				fdto.setF_time(rs.getString("f_time"));
				fdto.setF_info(rs.getString("f_info"));
				fdto.setF_state(rs.getInt("m_state"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return fdto;
	}
	
	public int update(FranchiseeDTO fdto) {
		int res = 0;
		sql = "update franchisee_management as fm, member_management as mm "
				+ "set mm.m_name = ?, mm.m_addr = ?, mm.m_state = ?, fm.f_phone = ?, fm.f_day = ?, fm.f_time = ?, fm.f_info = ? "
				+ "where fm.f_id = ? and mm.m_id = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, fdto.getF_name());
			ptmt.setString(2, fdto.getF_addr());
			ptmt.setInt(3, fdto.getF_state());
			ptmt.setString(4, fdto.getF_phone());
			ptmt.setString(5, fdto.getF_day());
			ptmt.setString(6, fdto.getF_time());
			ptmt.setString(7, fdto.getF_info());
			ptmt.setString(8, fdto.getF_id());
			ptmt.setString(9, fdto.getF_id());
			
			res = ptmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public int pwUpdate(FranchiseeDTO fdto) {
		int res = 0;
		sql = "update member_management set m_pw = ? where m_id = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, fdto.getF_pw());
			ptmt.setString(2, fdto.getF_id());
			
			res = ptmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public int delete(String[] m_id) {
		int res = 0;
		
		try {
			for(String id : m_id) {
				sql = "update member_management set m_state = 5 where m_id = ?";
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, id);
				
				res += ptmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}
	
	public String pwChk(String id) {
		String res = null;
		sql = "select m_pw from member_management where m_id = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			
			rs = ptmt.executeQuery();
			if(rs.next()) {
				res = rs.getString("m_pw");
			}
		} catch (Exception e) {
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