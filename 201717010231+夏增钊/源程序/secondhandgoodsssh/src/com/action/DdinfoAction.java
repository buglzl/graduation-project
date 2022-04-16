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
import com.model.Car;
import com.model.Dddetail;
import com.model.Ddinfo;
import com.model.Goods;

import com.model.Kcrecord;
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
 * 功能功能
 * @author Administrator
 *
 */
public class DdinfoAction extends ActionSupport
{
	private Integer id;
	private String ddno;
	private String memberid;
	private String ddprice;
	private String fhstatus;
	private String savetime;
	private String shstatus;
	private String wlinfo;
	private String fkstatus;
	private String shrname;
	private String shrtel;
	private String shraddr;
	private String zffs;
	private String zktotalprice;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	private String wlcompany;
	private String wlno;
	private String goodid;
	private String sl;
	private String isjfdk;
	private String gid;
	private String ddid;
	private String qsid;
	
	//创建订单
	public String createdd(){
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		Member m = (Member)commonDAO.findById(member.getId(), "Member");
		
		boolean flag = true;
		if(Double.parseDouble(m.getYue())>=Double.parseDouble(zktotalprice)&&zffs.equals("在线支付")){
			m.setYue(String.valueOf(Double.parseDouble(m.getYue())-Double.parseDouble(zktotalprice)));
			commonDAO.update(m);
			flag=true;
		}else if(Double.parseDouble(m.getYue())<Double.parseDouble(zktotalprice)&&zffs.equals("在线支付")){
			flag=false;
		}
		
		
		if(flag==true){
			String ddno = Info.getAutoId();
			ArrayList<Car> carlist = (ArrayList<Car>)commonDAO.findByHql(" from Car where mid="+member.getId());
			for(Car car:carlist){
				Goods goodmap = (Goods)commonDAO.findById(car.getGid(), "Goods");
				//orderprice += Double.valueOf(goodmap.getPrice())*car.getSl();
				Dddetail dddetail = new Dddetail();
				dddetail.setDdno(ddno);
				dddetail.setTotal(String.valueOf(Double.valueOf(goodmap.getPrice())*car.getSl()));
				if(!zffs.equals("在线支付")){
				dddetail.setFkstatus("待付款");
				}else{
				dddetail.setFkstatus("已付款");	
				}
				dddetail.setFhstatus("待发货");
				dddetail.setShstatus("待收货");
				dddetail.setZffs(zffs);
				dddetail.setCkstatus("new");
				dddetail.setSavetime(Info.getDateStr().substring(0,10));
				dddetail.setGoodno(Info.getAutoId1());
				dddetail.setGoodid(car.getGid());
				dddetail.setSl(car.getSl());
				dddetail.setDelstatus("0");
				commonDAO.save(dddetail);
			}
			Ddinfo ddinfo = new Ddinfo();
			ddinfo.setDdno(ddno);
			ddinfo.setMemberid(member.getId().toString());
			ddinfo.setShrname(shrname);
			ddinfo.setShrtel(shrtel);
			ddinfo.setShraddr(shraddr);
			ddinfo.setFhstatus("待发货");
			ddinfo.setShstatus("待收货");
			if(!zffs.equals("在线支付")){
				ddinfo.setFkstatus("待付款");
				}else{
					ddinfo.setFkstatus("已付款");	
				}
			ddinfo.setWlinfo(wlinfo);
			ddinfo.setDelstatus("0");
			ddinfo.setZffs(zffs);
			ddinfo.setSavetime(Info.getDateStr());
			ddinfo.setDdprice(String.valueOf(zktotalprice));
			
			commonDAO.save(ddinfo);
			//删除购物车下本用户的商品
			for(Car car:carlist){
				commonDAO.delete(car.getId(), "Car");
			}
		suc="订单创建成功!";
		}else{
			suc="余额不足";
		}
		return "success";
	}
	
