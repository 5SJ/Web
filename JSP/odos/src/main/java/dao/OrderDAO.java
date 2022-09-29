package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.OrderDTO;

public class OrderDAO {

	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat numf = new SimpleDateFormat("yyyy-MMdd");
	
	public OrderDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/odos");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<OrderDTO> listAll() {	// 주문번호, 주문일, 주문매장, 주문자, 주문상태
		ArrayList<OrderDTO> res = new ArrayList<OrderDTO>();
		
		try {
			sql = "select distinct oi_num, oi_date, oi_mid, oi_sort, (select m_name from member_management "
					+ "where m_id = (select f_id from franchisee_management where f_index = oi_fid)) as f_name "
					+ "from order_info";
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto = new OrderDTO();
				dto.setOi_num(rs.getString("oi_num"));
				dto.setOi_mid(rs.getString("oi_mid"));
				dto.setOi_date(rs.getTimestamp("oi_date"));
				dto.setOi_sort(rs.getInt("oi_sort"));
				dto.setF_name(rs.getString("f_name"));
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
	
	public ArrayList<OrderDTO> sortList(int oi_sort) {	// 주문번호, 주문일, 주문매장, 주문자, 주문상태
		ArrayList<OrderDTO> res = new ArrayList<OrderDTO>();
		
		try {
			sql = "select distinct oi_num, oi_date, oi_mid, oi_sort, (select m_name from member_management "
					+ "where m_id = (select f_id from franchisee_management where f_index = oi_fid)) as f_name "
					+ "from order_info where oi_sort = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, oi_sort);
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto = new OrderDTO();
				dto.setOi_num(rs.getString("oi_num"));
				dto.setOi_mid(rs.getString("oi_mid"));
				dto.setOi_date(rs.getTimestamp("oi_date"));
				dto.setOi_sort(rs.getInt("oi_sort"));
				dto.setF_name(rs.getString("f_name"));
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
	
	
	public ArrayList<OrderDTO> list(String oi_mid){
		ArrayList<OrderDTO> res = new ArrayList<OrderDTO>();
		ArrayList<String> oi_num_list = new ArrayList<String>();
		
		try {
			sql = "select distinct oi_num from order_info where oi_mid = ?";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, oi_mid);
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				oi_num_list.add(rs.getString("oi_num"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		for(String oi_num : oi_num_list) {
			res.add(new OrderDAO().detail(oi_num));
		}
		
		return res;
	}
	
	
	public ArrayList<OrderDTO> franList(int oi_fid, String dd){
		ArrayList<OrderDTO> res = new ArrayList<OrderDTO>();
		ArrayList<String> oi_num_list = new ArrayList<String>();
		
		try {
			sql = "select distinct oi_num from order_info where oi_fid = ? "
				+ "AND DATE_FORMAT(oi_date, '%Y-%m-%d') BETWEEN DATE_FORMAT(?, '%Y-%m-%d') AND DATE_FORMAT(?, '%Y-%m-%d')";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, oi_fid);
			ptmt.setString(2, dd);
			ptmt.setString(3, dd);
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				oi_num_list.add(rs.getString("oi_num"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		for(String oi_num : oi_num_list) {
			res.add(new OrderDAO().detail(oi_num));
		}
		
		return res;
	}
	
	public OrderDTO detail(String oi_num) {
		OrderDTO res = new OrderDTO();
		LinkedHashMap<Integer, Integer> oi_list = new LinkedHashMap<Integer, Integer>();
		int oi_item, oi_cnt, oi_total = 0;
		sql = "select * , (select m_name from member_management where m_id = oi_mid) as m_name, "
				+ "(select m_name from member_management where m_id = "
				+ "(select f_id from franchisee_management where f_index = oi_fid)) as f_name "
				+ "from order_info where oi_num = ?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, oi_num);
			
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				res.setM_name(rs.getString("m_name"));
				res.setOi_num(rs.getString("oi_num"));
				res.setOi_mid(rs.getString("oi_mid"));
				res.setOi_date(rs.getTimestamp("oi_date"));
				res.setOi_info(rs.getString("oi_info"));
				res.setOi_fid(rs.getInt("oi_fid"));
				res.setOi_sort(rs.getInt("oi_sort"));
				res.setF_name(rs.getString("f_name"));
				res.setOi_point(rs.getInt("oi_point"));
				
				oi_item = rs.getInt("oi_item");
				oi_cnt = rs.getInt("oi_cnt");
				oi_list.put(oi_item, oi_cnt);
				oi_total += (new ProductDAO().detail(oi_item).s_price)*oi_cnt;
			}
			res.setOi_list(oi_list);
			res.setOi_total(oi_total);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}
	
	public void insert(OrderDTO dto) {
		
		try {
			String oi_num = "";
			sql = "select max(oi_num) from order_info where date(oi_date) = ?";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, sdf.format(new Date()));
			rs = ptmt.executeQuery();
			rs.next();
			
			if(rs.getString(1) != null) {
				int max = Integer.parseInt(rs.getString(1).substring(10))+1;
				oi_num = numf.format(new Date()) + String.format("-%04d", max); 
			} else {
				oi_num = numf.format(new Date()) + "-0001";
			}
			
			sql = "insert into order_info (oi_num, oi_item, oi_cnt, oi_mid, oi_date, oi_info, oi_fid, oi_sort, oi_point)"
					+ " values (?, ?, ?, ?, sysdate(), ?, ?, 1, ?)";
			
			for(int key : dto.getOi_list().keySet()) {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, oi_num);
				ptmt.setInt(2, key);
				ptmt.setInt(3, dto.getOi_list().get(key));
				ptmt.setString(4, dto.getOi_mid());
				ptmt.setString(5, dto.getOi_info());
				ptmt.setInt(6, dto.getOi_fid());
				ptmt.setInt(7, dto.getOi_point());
				
				rs = ptmt.executeQuery();
			}
			
			dto.setOi_num(oi_num);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public ArrayList<OrderDTO> fList(String f_id, String dd){
		ArrayList<OrderDTO> res = new ArrayList<OrderDTO>();
		OrderDTO odto;
		
		try {
			sql = "SELECT OI_NUM, OI_ITEM, (SELECT s_name FROM subject_info WHERE s_index = oi_item) AS S_NAME, "
					+ "(SELECT S_PRICE FROM subject_info WHERE s_index = oi_item) AS S_PRICE, OI_MID, "
					+ "(SELECT m_name FROM member_management WHERE m_id = oi_mid) AS M_NAME, OI_CNT, OI_FID, OI_SORT, OI_DATE from "
					+ "order_info where oi_fid = (SELECT f_index FROM franchisee_management WHERE f_id = ?) "
					+ "AND DATE_FORMAT(oi_date, '%Y-%m-%d') BETWEEN DATE_FORMAT(?, '%Y-%m-%d') AND DATE_FORMAT(?, '%Y-%m-%d')";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, f_id);
			ptmt.setString(2, dd);
			ptmt.setString(3, dd);
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				odto = new OrderDTO();
				odto.setOi_num(rs.getString("oi_num"));
				odto.setOi_item(rs.getString("oi_item"));
				odto.setS_name(rs.getString("s_name"));
				odto.setOi_mid(rs.getString("oi_mid"));
				odto.setM_name(rs.getString("m_name"));
				odto.setOi_cnt(rs.getInt("oi_cnt"));
				odto.setOi_fid(rs.getInt("oi_fid"));
				odto.setOi_sort(rs.getInt("oi_sort"));
				odto.setOi_date(rs.getTimestamp("oi_date"));
				odto.setOi_total(rs.getInt("s_price")*rs.getInt("oi_cnt"));
				res.add(odto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public void sortUpdate(String oi_num, int oi_sort, int oi_item) {
		try {
			sql = "update order_info set oi_sort = ? where oi_num = ? and oi_item = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, oi_sort);
			ptmt.setString(2, oi_num);
			ptmt.setInt(3, oi_item);
			
			ptmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void sortUpdate(String oi_num, int oi_sort) {
		try {
			sql = "update order_info set oi_sort = ? where oi_num = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, oi_sort);
			ptmt.setString(2, oi_num);
			
			ptmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public String getOrderNumber(String oi_num) {
		sql = "SELECT DISTINCT(oi_info) AS oi_info FROM order_info WHERE oi_num=?";
		String oi_info = null;
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, oi_num);

			rs = ptmt.executeQuery();
			if(rs.next()) {
				oi_info = rs.getString("oi_info");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return oi_info;
	}
	
	public void close() {
		if(rs!=null) try { rs.close();} catch (SQLException e) {}
		if(ptmt!=null) try { ptmt.close();} catch (SQLException e) {}
		if(con!=null) try { con.close();} catch (SQLException e) {}
	}

	public String getNumber(String imp_uid) {
		sql = "SELECT DISTINCT(oi_num) AS oi_num FROM order_info WHERE oi_info = ?";
		String oi_num = null;
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, imp_uid);

			rs = ptmt.executeQuery();
			if(rs.next()) {
				oi_num = rs.getString("oi_num");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return oi_num;
	}
}
