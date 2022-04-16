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
import com.model.Imgadv;

import com.model.Sysuser;
import com.model.Yqlink;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

/**
 * 广告图片功能
 * @author Administrator
 *
 */
public class ImgadvAction extends ActionSupport
{
	private Integer id;
	private String filename;
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
	
	//新增图片
	public String imgadvadd(){
		Imgadv imgadv = new Imgadv();
		String hz = upFileFileName.substring(upFileFileName.lastIndexOf(".")+1);
		String img = Info.getAutoId()+"."+hz;
		String filePath=ServletActionContext.getServletContext().getRealPath("upfile")+"/"+img;
		File targetFile=new File(filePath);
		upLoadFile(upFile,targetFile);
		imgadv.setFilename(img);
		commonDAO.save(imgadv);
		suc="新增图片广告成功";
		return "success";
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getFilename() {
		return filename;
	}



	public void setFilename(String filename) {
		this.filename = filename;
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
