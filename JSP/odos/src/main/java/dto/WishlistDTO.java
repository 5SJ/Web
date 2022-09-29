package dto;

import java.util.LinkedHashMap;

public class WishlistDTO {
	String wl_id;
	LinkedHashMap<Integer, ProductDTO> wl_item;
	
	public String getWl_id() {
		return wl_id;
	}
	
	public void setWl_id(String wl_id) {
		this.wl_id = wl_id;
	}
	
	public LinkedHashMap<Integer, ProductDTO> getWl_item() {
		return wl_item;
	}

	public void setWl_item(LinkedHashMap<Integer, ProductDTO> wl_item) {
		this.wl_item = wl_item;
	}

	@Override
	public String toString() {
		return "WishlistDTO [wl_id=" + wl_id + ", wl_item=" + wl_item + "]";
	}
	
}
