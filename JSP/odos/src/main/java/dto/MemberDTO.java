package dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;

public class MemberDTO {

	public String m_id, m_pw, m_name, m_email, m_addr;
	public int m_state, m_point;
	Date m_date;
	HashMap<Integer, String> m_stateMap;

	public String getM_nameEn() {
		try {
			return URLEncoder.encode(m_name, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public String getM_addrEn() {
		try {
			return URLEncoder.encode(m_addr, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public String getM_stateStr() {
		return m_stateMap.get(m_state);
	}
	
	
	public MemberDTO() {
		m_stateMap = new HashMap<Integer, String>();
		m_stateMap.put(1, "일반회원");
		m_stateMap.put(2, "가맹점주");
		m_stateMap.put(3, "일반탈퇴");
		m_stateMap.put(4, "일반정지");
		m_stateMap.put(5, "가맹정지");
		m_stateMap.put(9, "관리자");
	}

	public int getM_state() {
		return m_state;
	}

	public void setM_state(int m_state) {
		this.m_state = m_state;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public int getM_point() {
		return m_point;
	}

	public void setM_point(int m_point) {
		this.m_point = m_point;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}

	public HashMap<Integer, String> getM_stateMap() {
		return m_stateMap;
	}

	public void setM_stateMap(HashMap<Integer, String> m_stateMap) {
		this.m_stateMap = m_stateMap;
	}

	@Override
	public String toString() {
		return "MemberManagementDTO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_email=" + m_email
				+ ", m_addr=" + m_addr + ", m_point=" + m_point + ", m_date=" + m_date + ", m_state=" + m_state + "]";
	}
	
}
