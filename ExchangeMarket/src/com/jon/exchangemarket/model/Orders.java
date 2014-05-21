package com.jon.exchangemarket.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class Orders extends Model<Orders> {
	public static final Orders dao = new Orders();

	public List<Orders> listAll(){
		return find("select * from em_orders");
	}
	
}

