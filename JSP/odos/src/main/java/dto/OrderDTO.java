package dto;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;

import dao.ProductDAO;

public class OrderDTO {
	String oi_num, oi_mid, oi_info, oi_item, s_name, s_cate, m_name, f_name;
	int oi_fid, oi_sort, oi_cnt, oi_total, s_price, oi_point;
	Date oi_date;
	LinkedHashMap<Integer, Integer> oi_list;
	HashMap<Integer, String> oi_sortMap;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");


	public int getOi_point() {
		return oi_point;
	}

	public void setOi_point(int oi_point) {
		this.oi_point = oi_point;
	}

	public String getS_cate() {
		return s_cate;
	}

	public void setS_cate(String s_cate) {
		this.s_cate = s_cate;
	}

	public int getS_price() {
		return s_price;
	}

	public void setS_price(int s_price) {
		this.s_price = s_price;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getOi_item() {
		return oi_item;
	}

	public void setOi_item(String oi_item) {
		this.oi_item = oi_item;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getOi_cnt() {
		return oi_cnt;
	}

	public void setOi_cnt(int oi_cnt) {
		this.oi_cnt = oi_cnt;
	}

	public OrderDTO() {
		oi_sortMap = new HashMap<Integer, String>();
		oi_sortMap.put(1, "주문 접수 대기");
		oi_sortMap.put(2, "상품 준비중");
		oi_sortMap.put(3, "매장 배송중");
		oi_sortMap.put(4, "픽업 대기");
		oi_sortMap.put(5, "수령 완료");
		oi_sortMap.put(9, "주문 취소");
	}
	
	public String getOi_listStr() {
		String oi_list_str = "";
		for(int key : oi_list.keySet()) {
			if(oi_list_str.equals("")) {
				oi_list_str = new ProductDAO().detail(key).s_name;
				if(oi_list.size()>1) {
					oi_list_str += " 외 " + (oi_list.size()-1) + "개 품목";
				}
			}
		}
		return oi_list_str;
	}
	
	public String getOi_dateStr() {
		return sdf.format(oi_date);
	}
	
	public String getOi_sortStr() {
		return oi_sortMap.get(oi_sort);
	}
	
	

	public HashMap<Integer, String> getOi_sortMap() {
		return oi_sortMap;
	}

	public void setOi_sortMap(HashMap<Integer, String> oi_sortMap) {
		this.oi_sortMap = oi_sortMap;
	}

	public String getOi_num() {
		return oi_num;
	}

	public void setOi_num(String oi_num) {
		this.oi_num = oi_num;
	}

	public String getOi_mid() {
		return oi_mid;
	}

	public void setOi_mid(String oi_mid) {
		this.oi_mid = oi_mid;
	}

	public String getOi_info() {
		return oi_info;
	}

	public void setOi_info(String oi_info) {
		this.oi_info = oi_info;
	}

	public int getOi_fid() {
		return oi_fid;
	}

	public void setOi_fid(int oi_fid) {
		this.oi_fid = oi_fid;
	}

	public int getOi_sort() {
		return oi_sort;
	}

	public void setOi_sort(int oi_sort) {
		this.oi_sort = oi_sort;
	}

	public int getOi_total() {
		return oi_total;
	}

	public void setOi_total(int oi_total) {
		this.oi_total = oi_total;
	}

	public Date getOi_date() {
		return oi_date;
	}

	public void setOi_date(Date oi_date) {
		this.oi_date = oi_date;
	}

	public LinkedHashMap<Integer, Integer> getOi_list() {
		return oi_list;
	}

	public void setOi_list(LinkedHashMap<Integer, Integer> oi_list) {
		this.oi_list = oi_list;
	}

	@Override
	public String toString() {
		return "OrderDTO [oi_num=" + oi_num + ", oi_mid=" + oi_mid + ", oi_info=" + oi_info + ", oi_item=" + oi_item
				+ ", s_name=" + s_name + ", s_cate=" + s_cate + ", m_name=" + m_name + ", f_name=" + f_name
				+ ", oi_fid=" + oi_fid + ", oi_sort=" + oi_sort + ", oi_cnt=" + oi_cnt + ", oi_total=" + oi_total
				+ ", s_price=" + s_price + ", oi_date=" + oi_date + ", oi_list=" + oi_list + ", oi_sortMap="
				+ oi_sortMap + ", sdf=" + sdf + "]";
	}


}
