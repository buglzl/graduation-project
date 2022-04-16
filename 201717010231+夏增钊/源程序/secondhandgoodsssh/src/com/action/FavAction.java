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
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Car;
import com.model.Chat;
import com.model.Fav;
import com.model.Member;

import com.model.Sysuser;
import com.model.Yqlink;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;


/**
 * 用户收藏夹
 * @author Administrator
 *
 */
public class FavAction extends ActionSupport
{
	private Integer id;
	private String goodid;
	private String memberid;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	
	//添加商品到收藏夹
	public void favAdd(){
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		HttpServletResponse response=ServletActionContext.getResponse();
 		response.setContentType("text/html");
 		PrintWriter out;
		try {
			out = response.getWriter();
		
 		int responseContext;
		if(member==null){
			responseContext=1;
		}else{
			ArrayList cklist = (ArrayList)commonDAO.findByHql(" from Fav where memberid='"+member.getId()+"' and goodid='"+goodid+"'");
			if(cklist.size()==0){
				Fav fav = new Fav();
				fav.setGoodid(goodid);
				fav.setMemberid(member.getId().toString());
				commonDAO.save(fav);
			}
			responseContext = 0;
		}
 		out.println(responseContext);
 		out.flush();
 		out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String favDel(){
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		Fav fav = (Fav)commonDAO.findByHql("from Fav where goodid='"+goodid+"' and memberid='"+member.getId()+"'").get(0);
		commonDAO.delete(fav.getId(), "Fav");
		suc="";
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
