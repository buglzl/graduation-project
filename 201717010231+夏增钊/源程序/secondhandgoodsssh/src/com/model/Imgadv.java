package com.model;

/**
 * Imgadv entity. @author MyEclipse Persistence Tools
 */

public class Imgadv implements java.io.Serializable {

	// Fields

	private Integer id;
	private String filename;

	// Constructors

	/** default constructor */
	public Imgadv() {
	}

	/** full constructor */
	public Imgadv(String filename) {
		this.filename = filename;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

}