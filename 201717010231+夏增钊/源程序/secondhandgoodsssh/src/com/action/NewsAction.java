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
import com.model.News;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

/**
 * 站内资讯功能
 * @author Administrator
 *
 */
public class NewsAction extends ActionSupport
{
	private Integer id;
	private String title;
	private String note;
	private String img;
	private String savetime;
	private String type;
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
	
	//新增资讯
	public String newsadd(){
		News news = new News();
		news.setTitle(title);
		news.setNote(note);
		news.setSavetime(Info.getDateStr());
		news.setType("新闻");
		String hz = upFileFileName.substring(upFileFileName.lastIndexOf(".")+1);
		String img = Info.getAutoId()+"."+hz;
		String filePath=ServletActionContext.getServletContext().getRealPath("upfile")+"/"+img;
		File targetFile=new File(filePath);
		upLoadFile(upFile,targetFile);
		news.setImg(img);
		commonDAO.save(news);
		suc="新增信息成功";
		return "success";
	}
	//编辑资讯
	public String newsedit(){
		News news = (News)commonDAO.findById(id, "News");
		news.setTitle(title);
		news.setNote(note);
		if(!upFileFileName.equals("")){
			String hz = upFileFileName.substring(upFileFileName.lastIndexOf(".")+1);
			String img = Info.getAutoId()+"."+hz;
			String filePath=ServletActionContext.getServletContext().getRealPath("upfile")+"/"+img;
			File targetFile=new File(filePath);
			upLoadFile(upFile,targetFile);
			news.setImg(img);
		}
		commonDAO.update(news);
		suc="编辑信息成功";
		return "success";
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public static int getFileSize() {
		return FILE_SIZE;
	}
	
	
}
