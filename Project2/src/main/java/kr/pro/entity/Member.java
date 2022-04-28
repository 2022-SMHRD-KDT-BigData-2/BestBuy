package kr.pro.entity;
//i_info(회원)
public class Member {
	private String u_id;
	private String u_pw;
	private String u_nick;
	private String u_pnum;
	private String u_add;
	private String u_num;

	public Member() {
	}

	public Member(String u_num) {
		super();
		this.u_num = u_num;
	}

	public Member(String u_id, String u_pw) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
	}

	public Member(String u_id, String u_pw, String u_nick, String u_pnum, String u_add) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_nick = u_nick;
		this.u_pnum = u_pnum;
		this.u_add = u_add;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_nick() {
		return u_nick;
	}

	public void setU_nick(String u_nick) {
		this.u_nick = u_nick;
	}

	public String getU_pnum() {
		return u_pnum;
	}

	public void setU_pnum(String u_pnum) {
		this.u_pnum = u_pnum;
	}

	public String getU_add() {
		return u_add;
	}

	public void setU_add(String u_add) {
		this.u_add = u_add;
	}

	public String getU_num() {
		return u_num;
	}

	public void setU_num(String u_num) {
		this.u_num = u_num;
	}

}