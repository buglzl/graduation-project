package com.model;

/**
 * Gamebm entity. @author MyEclipse Persistence Tools
 */

public class Gamebm implements java.io.Serializable {

	// Fields

	private Integer id;
	private String mid;
	private String bsid;

	// Constructors

	/** default constructor */
	public Gamebm() {
	}

	/** full constructor */
	public Gamebm(String mid, String bsid) {
		this.mid = mid;
		this.bsid = bsid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMid() {
		return this.mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getBsid() {
		return this.bsid;
	}

	public void setBsid(String bsid) {
		this.bsid = bsid;
	}

}