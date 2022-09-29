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
import dto.ProductDTO;

public class ProductDAO {

	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public ProductDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/odos");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ProductDTO> list() {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();

		try {
			sql = "select * from subject_info";
			ptmt = con.prepareStatement(sql);
			
			rs = ptmt.executeQuery();
			
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setS_index(rs.getInt("s_index"));
				dto.setS_cate(rs.getString("s_cate"));
				dto.setS_name(rs.getString("s_name"));
				dto.setS_info(rs.getString("s_info"));
				dto.setS_image(rs.getString("s_image"));
				dto.setS_price(rs.getInt("s_price"));
				dto.setS_cnt(rs.getInt("s_cnt"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public ArrayList<ProductDTO> cateList(String category) {
		
		ArrayList<ProductDTO> prodList = new ArrayList<ProductDTO>();
		ArrayList<ProductDTO> res = new ArrayList<ProductDTO>();
		
		try {
			sql = "select * from subject_info";
			ptmt = con.prepareStatement(sql);
			
			rs = ptmt.executeQuery();
			
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setS_index(rs.getInt("s_index"));
				dto.setS_cate(rs.getString("s_cate"));
				dto.setS_name(rs.getString("s_name"));
				dto.setS_info(rs.getString("s_info"));
				dto.setS_image(rs.getString("s_image"));
				dto.setS_price(rs.getInt("s_price"));
				dto.setS_cnt(rs.getInt("s_cnt"));
				prodList.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		ArrayList<Integer> cateList = new CategoryDAO().detail(category);
		
		for(ProductDTO dto : prodList) {
			for(int s_index : cateList) {
				if(s_index == dto.s_index) {
					res.add(dto);
				}
			}
		}

		return res;
	}
	
	public ArrayList<ProductDTO> searchList(String where) {
		ArrayList<ProductDTO> res = new ArrayList<ProductDTO>();
		
		try {
			sql = "select * from subject_info where s_name like ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, "%"+where+"%");
			rs = ptmt.executeQuery();
			
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setS_index(rs.getInt("s_index"));
				dto.setS_cate(rs.getString("s_cate"));
				dto.setS_name(rs.getString("s_name"));
				dto.setS_info(rs.getString("s_info"));
				dto.setS_image(rs.getString("s_image"));
				dto.setS_price(rs.getInt("s_price"));
				dto.setS_cnt(rs.getInt("s_cnt"));
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
				
		return res;
	}
	
	public ArrayList<ProductDTO> bestList() {
		ArrayList<ProductDTO> res = new ArrayList<ProductDTO>();
		sql = "SELECT * FROM bestItem";
		
		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setS_index(rs.getInt("s_index"));
				dto.setS_cate(rs.getString("s_cate"));
				dto.setS_name(rs.getString("s_name"));
				dto.setS_info(rs.getString("s_info"));
				dto.setS_image(rs.getString("s_image"));
				dto.setS_price(rs.getInt("s_price"));
				dto.setS_cnt(rs.getInt("s_cnt"));
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return res;
	}
	
	public ProductDTO detail(int s_index) {
		ProductDTO res = null;
		sql = "select * from subject_info where s_index = ?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, s_index);
			rs = ptmt.executeQuery();
			
			if(rs.next()) {
				res = new ProductDTO();
				
				res.setS_index(rs.getInt("s_index"));
				res.setS_cate(rs.getString("s_cate"));
				res.setS_name(rs.getString("s_name"));
				res.setS_info(rs.getString("s_info"));
				res.setS_image(rs.getString("s_image"));
				res.setS_price(rs.getInt("s_price"));
				res.setS_cnt(rs.getInt("s_cnt"));
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return res;
	}
	
	public void insert(ProductDTO dto) {
		try {
			sql = "select max(s_index)+1 from subject_info";
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			rs.next();
			
			dto.s_index = rs.getInt(1);
			if(dto.s_index == 0) {
				dto.s_index = 1;
			}
			
			sql = "insert into subject_info (s_index, s_cate, s_name, s_info, s_image, s_price, s_cnt) values(?, ?, ?, ?, ?, ?, 0)";
			
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, dto.s_index);
			ptmt.setString(2, dto.s_cate);
			ptmt.setString(3, dto.s_name);
			ptmt.setString(4, dto.s_info);
			ptmt.setString(5, dto.s_image);
			ptmt.setInt(6, dto.s_price);
			
			ptmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

	}

	public void delete(ProductDTO dto) {
		
		ArrayList<CategoryDTO> allCate = new CategoryDAO().list();
		ArrayList<String> cateList = new ArrayList<String>();
		for(CategoryDTO cdto : allCate) {
			if(cdto.getC_item().contains(dto.s_index)) {
				cateList.add(cdto.getC_name());
			}
		}
		
		for(String c_name : cateList) {
			new CategoryDAO().delItem(c_name, dto.s_index);
		}
		
		try {
			sql = "delete from subject_info where s_index = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, dto.s_index);
			
			ptmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void modify(ProductDTO dto) {
		sql = "update subject_info set s_name = ?, s_cate = ?, s_info = ?, s_image = ?, s_price = ? where s_index = ?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.s_name);
			ptmt.setString(2, dto.s_cate);
			ptmt.setString(3, dto.s_info);
			ptmt.setString(4, dto.s_image);
			ptmt.setInt(5, dto.s_price);
			ptmt.setInt(6, dto.s_index);
			
			ptmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public int addCnt(int s_index, int s_cnt) {
	      int res = 0;
	      try {
	         sql = "update subject_info set s_cnt = s_cnt + ? where s_index = ?";
	         ptmt = con.prepareStatement(sql);
	         ptmt.setInt(1, s_cnt);
	         ptmt.setInt(2, s_index);
	         
	         res = ptmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return res;
	   }
	
	public void imageDelete(ProductDTO dto) {
		try {
			sql = "update subject_info set s_image = null where s_index = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, dto.s_index);
			
			ptmt.executeUpdate();
			dto.setS_image(null);
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
