package dto;

import java.util.Date;

public class InventoryDTO {
	int i_index;
	int i_cnt;
	String i_type;
	String i_name;
	Date i_date;
	
	public int getI_index() {
		return i_index;
	}
	public void setI_index(int i_index) {
		this.i_index = i_index;
	}
	public int getI_cnt() {
		return i_cnt;
	}
	public void setI_cnt(int i_cnt) {
		this.i_cnt = i_cnt;
	}
	public String getI_type() {
		return i_type;
	}
	public void setI_type(String i_type) {
		if(i_type.equals("i")) {
			this.i_type = "입고";
		}else {
			this.i_type = "출고";
		}
	}
	public Date getI_date() {
		return i_date;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public void setI_date(Date i_date) {
		this.i_date = i_date;
	}
}
