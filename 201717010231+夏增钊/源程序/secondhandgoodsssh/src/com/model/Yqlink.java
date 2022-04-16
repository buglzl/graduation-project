package com.model;

/**
 * Yqlink entity. @author MyEclipse Persistence Tools
 */

public class Yqlink implements java.io.Serializable {

	// Fields

	private Integer id;
	private String linkname;
	private String linkurl;

	// Constructors

	/** default constructor */
	public Yqlink() {
	}

	/** full constructor */
	public Yqlink(String linkname, String linkurl) {
		this.linkname = linkname;
		this.linkurl = linkurl;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLinkname() {
		return this.linkname;
	}

	public void setLinkname(String linkname) {
		this.linkname = linkname;
	}

	public String getLinkurl() {
		return this.linkurl;
	}

	public void setLinkurl(String linkurl) {
		this.linkurl = linkurl;
	}

}