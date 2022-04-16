package com.model;

/**
 * Ppinfo entity. @author MyEclipse Persistence Tools
 */

public class Ppinfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String ppname;
	private String delstatus;

	// Constructors

	/** default constructor */
	public Ppinfo() {
	}

	/** full constructor */
	public Ppinfo(String ppname, String delstatus) {
		this.ppname = ppname;
		this.delstatus = delstatus;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPpname() {
		return this.ppname;
	}

	public void setPpname(String ppname) {
		this.ppname = ppname;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

}