package com.jon.exchangemarket.settings;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jon.exchangemarket.controller.GeneralController;
import com.jon.exchangemarket.controller.OrderController;

public class JFConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		me.setDevMode(true);
		// View Type default is Freemarker
		//me.setViewType(ViewType.JSP);
	}

	@Override
	public void configRoute(Routes me) {
		me.add("/", GeneralController.class);
		me.add("/save", OrderController.class);
	}

	@Override
	public void configHandler(Handlers me) {

	}

	@Override
	public void configInterceptor(Interceptors me) {
		//me.add(new LoginInterceptor());
	}

	@Override
	public void configPlugin(Plugins me) {
		/*C3p0Plugin cp=new C3p0Plugin("jdbc:mysql://localhost/test", "root", "cnhonker123");
		C3p0Plugin cp=new C3p0Plugin("jdbc:sqlserver://localhost\\LOCALSQLEXPRESS;databaseName=exchange_market", "sa", "Ilove2013");
		me.add(cp);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(cp);
		me.add(arp);
		//arp.setDialect(new MysqlDialect());
		arp.setDialect(new AnsiSqlDialect());
		// Database mapping
		arp.addMapping("em_goods", "goodsid" , Goods.class);
		arp.addMapping("em_order", "orderid" ,Order.class);
		arp.addMapping("em_user", "userid" ,User.class);
*/
	}

}
