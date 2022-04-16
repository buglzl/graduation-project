package com.model;

/**
 * Dddetail entity. @author MyEclipse Persistence Tools
 */

public class Dddetail implements java.io.Serializable {

	// Fields

	private Integer id;
	private String ddno;
	private String goodno;
	private String goodid;
	private Integer sl;
	private String total;
	private String fhstatus;
	private String fkstatus;
	private String shstatus;
	private String zffs;
	private String savetime;
	private String ckstatus;
	private String delstatus;

	// Constructors

	/** default constructor */
	public Dddetail() {
	}

	/** full constructor */
	public Dddetail(String ddno, String goodno, String goodid, Integer sl,
			String total, String fhstatus, String fkstatus, String shstatus,
			String zffs, String savetime, String ckstatus, String delstatus) {
		this.ddno = ddno;
		this.goodno = goodno;
		this.goodid = goodid;
		this.sl = sl;
		this.total = total;
		this.fhstatus = fhstatus;
		this.fkstatus = fkstatus;
		this.shstatus = shstatus;
		this.zffs = zffs;
		this.savetime = savetime;
		this.ckstatus = ckstatus;
		this.delstatus = delstatus;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDdno() {
		return this.ddno;
	}

	public void setDdno(String ddno) {
		this.ddno = ddno;
	}

	public String getGoodno() {
		return this.goodno;
	}

	public void setGoodno(String goodno) {
		this.goodno = goodno;
	}

	public String getGoodid() {
		return this.goodid;
	}

	public void setGoodid(String goodid) {
		this.goodid = goodid;
	}

	public Integer getSl() {
		return this.sl;
	}

	public void setSl(Integer sl) {
		this.sl = sl;
	}

	public String getTotal() {
		return this.total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getFhstatus() {
		return this.fhstatus;
	}

	public void setFhstatus(String fhstatus) {
		this.fhstatus = fhstatus;
	}

	public String getFkstatus() {
		return this.fkstatus;
	}

	public void setFkstatus(String fkstatus) {
		this.fkstatus = fkstatus;
	}

	public String getShstatus() {
		return this.shstatus;
	}

	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}

	public String getZffs() {
		return this.zffs;
	}

	public void setZffs(String zffs) {
		this.zffs = zffs;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getCkstatus() {
		return this.ckstatus;
	}

	public void setCkstatus(String ckstatus) {
		this.ckstatus = ckstatus;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

}