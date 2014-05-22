package com.jon.exchangemarket.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class Order extends Model<Order> {
	public static final Order dao = new Order();

	public List<Order> listAll(){
		return find("select * from em_order");
	}
	
	public User getSeller(){
		return User.dao.findById(get("sellerid"));
	}
	
	public User getBuyer(){
		return User.dao.findById(get("buyerid"));
	}
	
	public Goods getSellItem(){
		return Goods.dao.findById(get("sellgoodsid"));
	}
	
	public Goods getExchangeItem(){
		return Goods.dao.findById(get("exchangegoodsid"));
	}
	
}

