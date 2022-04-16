package com.model;

/**
 * Member entity. @author MyEclipse Persistence Tools
 */

public class Member implements java.io.Serializable {

	// Fields

	private Integer id;
	private String uname;
	private String upass;
	private String email;
	private String tname;
	private String sex;
	private String addr;
	private String sheng;
	private String shi;
	private String qq;
	private String tel;
	private String delstatus;
	private String savetime;
	private String img;
	private String yue;
	private String shstatus;
	private String qianming;

	// Constructors

	/** default constructor */
	public Member() {
	}

	/** full constructor */
	public Member(String uname, String upass, String email, String tname,
			String sex, String addr, String sheng, String shi, String qq,
			String tel, String delstatus, String savetime, String img,
			String yue, String shstatus, String qianming) {
		this.uname = uname;
		this.upass = upass;
		this.email = email;
		this.tname = tname;
		this.sex = sex;
		this.addr = addr;
		this.sheng = sheng;
		this.shi = shi;
		this.qq = qq;
		this.tel = tel;
		this.delstatus = delstatus;
		this.savetime = savetime;
		this.img = img;
		this.yue = yue;
		this.shstatus = shstatus;
		this.qianming = qianming;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return this.upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTname() {
		return this.tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getSheng() {
		return this.sheng;
	}

	public void setSheng(String sheng) {
		this.sheng = sheng;
	}

	public String getShi() {
		return this.shi;
	}

	public void setShi(String shi) {
		this.shi = shi;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getYue() {
		return this.yue;
	}

	public void setYue(String yue) {
		this.yue = yue;
	}

	public String getShstatus() {
		return this.shstatus;
	}

	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}

	public String getQianming() {
		return this.qianming;
	}

	public void setQianming(String qianming) {
		this.qianming = qianming;
	}

}