package com.model;

/**
 * Fav entity. @author MyEclipse Persistence Tools
 */

public class Fav implements java.io.Serializable {

	// Fields

	private Integer id;
	private String goodid;
	private String memberid;

	// Constructors

	/** default constructor */
	public Fav() {
	}

	/** full constructor */
	public Fav(String goodid, String memberid) {
		this.goodid = goodid;
		this.memberid = memberid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGoodid() {
		return this.goodid;
	}

	public void setGoodid(String goodid) {
		this.goodid = goodid;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

}