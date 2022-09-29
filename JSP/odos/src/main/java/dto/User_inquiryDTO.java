package dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.regex.Pattern;

public class User_inquiryDTO {
	
	int u_index, u_type, u_state;
	String u_id, u_title, u_content, u_file, u_recontent;
	Date u_date, u_redate;
	HashMap<Integer, String> u_typeMap;

	
	public String getU_typeStr() {
		return u_typeMap.get(u_type);
	}
	
	public User_inquiryDTO() {
		u_typeMap = new HashMap<Integer, String>();
		u_typeMap.put(0, "주문/결제/반품/교환문의");
		u_typeMap.put(1, "이벤트/적립금문의");
		u_typeMap.put(2, "상품문의");
		u_typeMap.put(3, "배송문의");
		u_typeMap.put(4, "상품 누락 문의");
		u_typeMap.put(5, "기타문의");
		u_typeMap.put(6, "가맹점문의");
	}

	public HashMap<Integer, String> getU_typeMap() {
		return u_typeMap;
	}

	public void setU_typeMap(HashMap<Integer, String> u_typeMap) {
		this.u_typeMap = u_typeMap;
	}

	public int getU_index() {
		return u_index;
	}

	public void setU_index(int u_index) {
		this.u_index = u_index;
	}

	public int getU_type() {
		return u_type;
	}

	public void setU_type(int u_type) {
		this.u_type = u_type;
	}

	public int getU_state() {
		return u_state;
	}

	public void setU_state(int u_state) {
		this.u_state = u_state;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_title() {
		return u_title;
	}

	public void setU_title(String u_title) {
		this.u_title = u_title;
	}

	public String getU_content() {
		return u_content;
	}
	
	public String getU_contentBr() {
		return u_content.replaceAll("\n", "<br/>");
	}

	public void setU_content(String u_content) {
		this.u_content = u_content;
	}

	public String getU_file() {
		return u_file;
	}

	public void setU_file(String u_file) {
		this.u_file = u_file;
	}

	public String getU_recontent() {
		return u_recontent;
	}
	
	public String getU_recontentBr() {
		return u_recontent.replaceAll("\n", "<br/>");
	}
	
	public String getU_fileEn() {
		
		if(getU_file() != null) {
			try {
				return URLEncoder.encode(u_file, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public boolean isImg() {
		
		String pp = ".*[.](jpeg|jpg|bmp|png|gif)";
		
		return (getU_file() != null && Pattern.matches(pp, getU_file().toLowerCase()));
	}

	public void setU_recontent(String u_recontent) {
		this.u_recontent = u_recontent;
	}

	public Date getU_date() {
		return u_date;
	}

	public void setU_date(Date u_date) {
		this.u_date = u_date;
	}

	public Date getU_redate() {
		return u_redate;
	}

	public void setU_redate(Date u_redate) {
		this.u_redate = u_redate;
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E) HH:mm:ss");
	public String getU_dateStr() {
		return sdf.format(u_date);
	}

	@Override
	public String toString() {
		return "user_inquiryDTO [u_index=" + u_index + ", u_type=" + u_type + ", u_state=" + u_state + ", u_id=" + u_id
				+ ", u_title=" + u_title + ", u_content=" + u_content + ", u_file=" + u_file + ", u_recontent="
				+ u_recontent + ", u_date=" + u_date + ", u_redate=" + u_redate + "]";
	}
	
	
}
