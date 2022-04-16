package com.model;

/**
 * Ddinfo entity. @author MyEclipse Persistence Tools
 */

public class Ddinfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String ddno;
	private String memberid;
	private String ddprice;
	private String fhstatus;
	private String savetime;
	private String shstatus;
	private String wlinfo;
	private String fkstatus;
	private String shrname;
	private String shrtel;
	private String shraddr;
	private String thstatus;
	private String zffs;
	private String saverid;
	private String delstatus;

	// Constructors

	/** default constructor */
	public Ddinfo() {
	}

	/** full constructor */
	public Ddinfo(String ddno, String memberid, String ddprice,
			String fhstatus, String savetime, String shstatus, String wlinfo,
			String fkstatus, String shrname, String shrtel, String shraddr,
			String thstatus, String zffs, String saverid, String delstatus) {
		this.ddno = ddno;
		this.memberid = memberid;
		this.ddprice = ddprice;
		this.fhstatus = fhstatus;
		this.savetime = savetime;
		this.shstatus = shstatus;
		this.wlinfo = wlinfo;
		this.fkstatus = fkstatus;
		this.shrname = shrname;
		this.shrtel = shrtel;
		this.shraddr = shraddr;
		this.thstatus = thstatus;
		this.zffs = zffs;
		this.saverid = saverid;
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

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getDdprice() {
		return this.ddprice;
	}

	public void setDdprice(String ddprice) {
		this.ddprice = ddprice;
	}

	public String getFhstatus() {
		return this.fhstatus;
	}

	public void setFhstatus(String fhstatus) {
		this.fhstatus = fhstatus;
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

	public String getWlinfo() {
		return this.wlinfo;
	}

	public void setWlinfo(String wlinfo) {
		this.wlinfo = wlinfo;
	}

	public String getFkstatus() {
		return this.fkstatus;
	}

	public void setFkstatus(String fkstatus) {
		this.fkstatus = fkstatus;
	}

	public String getShrname() {
		return this.shrname;
	}

	public void setShrname(String shrname) {
		this.shrname = shrname;
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

	public String getThstatus() {
		return this.thstatus;
	}

	public void setThstatus(String thstatus) {
		this.thstatus = thstatus;
	}

	public String getZffs() {
		return this.zffs;
	}

	public void setZffs(String zffs) {
		this.zffs = zffs;
	}

	public String getSaverid() {
		return this.saverid;
	}

	public void setSaverid(String saverid) {
		this.saverid = saverid;
	}

	public String getDelstatus() {
		return this.delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

}