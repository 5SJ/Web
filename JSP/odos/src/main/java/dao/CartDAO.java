package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CartDTO;
import dto.ProductDTO;

public class CartDAO {

	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public CartDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/odos");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public LinkedHashMap<CartDTO, ProductDTO> list(String cl_id) {
		LinkedHashMap<CartDTO, ProductDTO> list = new LinkedHashMap<CartDTO, ProductDTO>();
		try {
			sql = "select * from cart_list where cl_id = ?";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, cl_id);
			
			rs = ptmt.executeQuery();
			
			while (rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setCl_id(rs.getString("cl_id"));
				dto.setCl_item(rs.getInt("cl_item"));
				dto.setCl_cnt(rs.getInt("cl_cnt"));
				
				list.put(dto, new ProductDAO().detail(dto.getCl_item()));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public CartDTO detail(String cl_id, int cl_item) {
		CartDTO res = null;
		
		sql = "select * from cart_list where cl_id = ? and cl_item = ?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, cl_id);
			ptmt.setInt(2, cl_item);
			
			rs = ptmt.executeQuery();
			
			if(rs.next()) {
				res = new CartDTO();
				res.setCl_id(rs.getString("cl_id"));
				res.setCl_item(rs.getInt("cl_item"));
				res.setCl_cnt(rs.getInt("cl_cnt"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}
	
	public void insert(CartDTO dto) {
		try {
			sql = "insert into cart_list (cl_id, cl_item, cl_cnt) values (?, ?, ?)";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getCl_id());
			ptmt.setInt(2, dto.getCl_item());
			ptmt.setInt(3, dto.getCl_cnt());

			rs = ptmt.executeQuery();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

	}
	
	public void addCnt(CartDTO dto) {
		try {
			sql = "update cart_list set cl_cnt = cl_cnt + ? where cl_id = ? and cl_item = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, dto.getCl_cnt());
			ptmt.setString(2, dto.getCl_id());
			ptmt.setInt(3, dto.getCl_item());

			rs = ptmt.executeQuery();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

	}

	public void delete(CartDTO dto) {
		try {
			sql = "delete from cart_list where cl_id = ? and cl_item = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getCl_id());
			ptmt.setInt(2, dto.getCl_item());
			rs = ptmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	public void deleteAll(String id) {
		try {
			sql = "delete from cart_list where cl_id = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, id);
			
			rs = ptmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void deleteAll(int item) {
		try {
			sql = "delete from cart_list where cl_item = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, item);
			
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
