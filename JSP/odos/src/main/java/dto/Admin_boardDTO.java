package dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

public class Admin_boardDTO {
	
	int a_index, a_type, a_cnt;
	String a_title, a_content, a_file, a_fix;
	Date a_date;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E) HH:mm:ss");

	public String getA_fileEn() {
		if(getA_file() != null) {
			try {
				return URLEncoder.encode(a_file, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public boolean isImg() {
		String pp = ".*[.](jpeg|jpg|bmp|png|gif)";
		return (getA_file() != null && Pattern.matches(pp, getA_file().toLowerCase() ));
	}
	
	public String getA_dateStr() {
		return sdf.format(a_date);
	}
	
	//////////////////////////////////////////////////////////
	
	public Admin_boardDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getA_index() {
		return a_index;
	}

	public void setA_index(int a_index) {
		this.a_index = a_index;
	}

	public int getA_type() {
		return a_type;
	}

	public void setA_type(int a_type) {
		this.a_type = a_type;
	}

	public int getA_cnt() {
		return a_cnt;
	}

	public void setA_cnt(int a_cnt) {
		this.a_cnt = a_cnt;
	}

	public String getA_title() {
		return a_title;
	}

	public void setA_title(String a_title) {
		this.a_title = a_title;
	}

	public String getA_content() {
		return a_content;
	}
	
	public String getA_contentBr() {
		return a_content.replaceAll("\n", "<br/>");
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public String getA_file() {
		return a_file;
	}

	public void setA_file(String a_file) {
		this.a_file = a_file;
	}

	public String getA_fix() {
		return a_fix;
	}

	public void setA_fix(String a_fix) {
		this.a_fix = a_fix;
	}

	public Date getA_date() {
		return a_date;
	}
	public void setA_date(Date a_date) {
		this.a_date = a_date;
	}
	
	@Override
	public String toString() {
		return "admin_boardDTO [a_index=" + a_index + ", a_type=" + a_type + ", a_cnt=" + a_cnt + ", a_title=" + a_title
				+ ", a_content=" + a_content + ", a_file=" + a_file + ", a_fix=" + a_fix + ", a_date=" + a_date + "]";
	}
	
	
}
