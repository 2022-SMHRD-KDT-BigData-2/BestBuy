package kr.pro.entity;

public class Market {
//s_info (장바구니)
	private int p_num;
	private String u_id;
	private String p_name;
	private int p_grade;
	private String s_date;
	private int s_payment;
	private int s_amount;
	private String s_price;

	public Market() {
	}

	@Override
	public String toString() {
		return "Market [p_num=" + p_num + ", u_id=" + u_id + ", p_name=" + p_name + ", p_grade=" + p_grade + ", s_date="
				+ s_date + ", s_payment=" + s_payment + ", s_amount=" + s_amount + ", s_price=" + s_price + "]";
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_grade() {
		return p_grade;
	}

	public void setP_grade(int p_grade) {
		this.p_grade = p_grade;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public int getS_payment() {
		return s_payment;
	}

	public void setS_payment(int s_payment) {
		this.s_payment = s_payment;
	}

	public int getS_amount() {
		return s_amount;
	}

	public void setS_amount(int s_amount) {
		this.s_amount = s_amount;
	}

	public String getS_price() {
		return s_price;
	}

	public void setS_price(String s_price) {
		this.s_price = s_price;
	}

}
