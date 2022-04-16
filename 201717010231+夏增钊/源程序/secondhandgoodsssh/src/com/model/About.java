package com.model;

/**
 * About entity. @author MyEclipse Persistence Tools
 */

public class About implements java.io.Serializable {

	// Fields

	private Integer id;
	private String lxr;
	private String tel;
	private String addr;
	private String note;

	// Constructors

	/** default constructor */
	public About() {
	}

	/** full constructor */
	public About(String lxr, String tel, String addr, String note) {
		this.lxr = lxr;
		this.tel = tel;
		this.addr = addr;
		this.note = note;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLxr() {
		return this.lxr;
	}

	public void setLxr(String lxr) {
		this.lxr = lxr;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}