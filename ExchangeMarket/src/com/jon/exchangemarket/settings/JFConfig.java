package com.jon.exchangemarket.settings;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.jon.exchangemarket.controller.GeneralController;
import com.jon.exchangemarket.interceptor.LoginInterceptor;
import com.jon.exchangemarket.model.Goods;
import com.jon.exchangemarket.model.Orders;
import com.jon.exchangemarket.model.Users;

public class JFConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		me.setDevMode(true);
		me.setViewType(ViewType.JSP);
	}

	@Override
	public void configRoute(Routes me) {
		me.add("/", GeneralController.class);
	}

	@Override
	public void configHandler(Handlers me) {

	}

	@Override
	public void configInterceptor(Interceptors me) {
		me.add(new LoginInterceptor());
	}

	@Override
	public void configPlugin(Plugins me) {
		C3p0Plugin cp=new C3p0Plugin("jdbc:mysql://localhost/test", "root", "cnhonker123");
		me.add(cp);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(cp);
		me.add(arp);
		arp.setDialect(new MysqlDialect());
		arp.addMapping("em_goods", "goodsid" , Goods.class);
		arp.addMapping("em_order", "orderid" ,Orders.class);
		arp.addMapping("em_user", "userid" ,Users.class);

	}

}
