package com.model;

/**
 * Addr entity. @author MyEclipse Persistence Tools
 */

public class Addr implements java.io.Serializable {

	// Fields

	private Integer id;
	private String shr;
	private String shrtel;
	private String shraddr;
	private String memberid;
	private String delstatus;

	// Constructors

	/** default constructor */
	public Addr() {
	}

	/** full constructor */
	public Addr(String shr, String shrtel, String shraddr, String memberid,
			String delstatus) {
		this.shr = shr;
		this.shrtel = shrtel;
		this.shraddr = shraddr;
		this.memberid = memberid;
		this.delstatus = delstatus;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getShr() {
		return this.shr;
	}

	public void setShr(String shr) {
		this.shr = shr;
	}

	public String getShrtel() {
		return this.shrtel;
	}

	public void setShrtel(String shrtel) {
		this.shrtel = shrtel;
	}

	public String getShraddr() {
		return this.shraddr;
	}

	public void setShraddr(String shraddr) {
		this.shraddr = shraddr;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

}