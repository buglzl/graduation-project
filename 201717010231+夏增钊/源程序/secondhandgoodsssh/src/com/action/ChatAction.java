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
import com.model.Chat;

import com.model.Sysuser;
import com.model.Yqlink;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

/**
 * 在线留言功能
 * @author Administrator
 *
 */
public class ChatAction extends ActionSupport
{
	private Integer id;
	private String msg;
	private String hfmsg;
	private String savetime;
	private String memberid;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	
	//新增留言
	public String chatadd(){
		Chat chat = new Chat();
		chat.setMsg(msg);
		chat.setMemberid(memberid);
		chat.setSavetime(Info.getDateStr());
		chat.setHfmsg("");
		commonDAO.save(chat);
		suc="留言成功成功";
		return "success";
	}
	//回复留言
	public String chatedit(){
		Chat chat = (Chat)commonDAO.findById(id, "Chat");
		chat.setHfmsg(hfmsg);
		commonDAO.update(chat);
		suc="留言回复成功";
		return "success";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getHfmsg() {
		return hfmsg;
	}
	public void setHfmsg(String hfmsg) {
		this.hfmsg = hfmsg;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
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
