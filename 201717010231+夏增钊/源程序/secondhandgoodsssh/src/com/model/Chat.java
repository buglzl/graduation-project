package com.model;

/**
 * Chat entity. @author MyEclipse Persistence Tools
 */

public class Chat implements java.io.Serializable {

	// Fields

	private Integer id;
	private String msg;
	private String hfmsg;
	private String savetime;
	private String memberid;

	// Constructors

	/** default constructor */
	public Chat() {
	}

	/** full constructor */
	public Chat(String msg, String hfmsg, String savetime, String memberid) {
		this.msg = msg;
		this.hfmsg = hfmsg;
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

	public String getMsg() {
		return this.msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getHfmsg() {
		return this.hfmsg;
	}

	public void setHfmsg(String hfmsg) {
		this.hfmsg = hfmsg;
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