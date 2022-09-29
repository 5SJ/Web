package dto;

import java.util.ArrayList;

import dao.ProductDAO;

public class CategoryDTO {
	String c_name;
	ArrayList<Integer> c_item; 

	public String getC_itemStr() {
		String c_itemStr = "";
		if(c_item.size()>0 && c_item!=null) {
			for(int item : c_item) {
				ProductDTO dto = new ProductDAO().detail(item);
				c_itemStr += dto.s_name + ", ";
			}
			c_itemStr = c_itemStr.substring(0, c_itemStr.length()-2);
		}
		return c_itemStr;
	}
	
	public ArrayList<Integer> getC_item() {
		return c_item;
	}

	public void setC_item(ArrayList<Integer> c_item) {
		this.c_item = c_item;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
}