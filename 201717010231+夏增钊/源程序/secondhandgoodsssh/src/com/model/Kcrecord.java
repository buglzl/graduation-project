package com.model;

/**
 * Kcrecord entity. @author MyEclipse Persistence Tools
 */

public class Kcrecord implements java.io.Serializable {

	// Fields

	private Integer id;
	private String gid;
	private Integer happennum;
	private String type;
	private String savetime;
	private String flag;

	// Constructors

	/** default constructor */
	public Kcrecord() {
	}

	/** full constructor */
	public Kcrecord(String gid, Integer happennum, String type,
			String savetime, String flag) {
		this.gid = gid;
		this.happennum = happennum;
		this.type = type;
		this.savetime = savetime;
		this.flag = flag;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGid() {
		return this.gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public Integer getHappennum() {
		return this.happennum;
	}

	public void setHappennum(Integer happennum) {
		this.happennum = happennum;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getFlag() {
		return this.flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

}