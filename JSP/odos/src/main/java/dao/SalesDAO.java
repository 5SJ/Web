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

public class SalesDAO {

	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public SalesDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/odos");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<OrderDTO> daily(String day){
		ArrayList<OrderDTO> res = new ArrayList<OrderDTO>();
		
		try {
			sql = "select s_name, s_price, sum(oi_cnt) as cnt, sum(s_price*oi_cnt) as tot "
					+ "from subject_info inner join order_info on order_info.oi_item = subject_info.s_index "
					+ "where date(oi_date) = ? group by s_name";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, day);
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setS_name(rs.getString("s_name"));
				dto.setS_price(rs.getInt("s_price"));
				dto.setOi_cnt(rs.getInt("cnt"));
				dto.setOi_total(rs.getInt("tot"));
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
	
	public LinkedHashMap<Date, Integer> monthly(String month) {
		LinkedHashMap<Date, Integer> res = new LinkedHashMap<Date, Integer>();
		String first = month+"-1";
		String last = sdf.format(new Date(Integer.parseInt(month.split("-")[0])-1900, Integer.parseInt(month.split("-")[1]), 0));

		try {
			sql = "SELECT DATE_FORMAT(oi_date, '%Y-%m-%d'), sum(s_price*oi_cnt)"
					+ "FROM subject_info INNER JOIN order_info ON order_info.oi_item = subject_info.s_index "
					+ "WHERE DATE(oi_date) >= ? AND DATE(oi_date) <= ? and oi_sort = 5 "
					+ "GROUP BY DATE_FORMAT(oi_date, '%Y-%m-%d')";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, first);
			ptmt.setString(2, last);
			
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				res.put(rs.getDate(1), rs.getInt(2));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public LinkedHashMap<String, Integer> yearly(String year) {
		LinkedHashMap<String, Integer> res = new LinkedHashMap<String, Integer>();
		String first = year+"-01-01";
		String last = year+"-12-31";
		try {
			sql = "SELECT DATE_FORMAT(oi_date, '%Y-%m'), sum(s_price*oi_cnt)"
					+ "FROM subject_info INNER JOIN order_info ON order_info.oi_item = subject_info.s_index "
					+ "WHERE DATE(oi_date) >= ? AND DATE(oi_date) <= ? and oi_sort = 5 "
					+ "GROUP BY DATE_FORMAT(oi_date, '%Y-%m')";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, first);
			ptmt.setString(2, last);
			
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				res.put(rs.getString(1), rs.getInt(2));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public ArrayList<OrderDTO> prodSales(String first, String last){
		ArrayList<OrderDTO> res = new ArrayList<OrderDTO>();

		try {
			sql = "select s_cate, oi_item, s_name, s_price, SUM(oi_cnt) AS cnt, sum(s_price*oi_cnt) as tot "
					+ "from subject_info inner join order_info on order_info.oi_item = subject_info.s_index "
					+ "where date(oi_date) >= ? and date(oi_date) <= ? and oi_sort = 5 group by s_name order by s_cate";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, first);
			ptmt.setString(2, last);
			
			rs = ptmt.executeQuery();
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setS_name(rs.getString("s_name"));
				dto.setOi_item(rs.getString("oi_item"));
				dto.setS_price(rs.getInt("s_price"));
				dto.setOi_cnt(rs.getInt("cnt"));
				dto.setOi_total(rs.getInt("tot"));
				dto.setS_cate(rs.getString("s_cate"));
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
	
	public ArrayList<OrderDTO> prodSalesDetail(int oi_item, String first, String last){
		ArrayList<OrderDTO> res = new ArrayList<OrderDTO>();
		try {
			sql = "select s_name, DATE_FORMAT(oi_date, '%Y-%m-%d') AS date, SUM(oi_cnt) AS cnt, sum(s_price*oi_cnt) as tot "
					+ "from subject_info inner join order_info on order_info.oi_item = subject_info.s_index "
					+ "where date(oi_date) >= ? and date(oi_date) <= ? AND s_index = ? and oi_sort = 5 "
					+ "group by DATE_FORMAT(oi_date, '%Y-%m-%d')";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, first);
			ptmt.setString(2, last);
			ptmt.setInt(3, oi_item);
			
			rs = ptmt.executeQuery();
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setS_name(rs.getString("s_name"));
				dto.setOi_date(rs.getDate("date"));
				dto.setOi_cnt(rs.getInt("cnt"));
				dto.setOi_total(rs.getInt("tot"));
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
	
	public ArrayList<OrderDTO> franSales(String first, String last){
		ArrayList<OrderDTO> res = new ArrayList<OrderDTO>();
		
		try {
			sql = "SELECT (SELECT f_index FROM franchisee_management WHERE order_info.oi_fid = f_index) AS f_index, "
					+ "(SELECT f_id FROM franchisee_management WHERE order_info.oi_fid = f_index) AS f_id, "
					+ "(SELECT m_name FROM member_management WHERE m_id = f_id) AS f_name, sum(oi_cnt*s_price) AS tot "
					+ "FROM subject_info INNER JOIN order_info ON order_info.oi_item = s_index "
					+ "WHERE date(oi_date) >= ? and date(oi_date) <= ? and oi_sort = 5 GROUP BY oi_fid";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, first);
			ptmt.setString(2, last);
			
			rs = ptmt.executeQuery();
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setOi_fid(rs.getInt("f_index"));
				dto.setOi_mid(rs.getString("f_id"));
				dto.setF_name(rs.getString("f_name"));
				dto.setOi_total(rs.getInt("tot"));
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
	
	
	public ArrayList<OrderDTO> franSalesDetail(int f_index, String first, String last){
		ArrayList<OrderDTO> res = new ArrayList<OrderDTO>();
		try {
			sql = "SELECT (SELECT f_id FROM franchisee_management WHERE order_info.oi_fid = f_index) AS f_id, "
					+ "(SELECT m_name FROM member_management WHERE m_id = f_id) AS f_name, "
					+ "DATE_FORMAT(oi_date, '%Y-%m-%d') AS DATE, sum(oi_cnt*s_price) AS tot "
					+ "FROM subject_info INNER JOIN order_info ON order_info.oi_item = s_index "
					+ "WHERE date(oi_date) >= ? and date(oi_date) <= ? AND oi_fid = ? and oi_sort = 5 "
					+ "group by DATE_FORMAT(oi_date, '%Y-%m-%d')";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, first);
			ptmt.setString(2, last);
			ptmt.setInt(3, f_index);
			
			rs = ptmt.executeQuery();
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setOi_mid(rs.getString("f_id"));
				dto.setF_name(rs.getString("f_name"));
				dto.setOi_date(rs.getDate("date"));
				dto.setOi_total(rs.getInt("tot"));
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
	
	
   public int fList(String f_id, String dd){
	      int res = 0;
	      try {
	         sql = "SELECT OI_NUM, OI_ITEM, "
	               + "OI_CNT, SUM(((SELECT S_PRICE FROM subject_info WHERE s_index = oi_item)*oi_cnt)) AS TOTAL, "
	               + "OI_FID, OI_SORT, OI_DATE, DATE_FORMAT(oi_date, '%Y-%m') as dd from order_info "
	               + "WHERE oi_fid = (SELECT f_index FROM franchisee_management WHERE f_id = ?) AND oi_sort = 5 GROUP BY dd HAVING dd = ?";
	         
	         ptmt = con.prepareStatement(sql);
	         ptmt.setString(1, f_id);
	         ptmt.setString(2, dd);
	         rs = ptmt.executeQuery();
	         
	         while(rs.next()) {
	            res = rs.getInt(4);
	         }

	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return res;
	   }
	   
   public ArrayList<String> monthList(String dd){
      ArrayList<String> res = new ArrayList<String>();
      try {
         sql = "SELECT DATE_FORMAT(oi_date, '%Y-%m') AS dd FROM order_info GROUP BY dd";
         
         ptmt = con.prepareStatement(sql);
         rs = ptmt.executeQuery();
         
         while(rs.next()) {
            res.add(rs.getString("dd"));
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
