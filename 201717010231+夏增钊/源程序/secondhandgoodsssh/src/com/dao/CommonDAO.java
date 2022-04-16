package com.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


import com.model.Kcrecord;


/**
 * A data access object (DAO) providing persistence and search support for Txl
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.cz.entity.Txl
 * @author MyEclipse Persistence Tools
 */

public class CommonDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(CommonDAO.class);
	
	protected void initDao() {
		// do nothing
	}

	public void save(Object transientInstance) {
		try {
			getHibernateTemplate().save(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(Object persistentInstance) {
		try {
			getHibernateTemplate().delete(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Object findById(int id,String entity) {
		try {
			Object instance =  getHibernateTemplate().get("com.model."+entity, id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public Object findById(String id,String entity) {
		try {
			Object instance =  getHibernateTemplate().get("com.model."+entity, Integer.parseInt(id) );
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}


	
	
	public List findByHql(String hql) {
		
	try {
			return getHibernateTemplate().find(hql);
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findByHql(String hql,int dpage,int rows) {
		try {
			List list = getHibernateTemplate().find(hql);
			List mlist=new ArrayList();
			try{
				int min = (dpage-1)*rows;
				int max = dpage*rows;
				
				for(int i=0;i<list.size();i++)
				{
					
					if(!(i<min||i>(max-1)))
					{
					mlist.add(list.get(i));
					}
				}
			}catch(RuntimeException re){
				re.printStackTrace();
				throw re;
			}
			return mlist;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Object update(Object detachedInstance) {
		try {
			 getHibernateTemplate().merge(detachedInstance);
			return null;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(int id,String entity) {
		System.out.println("cc="+id);
		try {
			getHibernateTemplate().delete(getHibernateTemplate().get("com.model."+entity, id));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public void delete(String  id,String entity) {
		System.out.println("cc="+id);
		try {
			getHibernateTemplate().delete(getHibernateTemplate().get("com.model."+entity, Integer.parseInt(id) ));
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public int getkc(int goodid){
		
		int znum = 0;
    	int innum = 0;
    	int outnum = 0;
    	ArrayList<Kcrecord> inlist = (ArrayList<Kcrecord>)getHibernateTemplate().find(" from Kcrecord where  type='in' and gid='"+goodid+"' ");
    	ArrayList<Kcrecord> outlist = (ArrayList<Kcrecord>)getHibernateTemplate().find(" from Kcrecord where  type='out' and gid='"+goodid+"' ");
    	if(inlist.size()>0){
    		for(Kcrecord inmap:inlist){
    			innum += inmap.getHappennum();//总入库量
    		}
    	}
    	if(outlist.size()>0){
    		for(Kcrecord outmap:outlist){
    			outnum += outmap.getHappennum();//总出库量
    		}
    	}
    	znum = innum - outnum;//库存量
    	return znum;
	}
	


	public static CommonDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CommonDAO) ctx.getBean("CommonDAO");
	}
}