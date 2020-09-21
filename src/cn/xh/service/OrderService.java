package cn.xh.service;

import java.util.List;

import com.sun.org.apache.xpath.internal.operations.Or;

import cn.xh.domain.Order;
import cn.xh.domain.Orderitem;
import cn.xh.domain.User;

public interface OrderService {
	
	void genOrder(Order o);

	List<Order> findUserOrders(User user);

	List<Order> findOrders();

	void faHuo(String ordernum);
}
