package kr.pro.entity;

public class Product {
// p_info(상품)
	private int p_num;
	private String u_num;
	private String p_name;
	private String p_grade;
	private String p_price;
	private String p_data;
	private String p_option;
	private String p_kind;
	private String p_weight;
	private String p_sweet;
	private String p_pack;

	public Product() {
	}

	public Product(int p_num, String u_num, String p_name, String p_grade, String p_price, String p_data, String p_option,
			String p_kind, String p_weight, String p_sweet, String p_pack) {
		super();
		this.p_num = p_num;
		this.u_num = u_num;
		this.p_name = p_name;
		this.p_grade = p_grade;
		this.p_price = p_price;
		this.p_data = p_data;
		this.p_option = p_option;
		this.p_kind = p_kind;
		this.p_weight = p_weight;
		this.p_sweet = p_sweet;
		this.p_pack = p_pack;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getU_num() {
		return u_num;
	}

	public void setU_num(String u_num) {
		this.u_num = u_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_grade() {
		return p_grade;
	}

	public void setP_grade(String p_grade) {
		this.p_grade = p_grade;
	}

	public String getP_price() {
		return p_price;
	}

	public void setP_price(String p_price) {
		this.p_price = p_price;
	}

	public String getP_data() {
		return p_data;
	}

	public void setP_data(String p_data) {
		this.p_data = p_data;
	}

	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}

	public String getP_kind() {
		return p_kind;
	}

	public void setP_kind(String p_kind) {
		this.p_kind = p_kind;
	}

	public String getP_weight() {
		return p_weight;
	}

	public void setP_weight(String p_weight) {
		this.p_weight = p_weight;
	}

	public String getP_sweet() {
		return p_sweet;
	}

	public void setP_sweet(String p_sweet) {
		this.p_sweet = p_sweet;
	}

	public String getP_pack() {
		return p_pack;
	}

	public void setP_pack(String p_pack) {
		this.p_pack = p_pack;
	}

}
