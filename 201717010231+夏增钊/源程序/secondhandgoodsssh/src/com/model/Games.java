package com.model;

/**
 * Games entity. @author MyEclipse Persistence Tools
 */

public class Games implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String bstime;
	private String note;
	private String savetime;

	// Constructors

	/** default constructor */
	public Games() {
	}

	/** full constructor */
	public Games(String title, String bstime, String note, String savetime) {
		this.title = title;
		this.bstime = bstime;
		this.note = note;
		this.savetime = savetime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBstime() {
		return this.bstime;
	}

	public void setBstime(String bstime) {
		this.bstime = bstime;
	}

	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

}