package com.jon.exchangemarket.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jon.exchangemarket.interceptor.LoginInterceptor;

public class OrderController extends Controller {
	@Before(LoginInterceptor.class)
	public void index() {
		System.out.println("savesavesave");

	}

	public void list() {

		//List<Order> orderList = Order.dao.listAll();
		//setAttr("orderList", orderList);
		renderFreeMarker("/list.jsp");
	}
	
	public void save(){
		System.out.println("savesavesave");
	}
}