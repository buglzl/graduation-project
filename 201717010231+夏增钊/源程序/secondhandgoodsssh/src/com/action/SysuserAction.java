package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

/**
 * 系统用户功能
 * @author Administrator
 *
 */
public class SysuserAction extends ActionSupport
{
	private int id;
	private String usertype;
	private String username;
	private String userpwd;
	private String realname;
	private String sex;
	private String idcard;
	private String tel;
	private String email;
	private String addr;
	private String delstatus;
	private String savetime;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	
	//管理员登陆
	public String adminLogin(){
		Map session= ServletActionContext.getContext().getSession();
		String hql="from Sysuser where username='"+username+"' and userpwd='"+userpwd+"' and delstatus='0' ";
		List adminList=commonDAO.findByHql(hql);
		if(adminList.size()!=0){
			Sysuser sysuser=(Sysuser)adminList.get(0);
			 session.put("admin", sysuser);
			 suc="";
			 return "success";
		}else{
			no="";
			return "erro";
		}
	}
	//后台用户修改密码
	public String adminPwdEdit(){
		Sysuser s = (Sysuser)commonDAO.findById(id, "Sysuser");
		if(!s.getUserpwd().equals(userpwd)){
			no="旧密码不正确";
			return "erro";
		}else{
			s.setUserpwd(userpwd);
			commonDAO.update(s);
			suc="密码修改成功";
			return "success";
		}
		
	}
	//新增系统用户前检查用户名唯一性 jqery
	 public void usernamecheck() throws IOException
	 {
	    	 ArrayList<Sysuser> list = (ArrayList<Sysuser>)commonDAO.findByHql("from Sysuser where username='"+username+"' and delstatus='0' ");
	    	 int responseContext;
	    	 if(list.size()==0){
	    		 responseContext = 0;
	    	 }else{
	    		 responseContext=1;
	    	 }
	 		HttpServletResponse response=ServletActionContext.getResponse();
	 		response.setContentType("text/html");
	 		PrintWriter out = response.getWriter();
	 		out.println(responseContext);
	 		out.flush();
	 		out.close();
	 }
	
	//新增系统用户
	public String useradd(){
		Sysuser s = new Sysuser();
		s.setUsername(username);
		s.setUserpwd(userpwd);
		s.setUsertype(usertype);
		s.setRealname(realname);
		s.setSex(sex);
		s.setIdcard(idcard);
		s.setTel(tel);
		s.setEmail(email);
		s.setAddr(addr);
		s.setSavetime(Info.getDateStr());
		s.setDelstatus("0");
		commonDAO.save(s);
		suc="新增系统用户成功";
		return "success";
	}
	//编辑系统用户
	public String useredit(){
		Sysuser s = (Sysuser)commonDAO.findById(id, "Sysuser");
		s.setUserpwd(userpwd);
		s.setUsertype(usertype);
		s.setRealname(realname);
		s.setSex(sex);
		s.setIdcard(idcard);
		s.setTel(tel);
		s.setEmail(email);
		s.setAddr(addr);
		commonDAO.update(s);
		suc="编辑系统用户成功";
		return "success";
	}
	
	
	//用户退出
	public String memberExit(){
		Map session= ServletActionContext.getContext().getSession();
		session.remove("member");
		return "success";
	}
	
	//管理员退出
	public String adminExit(){
		Map session= ServletActionContext.getContext().getSession();
		session.remove("admin");
		return "success";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
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
