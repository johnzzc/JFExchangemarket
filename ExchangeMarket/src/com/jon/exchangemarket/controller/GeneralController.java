package com.jon.exchangemarket.controller;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jon.exchangemarket.interceptor.LoginInterceptor;
import com.jon.exchangemarket.model.Order;

public class GeneralController extends Controller {
	@Before(LoginInterceptor.class)
	public void index() {
		System.out.println("ininininininn");
		List<Order> orderList = Order.dao.listAll();
		System.out.println(orderList.toArray());
		render("/index.html");

	}

	public void list() {

		List<Order> orderList = Order.dao.listAll();
		setAttr("orderList", orderList);
		renderFreeMarker("/list.jsp");
	}
}