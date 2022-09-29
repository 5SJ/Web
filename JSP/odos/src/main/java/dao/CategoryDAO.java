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
import dto.Admin_boardDTO;

public class CategoryDAO {

	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;

	public CategoryDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/odos");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<CategoryDTO> list() {
		ArrayList<CategoryDTO> list = new ArrayList<CategoryDTO>();
		CategoryDTO cdto;
		ArrayList<Integer> c_item;
		
		try {
			sql = "select * from category_management";

			ptmt = con.prepareStatement(sql);

			rs = ptmt.executeQuery();

			while (rs.next()) {
				cdto = new CategoryDTO();
				c_item = new ArrayList<Integer>();

				String item = rs.getString("c_item");
				if(item.length()>0) {
					String[] items = item.split("/");
					for (int i = 0; i < items.length; i++) {
						c_item.add(Integer.parseInt(items[i]));
					}
				}
				
				cdto.setC_name(rs.getString("c_name"));
				cdto.setC_item(c_item);
				list.add(cdto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public ArrayList<Integer> detail(String c_name) {
		ArrayList<Integer> c_item = new ArrayList<Integer>();

		try {
			sql = "select c_item from category_management where c_name = ?";

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, c_name);
			rs = ptmt.executeQuery();
			rs.next();

			String item = rs.getString("c_item");
			if(item.length()>0) {
				String[] items = item.split("/");
				for (int i = 0; i < items.length; i++) {
					c_item.add(Integer.parseInt(items[i]));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return c_item;
	}

	public void insert(CategoryDTO dto) {
		try {
			sql = "insert into category_management (c_name, c_item) values(?, '')";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getC_name());

			rs = ptmt.executeQuery();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

	}

	public void modify(CategoryDTO dto) {
		String item = "";
		if(dto.getC_item().size()>0) {
			dto.getC_item().sort(null);
			for(int s_index : dto.getC_item()) {
				item += s_index + "/";
			}
			item = item.substring(0, item.length()-1);
		}
		
		try { 
			sql = "update category_management set c_item = ? where c_name = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, item);
			ptmt.setString(2, dto.getC_name());
					
			ptmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void addItem(String c_name, int s_index) {
		ArrayList<Integer> c_item = new ArrayList<Integer>();

		try {
			sql = "select c_item from category_management where c_name = ?";

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, c_name);
			rs = ptmt.executeQuery();
			rs.next();

			String item = rs.getString("c_item");
			if(item.length()>0) {
				String[] items = item.split("/");
				for (int i = 0; i < items.length; i++) {
					c_item.add(Integer.parseInt(items[i]));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		if(!c_item.contains(s_index)) {
			c_item.add(s_index);
		}
		
		CategoryDTO dto = new CategoryDTO();
		dto.setC_name(c_name);
		dto.setC_item(c_item);
		
		new CategoryDAO().modify(dto);
	}
	
	public void delItem(String c_name, int s_index) {
		ArrayList<Integer> c_item = new ArrayList<Integer>();

		try {
			sql = "select c_item from category_management where c_name = ?";

			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, c_name);
			rs = ptmt.executeQuery();
			rs.next();

			String item = rs.getString("c_item");
			if(item.length()>0) {
				String[] items = item.split("/");
				for (int i = 0; i < items.length; i++) {
					c_item.add(Integer.parseInt(items[i]));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		if(c_item.contains(s_index)) {
			for(int i=0; i<c_item.size(); i++) {
				if(c_item.get(i) == s_index) {
					System.out.println(c_item.get(i));
					c_item.remove(i);
					break;
				}
			}
		}

		CategoryDTO dto = new CategoryDTO();
		dto.setC_name(c_name);
		dto.setC_item(c_item);
		
		new CategoryDAO().modify(dto);
	}

	public void delete(CategoryDTO dto) {
		try {
			sql = "delete from category_management where C_NAME = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getC_name());
			System.out.println(dto.getC_name());
			rs = ptmt.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

	}

	public void close() {
		if (rs != null)	try { rs.close(); } catch (SQLException e) {}
		if (ptmt != null) try {	ptmt.close(); } catch (SQLException e) {}
		if (con != null) try { con.close(); } catch (SQLException e) {}
	}
}
