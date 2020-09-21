package cn.xh.dao;

import java.util.List;

import cn.xh.domain.Order;
import cn.xh.domain.User;

public interface OrderDao {

	void save(Order o);
	
	List<Order> findOrdersByUser(User user);
	
	User findUserByid(String user_id);

	List<Order> findOrders();

	void faHuo(String ordernum);

}
