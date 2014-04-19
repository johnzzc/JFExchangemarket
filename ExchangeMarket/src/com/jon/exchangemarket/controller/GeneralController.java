package com.jon.exchangemarket.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jon.exchangemarket.interceptor.LoginInterceptor;

public class GeneralController extends Controller {
	@Before(LoginInterceptor.class)
	public void index() {
		render("index.html");
		// Go on without freemaker
	}
	
	public void secondFunction(){
		
	}
}
