package com.model;

/**
 * Siteinfo entity. @author MyEclipse Persistence Tools
 */

public class Siteinfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String logoimg;
	private String sitenamefont;
	private String sitenameback;
	private String tel;
	private String addr;
	private String note;

	// Constructors

	/** default constructor */
	public Siteinfo() {
	}

	/** full constructor */
	public Siteinfo(String logoimg, String sitenamefont, String sitenameback,
			String tel, String addr, String note) {
		this.logoimg = logoimg;
		this.sitenamefont = sitenamefont;
		this.sitenameback = sitenameback;
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

	public String getLogoimg() {
		return this.logoimg;
	}

	public void setLogoimg(String logoimg) {
		this.logoimg = logoimg;
	}

	public String getSitenamefont() {
		return this.sitenamefont;
	}

	public void setSitenamefont(String sitenamefont) {
		this.sitenamefont = sitenamefont;
	}

	public String getSitenameback() {
		return this.sitenameback;
	}

	public void setSitenameback(String sitenameback) {
		this.sitenameback = sitenameback;
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