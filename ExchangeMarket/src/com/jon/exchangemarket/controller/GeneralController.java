package com.jon.exchangemarket.controller;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jon.exchangemarket.interceptor.LoginInterceptor;
import com.jon.exchangemarket.model.Orders;

public class GeneralController extends Controller {
	@Before(LoginInterceptor.class)
	public void index() {
		System.out.println("ininininininn");
		List<Orders> order = Orders.dao.listAll();
		System.out.println(order.toArray());
		render("/index.html");

	}

	public void secondFunction() {

	}
}