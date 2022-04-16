package com.model;

/**
 * Qiugou entity. @author MyEclipse Persistence Tools
 */

public class Qiugou implements java.io.Serializable {

	// Fields

	private Integer id;
	private String goodsname;
	private String num;
	private String content;
	private String savetime;
	private String memberid;

	// Constructors

	/** default constructor */
	public Qiugou() {
	}

	/** full constructor */
	public Qiugou(String goodsname, String num, String content,
			String savetime, String memberid) {
		this.goodsname = goodsname;
		this.num = num;
		this.content = content;
		this.savetime = savetime;
		this.memberid = memberid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGoodsname() {
		return this.goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

}