package com.egoboxworld;

import java.io.IOException;

import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.EmbeddedEntity;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.KeyRange;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

@SuppressWarnings("serial")
public class Egoboxworld_RWDServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//resp.setContentType("text/plain");
		resp.setContentType("text/html; charset=UTF-8");
		String do_step=req.getParameter("do")==null?"":req.getParameter("do");
		try {
			if(do_step.equals("1")){
				kindExample_writesEntity_product(resp);
			}else{
				resp.getWriter().println("Hello, ellen2");
			}
			//kindExample_writesEntity(resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	 public void kindExample_writesEntity(HttpServletResponse resp) throws Exception {
		    // [START kind_example]
		    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

		    Entity employee = new Entity("Employee", "asalieri");
		    employee.setProperty("firstName", "Antonio");
		    employee.setProperty("lastName", "Salieri");
		    employee.setProperty("hireDate", new Date());
		    employee.setProperty("attendedHrTraining", true);

		    datastore.put(employee);
		    // [END kind_example]

		    Entity got = datastore.get(employee.getKey());
		    resp.getWriter().println("firstName:"+got.getProperty("firstName"));
		    resp.getWriter().println("lastName:"+got.getProperty("lastName"));
		    resp.getWriter().println("hireDate:"+got.getProperty("hireDate"));
		    resp.getWriter().println("attendedHrTraining:"+got.getProperty("attendedHrTraining"));
		    
		  }
	 
	 //do_step=1
	 public void kindExample_writesEntity_product(HttpServletResponse resp) throws Exception {
		    // [START kind_example]
		    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
//category, category_name, product_name, product_weight,price
		    Entity employee = new Entity("Product", "00001");
		    employee.setProperty("productName", "活力什錦果仁");
		    employee.setProperty("category", "A01");
		    employee.setProperty("categoryName", "堅果類");
		    employee.setProperty("productWeight", "200克");
		    employee.setProperty("productPrice", 100);
		    employee.setProperty("createDate", new Date());
		    employee.setProperty("active", true);
		    employee.setProperty("imgURL", "http://cf.shopee.tw/file/df496e0f867a64a997c8ccfae52a8e57");
		    employee.setProperty("promote", true);
		    datastore.put(employee);
		    // [END kind_example]

		    Entity got = datastore.get(employee.getKey());
		    resp.getWriter().println("productName:"+got.getProperty("productName"));
		    resp.getWriter().println("category:"+got.getProperty("category"));
		    resp.getWriter().println("categoryName:"+got.getProperty("categoryName"));
		    resp.getWriter().println("productWeight:"+got.getProperty("productWeight"));
		    resp.getWriter().println("productPrice:"+got.getProperty("productPrice"));
		    resp.getWriter().println("createDate:"+got.getProperty("createDate"));
		    resp.getWriter().println("active:"+got.getProperty("active"));
		    resp.getWriter().println("imgURL:"+got.getProperty("imgURL"));
		    resp.getWriter().println("promote:"+got.getProperty("promote"));
		  }
}
