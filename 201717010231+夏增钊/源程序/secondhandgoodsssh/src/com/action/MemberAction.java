package com.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
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
import com.model.Member;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;

/**
 * 用户信息功能
 * @author Administrator
 *
 */
public class MemberAction extends ActionSupport
{
	private Integer id;
	private String uname;
	private String upass;
	private String email;
	private String tname;
	private String sex;
	private String addr;
	private String idcard;
	private String xuehao;
	private String xuexiao;
	private String zhuanye;
	private String qq;
	private String tel;
	private String delstatus;
	private String savetime;
	private String sheng;
	private String shi;
	private String qu;
	private int jine;
	private String qianming;
	private String yzm;
	
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	private File upFile;
	private String upFileContentType;
	private String upFileFileName;
	private static final int FILE_SIZE=16*1024;
	
	
	
	//文件上传
	public void upLoadFile(File source,File target){
		  InputStream in=null;
		  OutputStream out=null;
		  try{
		   in=new BufferedInputStream(new FileInputStream(source),FILE_SIZE);
		   out=new BufferedOutputStream(new FileOutputStream(target),FILE_SIZE);
		   byte[] image=new byte[FILE_SIZE];
		   while(in.read(image)>0){
		    out.write(image);
		   }
		  }catch(IOException ex){
		   ex.printStackTrace();
		  }finally{
		   try{
		    in.close();
		    out.close();
		   }catch(IOException ex){
		    
		   }
		  }
		 }
	
	//用户登陆
	public String memberLogin(){
		Map session= ServletActionContext.getContext().getSession();
		String hql="from Member where uname='"+uname+"' and upass='"+upass+"' and delstatus='0' and shstatus='通过' ";
		List adminList=commonDAO.findByHql(hql);
		if(adminList.size()!=0){
			Member member=(Member)adminList.get(0);
			 session.put("member", member);
			 suc="";
			 return "success";
			 
		}else{
			suc="用户名密码错误";
			return "error";
		} 
	}
	//新增系统用户前检查用户名唯一性 jqery
	 public void usernamecheck() throws IOException
	 {
	    	 ArrayList<Member> list = (ArrayList<Member>)commonDAO.findByHql("from Member where uname='"+uname+"' and delstatus='0' ");
	    	 int responseContext;
	    	 System.out.println(list.size());
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
	
	//新用户注册
	public String memberReg(){
		Member mb = new Member();
		mb.setUname(uname);
		mb.setUpass(upass);
		mb.setTname(tname);
		mb.setEmail(email);
		mb.setSex(sex);
		mb.setAddr(addr);
		mb.setTel(tel);
		mb.setQq(qq);
		mb.setDelstatus("0");
		mb.setSavetime(Info.getDateStr());
		mb.setSheng(sheng);
		mb.setShi(shi);
	    mb.setShstatus("待审核");
		mb.setQq(qq);
		mb.setYue("0");
		mb.setQianming(qianming);
		
		String hz = upFileFileName.substring(upFileFileName.lastIndexOf(".")+1);
		String img = Info.getAutoId()+"."+hz;
		String filePath=ServletActionContext.getServletContext().getRealPath("upfile")+"/"+img;
		File targetFile=new File(filePath);
		upLoadFile(upFile,targetFile);
		mb.setImg(img);
		
		commonDAO.save(mb);
		suc="注册成功";
		return "success";
	}
	//用户修改资料
	public String memberEdit(){
		Member mb = (Member)commonDAO.findById(id, "Member");
		mb.setUpass(upass);
		mb.setTname(tname);
		mb.setEmail(email);
		mb.setSex(sex);
		mb.setAddr(addr);
		mb.setTel(tel);
		mb.setQq(qq);
		mb.setSheng(sheng);
		mb.setShi(shi);
		mb.setQianming(qianming);
		if(!upFileFileName.equals("")){
			String hz = upFileFileName.substring(upFileFileName.lastIndexOf(".")+1);
			String img = Info.getAutoId()+"."+hz;
			String filePath=ServletActionContext.getServletContext().getRealPath("upfile")+"/"+img;
			File targetFile=new File(filePath);
			upLoadFile(upFile,targetFile);
			mb.setImg(img);
		}
		commonDAO.update(mb);
		suc="修改资料成功";
		return "success";
	}
	
	
	//用户退出
	public String memberExit(){
		Map session= ServletActionContext.getContext().getSession();
		session.remove("member");
		return "success";
	}
	
	
	
	
	public String chongzhiAdd(){
		Member mb = (Member)commonDAO.findById(id, "Member");
		double a = Double.parseDouble(mb.getYue())+Double.parseDouble(String.valueOf(jine));
		mb.setYue(String.valueOf(a));
		commonDAO.update(mb);
		suc="充值成功";
		return "success";
	}
	
	//找回密码
	public String finduPass(){
		Map session = ServletActionContext.getContext().getSession();
		if(yzm.equals(session.get("validcode"))){
		String hql="from Member where uname='"+uname+"' and tel='"+tel+"'";
		ArrayList<Member> list=(ArrayList<Member>)commonDAO.findByHql(hql);
		if(list.size()==1){
			 suc="找回成功!&nbsp;&nbsp;&nbsp;&nbsp;密码为:"+list.get(0).getUpass();
		}else{
			suc="输入信息不正确";
		}
		return "success";
		}else{
			suc="验证码输入有误";
			return "success";
		}
	}
	
	
	
	
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getXuehao() {
		return xuehao;
	}
	public void setXuehao(String xuehao) {
		this.xuehao = xuehao;
	}
	public String getXuexiao() {
		return xuexiao;
	}
	public void setXuexiao(String xuexiao) {
		this.xuexiao = xuexiao;
	}
	public String getZhuanye() {
		return zhuanye;
	}
	public void setZhuanye(String zhuanye) {
		this.zhuanye = zhuanye;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
	public File getUpFile() {
		return upFile;
	}
	public void setUpFile(File upFile) {
		this.upFile = upFile;
	}
	public String getUpFileContentType() {
		return upFileContentType;
	}
	public void setUpFileContentType(String upFileContentType) {
		this.upFileContentType = upFileContentType;
	}
	public String getUpFileFileName() {
		return upFileFileName;
	}
	public void setUpFileFileName(String upFileFileName) {
		this.upFileFileName = upFileFileName;
	}

	public int getJine() {
		return jine;
	}

	public void setJine(int jine) {
		this.jine = jine;
	}

	public static int getFileSize() {
		return FILE_SIZE;
	}

	public String getSheng() {
		return sheng;
	}

	public void setSheng(String sheng) {
		this.sheng = sheng;
	}

	public String getShi() {
		return shi;
	}

	public void setShi(String shi) {
		this.shi = shi;
	}

	public String getQu() {
		return qu;
	}

	public void setQu(String qu) {
		this.qu = qu;
	}

	public String getQianming() {
		return qianming;
	}

	public void setQianming(String qianming) {
		this.qianming = qianming;
	}

	public String getYzm() {
		return yzm;
	}

	public void setYzm(String yzm) {
		this.yzm = yzm;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
