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
 * 商品分类管理功能
 * @author Administrator
 *
 */
public class ProtypeAction extends ActionSupport
{
	private Integer id;
	private String typename;
	private String fatherid;
	private String delstatus;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	
	//新增类别
	public String protypeAdd(){
		Protype protype = new Protype();
		protype.setTypename(typename);
		protype.setFatherid(fatherid);
		protype.setDelstatus("0");
		commonDAO.save(protype);
		suc="新增类别成功";
		return "success";
	}
	//编辑类别
	public String protypeEdit(){
		Protype protype = (Protype)commonDAO.findById(id, "Protype");
		protype.setTypename(typename);
		commonDAO.update(protype);
		suc="编辑类别成功";
		return "success";
	}
	
	//大类小类二联动AJAX
	 public void searchsontype() throws IOException
	 {
		    String xml = "";
		    ArrayList<Protype> list = (ArrayList<Protype>)commonDAO.findByHql("from Protype where fatherid='"+fatherid+"' and delstatus='0'");
			if(list.size()>0){
			    for(Protype protype:list){
			    	xml += "<option value='"+protype.getId()+"'>"+protype.getTypename()+"</option>";
				}
			}
	 		HttpServletResponse response=ServletActionContext.getResponse();
	 		response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
	 		PrintWriter out = response.getWriter();
	 		Gson gson = new Gson();
			String flag = gson.toJson(xml);
			out.write(flag);
	 		out.flush();
	 		out.close();
	 }
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getFatherid() {
		return fatherid;
	}
	public void setFatherid(String fatherid) {
		this.fatherid = fatherid;
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
