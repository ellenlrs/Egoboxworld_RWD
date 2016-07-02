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
public class InsertProductServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		doPost(req,resp);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		//resp.setContentType("text/plain");
		resp.setContentType("text/html; charset=UTF-8");
		String Product=req.getParameter("Product")==null?"":req.getParameter("Product");
		String productName=req.getParameter("productName")==null?"":req.getParameter("productName");
		String category=req.getParameter("category")==null?"":req.getParameter("category");
		String categoryName=req.getParameter("categoryName")==null?"":req.getParameter("categoryName");
		String productWeight=req.getParameter("productWeight")==null?"":req.getParameter("productWeight");
		String sProductPrice=req.getParameter("productPrice")==null?"0":req.getParameter("productPrice");
		int productPrice=Integer.parseInt(sProductPrice);
		String active_s=req.getParameter("active")==null?"true":req.getParameter("active");
		boolean active =active_s.equals("false")?false:true;
		String imgURL=req.getParameter("imgURL")==null?"":req.getParameter("imgURL");
		String promote_s=req.getParameter("promote")==null?"false":req.getParameter("promote");
		boolean promote=promote_s.equals("false")?false:true;
		String shippingURL=req.getParameter("shippingURL")==null?"":req.getParameter("shippingURL");
		
		try {
			// [START kind_example]
		    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		    Entity employee = new Entity("Product", Product);
		    employee.setProperty("productName", productName);
		    employee.setProperty("category", category);
		    employee.setProperty("categoryName", categoryName);
		    employee.setProperty("productWeight", productWeight);
		    employee.setProperty("productPrice", productPrice);
		    employee.setProperty("createDate", new Date());
		    employee.setProperty("active", active);
		    employee.setProperty("imgURL", imgURL);
		    employee.setProperty("promote", promote);
		    employee.setProperty("shippingURL", shippingURL);
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
		    resp.getWriter().println("shippingURL:"+got.getProperty("shippingURL"));
		  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	 
}
