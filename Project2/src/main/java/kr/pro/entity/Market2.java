package kr.pro.entity;

public class Market2 {

	private String i_save;
	private String p_name;
	private String s_amount;
	private String s_price;
	private String u_id;
	private int p_num;

	public Market2() {
	}

	@Override
	public String toString() {
		return "Market2 [i_save=" + i_save + ", p_name=" + p_name + ", s_amount=" + s_amount + ", s_price=" + s_price
				+ ", u_id=" + u_id + ", p_num=" + p_num + "]";
	}

	public String getI_save() {
		return i_save;
	}

	public void setI_save(String i_save) {
		this.i_save = i_save;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getS_amount() {
		return s_amount;
	}

	public void setS_amount(String s_amount) {
		this.s_amount = s_amount;
	}

	public String getS_price() {
		return s_price;
	}

	public void setS_price(String s_price) {
		this.s_price = s_price;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

}
