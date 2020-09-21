package cn.xh.web.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import cn.xh.domain.Book;
import cn.xh.domain.Favorite;
import cn.xh.domain.User;
import cn.xh.service.ClientService;
import cn.xh.service.impl.ClientServiceImpl;
import cn.xh.web.formbean.Cart;
import cn.xh.web.formbean.CartItem;

@WebServlet("/client/ClientServlet")
public class ClientServlet extends HttpServlet {
	private ClientService service = new ClientServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		String op = req.getParameter("op");
		if (op != null && !op.equals("")) {
			// 注册
			if (op.equals("register")) {
				register(req, resp);
			}
			// 登录
			if (op.equals("login")) {
				login(req, resp);
			}
			// 注销
			if (op.equals("layout")) {
				layout(req, resp);
			}
			//所有书籍
			if (op.equals("loadAll")) {
				loadAll(req, resp);
			}
			// 文学艺术类书籍列表
			if (op.equals("wxys")) {
				wxys(req, resp);
			}
			// 人文社科类书籍列表
			if (op.equals("rwsk")) {
				rwsk(req, resp);
			}
			// 少儿童书类书籍列表
			if (op.equals("sets")) {
				sets(req, resp);
			}
			// 教育考试类书籍
			if (op.equals("jyks")) {
				jyks(req, resp);
			}
			// 经济金融类书籍
			if (op.equals("jjjr")) {
				jjjr(req, resp);
			}
			// 科学技术类书籍
			if (op.equals("kxjs")) {
				kxjs(req, resp);
			}
			// 搜索
			if (op.equals("search")) {
				search(req, resp);
			}
			// 详情页面
			if (op.equals("particulars")) {
				particulars(req, resp);
			}
			// 添加收藏夹
			if (op.equals("addfavorite")) {
				addfavorite(req, resp);
			}
			// 显示收藏夹
			if (op.equals("showfavorite")) {
				showfavorite(req, resp);
			}
			// 删除收藏夹
			if (op.equals("delFavorite")) {
				delFavorite(req, resp);
			}
			// 添加购物车
			if (op.equals("addCart")) {
				addCart(req, resp);
			}
			// 删除购物车中的购物项
			if (op.equals("delItem")) {
				delItem(req, resp);
			}
			// 修改购物项数量
			if (op.equals("changeNum")) {
				changeNum(req, resp);
			}
			// 个人信息修改
			if (op.equals("personInformation")) {
				personInformation(req, resp);
			}
			// 修改密码
			if (op.equals("personPassword")) {
				personPassword(req, resp);
			}
		}
	}

	//注册实现
	private void register(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String name = req.getParameter("name");
			String sex = req.getParameter("sex");
			String tel = req.getParameter("tel");
			String address = req.getParameter("address");

			boolean isExist = false;// 判断是否存在该用户

			if (!username.equals("") && !password.equals("")) {
				isExist = service.register(username, password, name, sex, tel, address);
				if (isExist == true) {
					req.setAttribute("message1", "该用户名已被注册");
					req.getRequestDispatcher("/comm/jump.jsp").forward(req, resp);
				} else {
					req.setAttribute("message1", "注册成功");
					req.getRequestDispatcher("/comm/jump.jsp").forward(req, resp);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//登录实现
	private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();
		User user = service.login(username, password);
		if (user.getUsername() != null && user.getUsername() != "") {
			req.setAttribute("message1", "欢迎登陆");
			req.setAttribute("message2", "用户");
			session.setAttribute("user", user);
			req.getRequestDispatcher("/comm/jump.jsp").forward(req, resp);
		} else {
			req.setAttribute("message1", "账号或密码错误");
			req.getRequestDispatcher("/comm/jump.jsp").forward(req, resp);
		}
	}
	
	//注销实现
	private void layout(HttpServletRequest req, HttpServletResponse resp) {
		try {
			HttpSession session = req.getSession();
			session.removeAttribute("user");
			req.setAttribute("message1", "注销成功");
			req.getRequestDispatcher("/comm/jump.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//加载所有图书实现
	private void loadAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.loadAll();
		resp.getWriter().write(new Gson().toJson(books));
	}
	
	//加载文学艺术类书实现
	private void wxys(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.xsys();
		resp.getWriter().write(new Gson().toJson(books));
	}
	
	//加载人文社科类书实现
	private void rwsk(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.rwsk();
		resp.getWriter().write(new Gson().toJson(books));
	}
	
	//加载少儿童书类书实现
	private void sets(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.sets();
		resp.getWriter().write(new Gson().toJson(books));		
	}
	
	//加载教育考试类书实现
	private void jyks(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.jyks();
		resp.getWriter().write(new Gson().toJson(books));
	}
	
	//加载经济金融类书实现
	private void jjjr(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.jjjr();
		resp.getWriter().write(new Gson().toJson(books));
	}
	//加载科学技术类书实现
	private void kxjs(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.kxjs();
		req.setAttribute("books", books);
		resp.getWriter().write(new Gson().toJson(books));
	}
	
	//加载搜索的书实现
	private void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search = req.getParameter("search");
		List<Book> searchmessage = service.search(search);
		resp.getWriter().write(new Gson().toJson(searchmessage));
	}
	
	//书籍详情页信息实现
	private void particulars(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String book_id = req.getParameter("book_id");
		Book book = findBookById(book_id);
		req.setAttribute("book", book);
		req.getRequestDispatcher("/comm/particulars.jsp").forward(req, resp);
	} 
	
	// 通过书籍id找到书籍信息
	private Book findBookById(String book_id) {
		Book book = service.findBookById(book_id);
		return book;
	}
	
	//详情页书籍添加收藏实现
	private void addfavorite(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		String user_id = user.getId();
		String book_id = req.getParameter("book_id");
		boolean isExit = service.findFavorite(user_id, book_id);
		if (isExit == false) {
			service.addfavorite(user_id, book_id);
		}
		else {
			resp.getWriter().write("已经在收藏夹中了哦！");
		}
	}
	
	//展示用户的收藏书籍实现
	private void showfavorite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		List<Favorite> favorites = service.findFavoriteByUserId(user);
		session.setAttribute("favorite", favorites);
		req.getRequestDispatcher("/client/showFavorites.jsp").forward(req, resp);
	}
	
	//删除用户的收藏书籍实现
	private void delFavorite(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String book_id = req.getParameter("book_id");
		service.delFavorite(book_id);
		HttpSession session = req.getSession();
		List<Favorite> lists = (List<Favorite>)session.getAttribute("favorite");
		
		Iterator<Favorite> iterator = lists.iterator();//使用迭代器删除session对象中相应的书籍，不影响显示顺序
		while (iterator.hasNext()) {
			Favorite favorite = iterator.next();
			if (book_id.equals(favorite.getBook().getBook_id())) {
				iterator.remove();
			}
		}
		resp.sendRedirect("/BookStore/client/showFavorites.jsp");
	}

	//详情页书籍添加到购物车
	private void addCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String book_id = req.getParameter("book_id");
		Book book = findBookById(book_id);
		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		cart.addBook(book);
	}
	
	//购物车页面删除对应书籍
	private void delItem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String book_id = req.getParameter("book_id");
		Cart cart = (Cart) req.getSession().getAttribute("cart");
		cart.getItmes().remove(book_id);
		resp.sendRedirect("/BookStore/client/showCart.jsp");
	}
	
	//改变购物车内书籍的数量
	private void changeNum(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String num = req.getParameter("num");
		String book_id = req.getParameter("book_id");
		Cart cart = (Cart) req.getSession().getAttribute("cart");
		CartItem item = cart.getItmes().get(book_id);
		item.setQuantity(Integer.parseInt(num));
		resp.sendRedirect("/BookStore/client/showCart.jsp");

	}
	
	//个人中心修改个人信息实现
	private void personInformation(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getParameter("username");
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");

		service.personInformation(username, name, sex, tel, address);
		resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>修改成功！</div><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n" + 
				"				style=\"margin-left:48%\"\r\n" + 
				"				onclick=\"window.location='personContent.jsp'\">关闭</button>");
	}
	
	//个人中心修改登录密码实现
	private void personPassword(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String username = ((User)(req.getSession().getAttribute("user"))).getUsername();
		String password = req.getParameter("password");
		String repassword = req.getParameter("repassword");
		
		if (password.equals(repassword)) {
			service.personPassword(password, username);
			resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>修改成功！</div><button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\"\r\n" + 
					"				style=\"margin-left:48%\"\r\n" + 
					"				onclick=\"window.location='personContent.jsp'\">关闭</button>");
		}
		else {
			resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>两次密码不一致，修改失败！</div><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n" + 
						"				style=\"margin-left:48%\"\r\n" + 
						"				onclick=\"window.location='personContent.jsp'\">关闭</button>");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
