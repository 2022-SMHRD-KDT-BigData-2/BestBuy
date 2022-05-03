package kr.pro.entity;

//i_info(이미지)
public class Productimage {
	private int p_num;
	private int i_num;
	private String u_num;
	private String i_idx;
	private String i_raw;
	private String i_path;
	private String i_save;
	private String i_extension;
	private String i_size;
	private String i_grade;

	public Productimage() {
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getI_num() {
		return i_num;
	}

	public void setI_num(int i_num) {
		this.i_num = i_num;
	}

	public String getU_num() {
		return u_num;
	}

	public void setU_num(String u_num) {
		this.u_num = u_num;
	}

	public String getI_idx() {
		return i_idx;
	}

	public void setI_idx(String i_idx) {
		this.i_idx = i_idx;
	}

	public String getI_raw() {
		return i_raw;
	}

	public void setI_raw(String i_raw) {
		this.i_raw = i_raw;
	}

	public String getI_path() {
		return i_path;
	}

	public void setI_path(String i_path) {
		this.i_path = i_path;
	}

	public String getI_save() {
		return i_save;
	}

	public void setI_save(String i_save) {
		this.i_save = i_save;
	}

	public String getI_extension() {
		return i_extension;
	}

	public void setI_extension(String i_extension) {
		this.i_extension = i_extension;
	}

	public String getI_size() {
		return i_size;
	}

	public void setI_size(String i_size) {
		this.i_size = i_size;
	}

	public String getI_grade() {
		return i_grade;
	}

	public void setI_grade(String i_grade) {
		this.i_grade = i_grade;
	}

	@Override
	public String toString() {
		return "Productimage [p_num=" + p_num + ", i_num=" + i_num + ", u_num=" + u_num + ", i_idx=" + i_idx
				+ ", i_raw=" + i_raw + ", i_path=" + i_path + ", i_save=" + i_save + ", i_extension=" + i_extension
				+ ", i_size=" + i_size + ", i_grade=" + i_grade + "]";
	}

}