	//直接购买
	public void tobuy()throws IOException{
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		String ddno = Info.getAutoId();
		String shrname = member.getTname();
		String shrtel = member.getTel();
		String shraddr = member.getAddr();
		double ddprice = 0.0;
		String fhstatus = "待发货";
		String shstatus = "待收货";
		String fkstatus = "待付款";
		String wlinfo = "暂无物流信息";
		String savetime = Info.getDateStr();
		
		HttpServletResponse response=ServletActionContext.getResponse();
 		response.setContentType("text/html");
 		PrintWriter out = response.getWriter();
 		ArrayList<Goods> glist = (ArrayList<Goods>)commonDAO.findByHql(" from Goods where saver='"+member.getId()+"' and id='"+goodid+"'");
		if(member!=null&&glist.size()==0){
				Goods gmap = (Goods)commonDAO.findById(goodid, "Goods");
				Member mmm = (Member)commonDAO.findById(gmap.getSaver(), "Member");
				String price = gmap.getPrice();
				ddprice = Double.valueOf(price)*Double.valueOf(sl);
				if(ddprice>1000){ddprice=ddprice-100;};
				//直接生成订单
				Ddinfo ddinfo = new Ddinfo();
				ddinfo.setDdno(ddno);
				ddinfo.setMemberid(member.getId().toString());
				ddinfo.setDdprice(String.valueOf(ddprice));
				ddinfo.setFhstatus(fhstatus);
				ddinfo.setSavetime(Info.getDateStr());
				ddinfo.setShstatus(shstatus);
				ddinfo.setWlinfo(wlinfo);
				ddinfo.setFkstatus(fkstatus);
				ddinfo.setShrname(shrname);
				ddinfo.setShrtel(shrtel);
				ddinfo.setZffs("在线支付");
				ddinfo.setShraddr(shraddr);
				commonDAO.save(ddinfo);
				Dddetail dddetail = new Dddetail();
				dddetail.setDdno(ddno);
				dddetail.setGoodid(goodid);
				dddetail.setSl(Integer.parseInt(sl));
				commonDAO.save(dddetail);
				out.println(0);
		}else{
			out.println(goodid);
		}
		out.flush();
 		out.close();
	}
	
	//订单付款
	public String orderPay(){
		Map session= ServletActionContext.getContext().getSession();
		Member member = (Member)session.get("member"); 
		Member m = (Member)commonDAO.findById(member.getId(), "Member"); 
		Ddinfo di = (Ddinfo)commonDAO.findById(id, "Ddinfo");
		Dddetail ddd = (Dddetail)commonDAO.findByHql("from Dddetail where ddno='"+di.getDdno()+"'").get(0);
		double zhyue = Double.parseDouble(String.valueOf(m.getYue()));
		if(zhyue>=Double.parseDouble(di.getDdprice())){
			m.setYue(String.valueOf(zhyue-Double.parseDouble(di.getDdprice())));
			di.setFkstatus("已付款");
			commonDAO.update(m);
			commonDAO.update(di);
			ddid=ddid;
			ddprice=ddprice;
			//System.out.println("isjfdk=="+isjfdk);
			suc="订单支付成功!";
		}else{
			ddid=ddid;
			ddprice=ddprice;
			no="余额不足";
		}
		return "success";
	}
	
	//订单发货
	public String fahuo(){
		
		//查询订单及订单详情表
		Dddetail ddinfo = (Dddetail)commonDAO.findById(ddid, "Dddetail");
		System.out.println("ddinfo==="+ddinfo.getId());
		boolean flag = true;//用作订单商品库存校验结果
			//如果其中某个商品的数量大于其库存量 则置 FLASE标识
			if(Integer.valueOf(ddinfo.getSl())>commonDAO.getkc(Integer.valueOf(ddinfo.getGoodid()))){
				flag = false;
			}
		if(flag){
			ddinfo.setFhstatus("已发货");
			commonDAO.update(ddinfo);
			//发货后减库存 
				Kcrecord kcrecord = new Kcrecord();
				kcrecord.setGid(ddinfo.getGoodid());
				kcrecord.setHappennum(ddinfo.getSl());
				kcrecord.setType("out");
				kcrecord.setSavetime(Info.getDateStr());
				commonDAO.save(kcrecord);
				int kcnum = commonDAO.getkc(Integer.parseInt(ddinfo.getGoodid()));
				if(kcnum==0){
					Goods goods = (Goods)commonDAO.findById(ddinfo.getGoodid(), "Goods");
					goods.setIstj("no");
					commonDAO.update(goods);
				}
			suc = "发货成功";
		}else{
			suc = "发货失败：有商品库存不足!";
		}
		return "success";
	}
	
	
	
	
	//收货
	
