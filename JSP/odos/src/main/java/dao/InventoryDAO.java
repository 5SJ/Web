package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.InventoryDTO;

public class InventoryDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public InventoryDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/odos");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 재고처리
	public void update(int s_index, int s_cnt, String i_type) {
		sql = "insert into inventory_management (i_index, i_cnt, i_type) values(?, ?, ?)";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, s_index);
			ptmt.setInt(2, s_cnt);
			ptmt.setString(3, i_type);
			
			ptmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	// imp_uid 만 받고
	public void update(String imp_uid) {
		sql = "INSERT INTO inventory_management (i_index, i_cnt, i_type) SELECT oi_item, oi_cnt, 'i' FROM order_info WHERE oi_info = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, imp_uid);
			
			ptmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public ArrayList<InventoryDTO> history(String dd) {
		ArrayList<InventoryDTO> list = new ArrayList<InventoryDTO>();
		InventoryDTO idto;
		sql = "SELECT i_index, (SELECT s_name FROM subject_info WHERE s_index = i_index) AS i_name, i_cnt, i_type, i_date FROM inventory_management WHERE DATE_FORMAT(I_DATE, '%Y-%m-%d') = ? order by i_date desc";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dd);
			
			rs = ptmt.executeQuery();
			while (rs.next()) {
				idto = new InventoryDTO();
				idto.setI_index(rs.getInt("i_index"));
				idto.setI_name(rs.getString("i_name"));
				idto.setI_cnt(rs.getInt("i_cnt"));
				idto.setI_type(rs.getString("i_type"));
				idto.setI_date(rs.getTimestamp("i_date"));
				list.add(idto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public void close() {
		if(rs!=null) try { rs.close();} catch (SQLException e) {}
		if(ptmt!=null) try { ptmt.close();} catch (SQLException e) {}
		if(con!=null) try { con.close();} catch (SQLException e) {}
	}
}