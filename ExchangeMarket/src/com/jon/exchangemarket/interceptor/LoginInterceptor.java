package com.jon.exchangemarket.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

public class LoginInterceptor implements Interceptor{

	@Override
	public void intercept(ActionInvocation ai) {
		System.out.println("Before action invoking");
		ai.invoke();
		ai.getViewPath();
		System.out.println("After action invoking");
		
	}

}
