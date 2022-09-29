package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ProductDTO;
import dto.WishlistDTO;

public class WishlistDAO {

	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public WishlistDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/odos");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public WishlistDTO detail(String wl_id) {
		WishlistDTO res = new WishlistDTO();
		LinkedHashMap<Integer, ProductDTO> wl_item = new LinkedHashMap<Integer, ProductDTO>();
		sql = "select * from wish_list where wl_id = ?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, wl_id);
			
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				res.setWl_id(wl_id);
				int s_index = rs.getInt("wl_item");
				wl_item.put(s_index, new ProductDAO().detail(s_index));
			}
			res.setWl_item(wl_item);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}
	
	public void insert(String wl_id, int wl_item) {
		try {
			sql = "insert into wish_list (wl_id, wl_item) values (?, ?)";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, wl_id);
			ptmt.setInt(2, wl_item);

			rs = ptmt.executeQuery();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

	}
	
	public int count(int wl_item) {
		int res = 0;
		try {
			sql = "select count(*) from wish_list where wl_item = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, wl_item);
			
			rs = ptmt.executeQuery();
			rs.next();
			res = rs.getInt(1);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}
	
	public void delete(String wl_id, int wl_item) {
		try {
			sql = "delete from wish_list where wl_id = ? and wl_item = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, wl_id);
			ptmt.setInt(2, wl_item);
			rs = ptmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	public void deleteAll(String wl_id) {	// 회원탈퇴시 모두 삭제
		try {
			sql = "delete from wish_list where wl_id = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, wl_id);
			
			rs = ptmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void deleteAll(int wl_item) {	// 상품삭제시 모두 삭제
		try {
			sql = "delete from wish_list where wl_item = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, wl_item);
			
			rs = ptmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	
	public void close() {
		if(rs!=null) try { rs.close();} catch (SQLException e) {}
		if(ptmt!=null) try { ptmt.close();} catch (SQLException e) {}
		if(con!=null) try { con.close();} catch (SQLException e) {}
	}
}
