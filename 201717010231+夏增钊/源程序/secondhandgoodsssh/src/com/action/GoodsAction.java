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
import com.model.Goods;
import com.model.Member;

import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;

/**
 * 商品管理功能
 * @author Administrator
 *
 */
public class GoodsAction extends ActionSupport
{
	private Integer id;
	private String goodno;
	private String goodname;
	private String fid;
	private String sid;
	private String price;
	private String note;
	private String saver;
	private String savetime;
	private String shstatus;
	private String istj;
	private String tprice;
	private String filename;
	private String delstatus;
	private String salestatus;
	private String fhfs;
	private String goodpp;
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
	
	//新增商品
	public String goodsadd(){
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		Goods goods = new Goods();
		goods.setGoodno(Info.getAutoId());
		goods.setGoodname(goodname);
		goods.setFid(fid);
		goods.setSid(sid);
		goods.setGoodpp(goodpp);
		goods.setPrice(price);
		goods.setNote(note);
		goods.setIstj("no");
		goods.setFhfs(fhfs);
		goods.setCs(0);
		goods.setSavetime(Info.getDateStr());
		goods.setShstatus("待审核");
		goods.setDelstatus("0");
		goods.setSaver(member.getId().toString());
		String hz = upFileFileName.substring(upFileFileName.lastIndexOf(".")+1);
		String img = Info.getAutoId()+"."+hz;
		String filePath=ServletActionContext.getServletContext().getRealPath("upfile")+"/"+img;
		File targetFile=new File(filePath);
		upLoadFile(upFile,targetFile);
		goods.setFilename(img);
		commonDAO.save(goods);
		suc="新增商品成功";
		return "success";
	}
	//编辑商品
	public String goodsedit(){
		Goods goods = (Goods)commonDAO.findById(id, "Goods");
		goods.setGoodname(goodname);
		goods.setFid(fid);
		goods.setSid(sid);
		goods.setGoodpp(goodpp);
		goods.setPrice(price);
		goods.setFhfs(fhfs);
		goods.setNote(note);
		if(!upFileFileName.equals("")){
			String hz = upFileFileName.substring(upFileFileName.lastIndexOf(".")+1);
			String img = Info.getAutoId()+"."+hz;
			String filePath=ServletActionContext.getServletContext().getRealPath("upfile")+"/"+img;
			File targetFile=new File(filePath);
			upLoadFile(upFile,targetFile);
			goods.setFilename(img);
		}
		commonDAO.update(goods);
		suc="编辑商品成功";
		return "success";
	}
	
	//编辑商品
	public String admingoodsedit(){
		Goods goods = (Goods)commonDAO.findById(id, "Goods");
		goods.setGoodname(goodname);
		goods.setFid(fid);
		goods.setSid(sid);
		goods.setGoodpp(goodpp);
		goods.setPrice(price);
		goods.setNote(note);
		goods.setFhfs(fhfs);
		if(!upFileFileName.equals("")){
			String hz = upFileFileName.substring(upFileFileName.lastIndexOf(".")+1);
			String img = Info.getAutoId()+"."+hz;
			String filePath=ServletActionContext.getServletContext().getRealPath("upfile")+"/"+img;
			File targetFile=new File(filePath);
			upLoadFile(upFile,targetFile);
			goods.setFilename(img);
		}
		commonDAO.update(goods);
		suc="编辑商品成功";
		return "success";
	}
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGoodno() {
		return goodno;
	}

	public void setGoodno(String goodno) {
		this.goodno = goodno;
	}

	public String getGoodname() {
		return goodname;
	}

	public void setGoodname(String goodname) {
		this.goodname = goodname;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getSaver() {
		return saver;
	}

	public void setSaver(String saver) {
		this.saver = saver;
	}

	public String getSavetime() {
		return savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getShstatus() {
		return shstatus;
	}

	public void setShstatus(String shstatus) {
		this.shstatus = shstatus;
	}

	public String getIstj() {
		return istj;
	}

	public void setIstj(String istj) {
		this.istj = istj;
	}

	public String getTprice() {
		return tprice;
	}

	public void setTprice(String tprice) {
		this.tprice = tprice;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getDelstatus() {
		return delstatus;
	}

	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}

	public String getSalestatus() {
		return salestatus;
	}

	public void setSalestatus(String salestatus) {
		this.salestatus = salestatus;
	}

	public String getGoodpp() {
		return goodpp;
	}

	public void setGoodpp(String goodpp) {
		this.goodpp = goodpp;
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

	public String getFhfs() {
		return fhfs;
	}

	public void setFhfs(String fhfs) {
		this.fhfs = fhfs;
	}
	
	
	
	
}
