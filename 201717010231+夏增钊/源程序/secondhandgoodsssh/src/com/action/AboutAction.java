package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.About;

import com.model.Sysuser;
import com.model.Yqlink;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

public class AboutAction extends ActionSupport
{
	private Integer id;
	private String lxr;
	private String tel;
	private String addr;
	private String note;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	
	//编辑使用指南
	public String aboutedit(){
		About about = (About)commonDAO.findById(id, "About");
		about.setLxr(lxr);
		about.setTel(tel);
		about.setAddr(addr);
		about.setNote(note);
		commonDAO.update(about);
		suc="保存信息成功";
		return "success";
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getLxr() {
		return lxr;
	}



	public void setLxr(String lxr) {
		this.lxr = lxr;
	}



	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getAddr() {
		return addr;
	}



	public void setAddr(String addr) {
		this.addr = addr;
	}



	public String getNote() {
		return note;
	}



	public void setNote(String note) {
		this.note = note;
	}



	public String getSuc() {
		return suc;
	}



	public void setSuc(String suc) {
		this.suc = suc;
	}



	public String getNo() {
		return no;
	}



	public void setNo(String no) {
		this.no = no;
	}



	public int getIndex() {
		return index;
	}



	public void setIndex(int index) {
		this.index = index;
	}



	public CommonDAO getCommonDAO() {
		return commonDAO;
	}



	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}
	

	
}
