package dto;

public class FranchiseeDTO {
	int f_index;
	String f_id;
	String f_pw;
	String f_name;
	String f_addr;
	String f_email;
	String f_phone;
	String f_day;
	String f_time;
	String f_info;
	int f_state;
	
	public String getF_dayBr() {
		String res = "";
		for(int i=0; i<f_day.split("/").length; i++) {
			res += f_day.split("/")[i] + " : " + f_time.split("/")[i] + "<br/>";
		}
		return res;
	}
	
	public int getF_index() {
		return f_index;
	}
	public void setF_index(int f_index) {
		this.f_index = f_index;
	}
	public String getF_id() {
		return f_id;
	}
	public void setF_id(String f_id) {
		this.f_id = f_id;
	}
	public String getF_pw() {
		return f_pw;
	}
	public void setF_pw(String f_pw) {
		this.f_pw = f_pw;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_addr() {
		return f_addr;
	}
	public void setF_addr(String f_addr) {
		this.f_addr = f_addr;
	}
	public String getF_email() {
		return f_email;
	}
	public void setF_email(String f_email) {
		this.f_email = f_email;
	}
	public String getF_phone() {
		return f_phone;
	}
	public void setF_phone(String f_phone) {
		this.f_phone = f_phone;
	}
	public String getF_day() {
		return f_day;
	}
	public void setF_day(String f_day) {
		this.f_day = f_day;
	}
	public String getF_time() {
		return f_time;
	}
	public void setF_time(String f_time) {
		this.f_time = f_time;
	}
	public String getF_info() {
		return f_info;
	}
	public String getF_infoBr() {
		return f_info.replaceAll("\n", "<br/>");
	}
	public void setF_info(String f_info) {
		this.f_info = f_info;
	}
	public int getF_state() {
		return f_state;
	}
	public void setF_state(int f_state) {
		this.f_state = f_state;
	}
}