	public String shouhou(){
		Dddetail dddetail = (Dddetail)commonDAO.findById(qsid, "Dddetail");
		Ddinfo ddinfo = (Ddinfo)commonDAO.findByHql("from Ddinfo where ddno='"+dddetail.getDdno()+"'").get(0);
		Member member = (Member)commonDAO.findById(ddinfo.getMemberid(), "Member");
		if(dddetail.getZffs().equals("货到付款")){
			if(Double.parseDouble(member.getYue())>=Double.parseDouble(dddetail.getTotal())){
				member.setYue(String.valueOf(Double.parseDouble(member.getYue())-Double.parseDouble(dddetail.getTotal())));
				dddetail.setFkstatus("已付款");
				dddetail.setShstatus("已收货");
				commonDAO.update(member);
				commonDAO.update(dddetail);
				suc="操作成功";
			}else{
				suc="余额不足";
			}
		}else{
			dddetail.setFkstatus("已付款");
			dddetail.setShstatus("已收货");
			commonDAO.update(dddetail);
			suc="操作成功";
		}
		return "success";
	}
	
	
	
	
	
	
	
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDdno() {
		return ddno;
	}
	public void setDdno(String ddno) {
		this.ddno = ddno;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getDdprice() {
		return ddprice;
	}
	public void setDdprice(String ddprice) {
		this.ddprice = ddprice;
	}
	public String getFhstatus() {
		return fhstatus;
	}
	public void setFhstatus(String fhstatus) {
		this.fhstatus = fhstatus;
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
	public String getWlinfo() {
		return wlinfo;
	}
	public void setWlinfo(String wlinfo) {
		this.wlinfo = wlinfo;
	}
	public String getFkstatus() {
		return fkstatus;
	}
	public void setFkstatus(String fkstatus) {
		this.fkstatus = fkstatus;
	}
	public String getShrname() {
		return shrname;
	}
	public void setShrname(String shrname) {
		this.shrname = shrname;
	}
	public String getShrtel() {
		return shrtel;
	}
	public void setShrtel(String shrtel) {
		this.shrtel = shrtel;
	}
	public String getShraddr() {
		return shraddr;
	}
	public void setShraddr(String shraddr) {
		this.shraddr = shraddr;
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


	public String getWlcompany() {
		return wlcompany;
	}


	public void setWlcompany(String wlcompany) {
		this.wlcompany = wlcompany;
	}


	public String getWlno() {
		return wlno;
	}


	public void setWlno(String wlno) {
		this.wlno = wlno;
	}

	public String getGoodid() {
		return goodid;
	}

	public void setGoodid(String goodid) {
		this.goodid = goodid;
	}

	public String getSl() {
		return sl;
	}

	public void setSl(String sl) {
		this.sl = sl;
	}

	public String getIsjfdk() {
		return isjfdk;
	}

	public void setIsjfdk(String isjfdk) {
		this.isjfdk = isjfdk;
	}

	public String getGid() {
		return gid;
	}

	public void setGid(String gid) {
		this.gid = gid;
	}

	public String getDdid() {
		return ddid;
	}

	public void setDdid(String ddid) {
		this.ddid = ddid;
	}

	public String getZktotalprice() {
		return zktotalprice;
	}

	public void setZktotalprice(String zktotalprice) {
		this.zktotalprice = zktotalprice;
	}

	public String getZffs() {
		return zffs;
	}

	public void setZffs(String zffs) {
		this.zffs = zffs;
	}

	public String getQsid() {
		return qsid;
	}

	public void setQsid(String qsid) {
		this.qsid = qsid;
	}
	
	
	
	
	
	

	
	
}
