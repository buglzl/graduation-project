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
import com.google.gson.Gson;

import com.model.Ppinfo;
import com.model.Protype;
import com.model.Sysuser;
import com.model.Yqlink;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

/**
 * 商品品牌管理功能
 * @author Administrator
 *
 */
public class PpinfoAction extends ActionSupport
{
	private Integer id;
	private String ppname;
	private String delstatus;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	
	//新增品牌
	public String ppinfoAdd(){
		Ppinfo ppinfo = new Ppinfo();
		ppinfo.setPpname(ppname);
		ppinfo.setDelstatus("0");
		commonDAO.save(ppinfo);
		suc="新增品牌成功";
		return "success";
	}
	//编辑品牌
	public String ppinfoEdit(){
		Ppinfo ppinfo = (Ppinfo)commonDAO.findById(id, "Ppinfo");
		ppinfo.setPpname(ppname);
		commonDAO.update(ppinfo);
		suc="编辑品牌成功";
		return "success";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPpname() {
		return ppname;
	}
	public void setPpname(String ppname) {
		this.ppname = ppname;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
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
