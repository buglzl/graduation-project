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

import com.model.Sysuser;
import com.model.Yqlink;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

/**
 * 友情链接功能
 * @author Administrator
 *
 */
public class YqlinkAction extends ActionSupport
{
	private Integer id;
	private String linkname;
	private String linkurl;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	
	//新增友情链接
	public String yqlinkadd(){
		Yqlink yqlink = new Yqlink();
		yqlink.setLinkname(linkname);
		yqlink.setLinkurl(linkurl);
		commonDAO.save(yqlink);
		suc="新增友情链接成功";
		return "success";
	}
	//编辑友情链接
	public String yqlinkedit(){
		Yqlink yqlink = (Yqlink)commonDAO.findById(id, "Yqlink");
		yqlink.setLinkname(linkname);
		yqlink.setLinkurl(linkurl);
		commonDAO.update(yqlink);
		suc="编辑友情链接成功";
		return "success";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLinkname() {
		return linkname;
	}

	public void setLinkname(String linkname) {
		this.linkname = linkname;
	}

	public String getLinkurl() {
		return linkurl;
	}

	public void setLinkurl(String linkurl) {
		this.linkurl = linkurl;
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
