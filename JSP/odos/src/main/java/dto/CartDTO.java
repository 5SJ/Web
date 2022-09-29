package dto;

public class CartDTO {
	String cl_id;
	int cl_item, cl_cnt;
	
	public CartDTO() {
	}

	public String getCl_id() {
		return cl_id;
	}

	public void setCl_id(String cl_id) {
		this.cl_id = cl_id;
	}

	public int getCl_item() {
		return cl_item;
	}

	public void setCl_item(int cl_item) {
		this.cl_item = cl_item;
	}

	public int getCl_cnt() {
		return cl_cnt;
	}

	public void setCl_cnt(int cl_cnt) {
		this.cl_cnt = cl_cnt;
	}

	@Override
	public String toString() {
		return "CartDTO [cl_id=" + cl_id + ", cl_item=" + cl_item + ", cl_cnt=" + cl_cnt + "]";
	}
	
}
