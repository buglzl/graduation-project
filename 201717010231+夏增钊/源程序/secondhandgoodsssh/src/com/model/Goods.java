package com.model;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */

public class Goods implements java.io.Serializable {

	// Fields

	private Integer id;
	private String goodno;
	private String goodname;
	private String fid;
	private String sid;
	private String price;
	private String note;
	private String saver;
	private String savetime;
	private String shstatus;
	private String istj;
	private String fhfs;
	private String filename;
	private String delstatus;
	private String salestatus;
	private String goodpp;
	private Integer cs;

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** full constructor */
	public Goods(String goodno, String goodname, String fid, String sid,
			String price, String note, String saver, String savetime,
			String shstatus, String istj, String fhfs, String filename,
			String delstatus, String salestatus, String goodpp, Integer cs) {
		this.goodno = goodno;
		this.goodname = goodname;
		this.fid = fid;
		this.sid = sid;
		this.price = price;
		this.note = note;
		this.saver = saver;
		this.savetime = savetime;
		this.shstatus = shstatus;
		this.istj = istj;
		this.fhfs = fhfs;
		this.filename = filename;
		this.delstatus = delstatus;
		this.salestatus = salestatus;
		this.goodpp = goodpp;
		this.cs = cs;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGoodno() {
		return this.goodno;
	}

	public void setGoodno(String goodno) {
		this.goodno = goodno;
	}

	public String getGoodname() {
		return this.goodname;
	}

	public void setGoodname(String goodname) {
		this.goodname = goodname;
	}

	public String getFid() {
		return this.fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getSid() {
		return this.sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getPrice() {
		return this.price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getSaver() {
		return this.saver;
	}

	public void setSaver(String saver) {
		this.saver = saver;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getShstatus() {
		return this.shstatus;
	}

	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}

	public String getIstj() {
		return this.istj;
	}

	public void setIstj(String istj) {
		this.istj = istj;
	}

	public String getFhfs() {
		return this.fhfs;
	}

	public void setFhfs(String fhfs) {
		this.fhfs = fhfs;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

	public String getSalestatus() {
		return this.salestatus;
	}

	public void setSalestatus(String salestatus) {
		this.salestatus = salestatus;
	}

	public String getGoodpp() {
		return this.goodpp;
	}

	public void setGoodpp(String goodpp) {
		this.goodpp = goodpp;
	}

	public Integer getCs() {
		return this.cs;
	}

	public void setCs(Integer cs) {
		this.cs = cs;
	}

}