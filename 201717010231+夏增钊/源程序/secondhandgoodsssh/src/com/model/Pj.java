package com.model;

/**
 * Pj entity. @author MyEclipse Persistence Tools
 */

public class Pj implements java.io.Serializable {

	// Fields

	private Integer id;
	private String goodid;
	private String goodsaver;
	private String memberid;
	private String jb;
	private String msg;
	private String savetime;
	private String hf;
	private String ddid;

	// Constructors

	/** default constructor */
	public Pj() {
	}

	/** full constructor */
	public Pj(String goodid, String goodsaver, String memberid, String jb,
			String msg, String savetime, String hf, String ddid) {
		this.goodid = goodid;
		this.goodsaver = goodsaver;
		this.memberid = memberid;
		this.jb = jb;
		this.msg = msg;
		this.savetime = savetime;
		this.hf = hf;
		this.ddid = ddid;
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

	public String getGoodsaver() {
		return this.goodsaver;
	}

	public void setGoodsaver(String goodsaver) {
		this.goodsaver = goodsaver;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getJb() {
		return this.jb;
	}

	public void setJb(String jb) {
		this.jb = jb;
	}

	public String getMsg() {
		return this.msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getHf() {
		return this.hf;
	}

	public void setHf(String hf) {
		this.hf = hf;
	}

	public String getDdid() {
		return this.ddid;
	}

	public void setDdid(String ddid) {
		this.ddid = ddid;
	}

}