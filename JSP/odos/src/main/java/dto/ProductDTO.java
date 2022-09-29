package dto;

public class ProductDTO {
	public int s_index, s_price, s_cnt;
	public String s_cate, s_name, s_info, s_image;
	

	public String getS_infoBr() {
		return s_info.replaceAll("\n", "<br/>");
	}
	
	
	public ProductDTO() {
		
	}
	
	public int getS_index() {
		return s_index;
	}

	public void setS_index(int s_index) {
		this.s_index = s_index;
	}

	public int getS_price() {
		return s_price;
	}

	public void setS_price(int s_price) {
		this.s_price = s_price;
	}

	public int getS_cnt() {
		return s_cnt;
	}

	public void setS_cnt(int s_cnt) {
		this.s_cnt = s_cnt;
	}

	public String getS_cate() {
		return s_cate;
	}

	public void setS_cate(String s_cate) {
		this.s_cate = s_cate;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_info() {
		return s_info;
	}

	public void setS_info(String s_info) {
		this.s_info = s_info;
	}

	public String getS_image() {
		return s_image;
	}

	public void setS_image(String s_image) {
		this.s_image = s_image;
	}

	
	@Override
	public String toString() {
		return "ProductDTO [s_index=" + s_index + ", s_price=" + s_price + ", s_cnt=" + s_cnt + ", s_cate=" + s_cate
				+ ", s_name=" + s_name + ", s_info=" + s_info + ", s_image=" + s_image + "]";
	}
	
}
