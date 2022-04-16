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
import com.model.Member;

import com.model.Pj;
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
 * 商品评价功能
 * @author Administrator
 *
 */
public class PjAction extends ActionSupport
{
	private Integer id;
	private String goodid;
	private String goodsaver;
	private String memberid;
	private String jb;
	private String msg;
	private String savetime;
	private String hf;
	private String ddid;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	
	//新增评价
	public String pjAdd(){
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		Pj pj = new Pj();
		pj.setGoodsaver(goodsaver);
		pj.setMsg(msg);
		pj.setMemberid(member.getId().toString());
		pj.setGoodid(goodid);
		pj.setJb(jb);
		pj.setSavetime(Info.getDateStr());
		pj.setHf("");
		pj.setDdid(ddid);
		commonDAO.save(pj);
		suc="评价成功";
		return "success";
	}
	//回复评价
	public String pjhf(){
		Pj pj = (Pj)commonDAO.findById(id, "Pj");
		pj.setHf(hf);
		ddid=ddid;
		commonDAO.update(pj);
		suc="评价回复成功";
		return "success";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodid() {
		return goodid;
	}
	public void setGoodid(String goodid) {
		this.goodid = goodid;
	}
	public String getGoodsaver() {
		return goodsaver;
	}
	public void setGoodsaver(String goodsaver) {
		this.goodsaver = goodsaver;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getJb() {
		return jb;
	}
	public void setJb(String jb) {
		this.jb = jb;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public String getHf() {
		return hf;
	}
	public void setHf(String hf) {
		this.hf = hf;
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
	public String getDdid() {
		return ddid;
	}
	public void setDdid(String ddid) {
		this.ddid = ddid;
	}
	
	
	
}
