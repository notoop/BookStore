package cn.xh.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sun.javafx.collections.MappingChange.Map;

import cn.xh.domain.Administrator;
import cn.xh.domain.Book;
import cn.xh.domain.Category;
import cn.xh.domain.User;
import cn.xh.service.ManagerService;
import cn.xh.service.impl.ManagerServiceImpl;

@WebServlet("/manager/ManagerServlet")
public class ManagerServlet extends HttpServlet {
	private ManagerService service = new ManagerServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		String op = req.getParameter("op");
		// 管理员登陆
		if (op.equals("login")) {
			login(req, resp);
		}
		// 注销
		if (op.equals("layout")) {
			layout(req, resp);
		}
		// 修改管理员资料
		if (op.equals("managerInformation")) {
			managerInformation(req, resp);
		}
		// 修改管理员登录密码
		if (op.equals("managerPassword")) {
			managerPassword(req, resp);
		}
		
		// 添加书籍前先获取所有分类
		if (op.equals("addBookUI")) {
			addBookUI(req, resp);
		}
		// 添加书籍
		if (op.equals("addBook")) {
			try {
				addBook(req, resp);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		}
		// 添加书籍分类
		if (op.equals("addCategory")) {
			addCategory(req, resp);
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
		// 科学技术类书籍
		if (op.equals("search")) {
			search(req, resp);
		}
		// 编辑书籍信息前获取书籍的信息回显
		if (op.equals("editBookUI")) {
			editBookUI(req, resp);
		}
		// 编辑书籍
		if (op.equals("editBook")) {
			try {
				editBook(req, resp);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		}
		// 删除书籍
		if (op.equals("delBook")) {
			delBook(req, resp);
		}
		// 获取书籍分类列表
		if (op.equals("categoryList")) {
			categoryList(req, resp);
		}
		// 获得分类信息
		if (op.equals("editCategoryUI")) {
			editCategoryUI(req, resp);
		}
		// 修改书籍分类信息
		if (op.equals("editCategory")) {
			editCategory(req, resp);
		}
		// 删除书籍分类
		if (op.equals("delCategory")) {
			delCategory(req, resp);
		}
		// 用户信息管理
		if (op.equals("findUsers")) {
			findUsers(req, resp);
		}
		//用户信息编辑界面
		if (op.equals("editUserUI")) {
			editUserUI(req,resp);
		}
		//用户信息修改实现
		if (op.equals("editUser")) {
			editUser(req,resp);
		}
		// 书籍销售情况
		if (op.equals("sales")) {
			sales(req, resp);
		}
	}

	//登录实现
	private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();
		Administrator admin = service.login(username, password);
		if (admin.getUsername() != null && admin.getUsername() != "") {
			req.setAttribute("message1", "欢迎登陆");
			req.setAttribute("message2", "管理员");
			session.setAttribute("admin", admin);
			req.getRequestDispatcher("/comm/jump.jsp").forward(req, resp);
		} 
		else {
			req.setAttribute("message1", "账号或密码错误");
			req.getRequestDispatcher("/comm/jump.jsp").forward(req, resp);
		}
	}
		
	//注销实现
	private void layout(HttpServletRequest req, HttpServletResponse resp) {
		try {
			HttpSession session = req.getSession();
			session.removeAttribute("admin");
			req.setAttribute("message1", "注销成功");
			req.getRequestDispatcher("/comm/jump.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//修改个人信息实现
	private void managerInformation(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String username = req.getParameter("username");
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String tel = req.getParameter("tel");
		service.managerInformation(username, name, sex, tel);
		HttpSession session = req.getSession();
		Administrator admin = (Administrator) session.getAttribute("admin");
		admin.setName(name);
		admin.setSex(sex);
		admin.setTel(tel);
		session.setAttribute("admin", admin);
		resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>修改成功！</div><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n" + 
					"				style=\"margin-left:48%\"\r\n" + 
					"				onclick=\"window.location='managerContent.jsp'\">关闭</button>");

	}
		
	//修改登录密码实现
	private void managerPassword(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String repassword = req.getParameter("repassword");
		
		if (password.equals(repassword)) {
			service.managerPassword(username, password);
			resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>修改成功！</div><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n" + 
						"				style=\"margin-left:48%\"\r\n" + 
						"				onclick=\"window.location='managerContent.jsp'\">关闭</button>");
		}
		else {
			resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>两次密码不一致，修改失败！</div><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n" + 
						"				style=\"margin-left:48%\"\r\n" + 
						"				onclick=\"window.location='managerContent.jsp'\">关闭</button>");
		}
		
	}
	
	//维护书籍信息页面，查询所有书籍
	private void loadAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.loadAll();
		req.setAttribute("books", books);
		req.getRequestDispatcher("/manager/managerBookInfo.jsp").forward(req, resp);
		
	}
	
	//维护书籍信息页面，查询文学艺术类书籍
	private void wxys(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.xsys();
		req.setAttribute("books", books);
		req.getRequestDispatcher("/manager/managerBookInfo.jsp").forward(req, resp);
	}

	//维护书籍信息页面，查询人文社科类书籍
	private void rwsk(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.rwsk();
		req.setAttribute("books", books);
		req.getRequestDispatcher("/manager/managerBookInfo.jsp").forward(req, resp);
	}
	
	//维护书籍信息页面，查询少儿童书类书籍
	private void sets(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.sets();
		req.setAttribute("books", books);
		req.getRequestDispatcher("/manager/managerBookInfo.jsp").forward(req, resp);
	}

	//维护书籍信息页面，查询教育考试类书籍
	private void jyks(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.jyks();
		req.setAttribute("books", books);
		req.getRequestDispatcher("/manager/managerBookInfo.jsp").forward(req, resp);
	}

	//维护书籍信息页面，查询金融经济类书籍
	private void jjjr(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.jjjr();
		req.setAttribute("books", books);
		req.getRequestDispatcher("/manager/managerBookInfo.jsp").forward(req, resp);
	}
	
	//维护书籍信息页面，查询科学技术类书籍
	private void kxjs(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> books = service.kxjs(); 
		req.setAttribute("books", books);
		req.getRequestDispatcher("/manager/managerBookInfo.jsp").forward(req, resp);
	}
	
	//维护书籍信息页面，搜索书籍
	private void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String m = (String) req.getParameter("search");
		System.out.println(m);
		List<Book> books = service.search(m); 
		req.setAttribute("books", books);
		req.getRequestDispatcher("/manager/managerBookInfo.jsp").forward(req, resp);
	}
	
	//维护书籍信息页面的子页面，编辑书籍信息界面
	private void editBookUI(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String book_id = req.getParameter("book_id");
		Book book = findBookById(book_id);
		List<Category> category = service.findAllCategory();
		HashMap map = new HashMap();
		map.put("book", book);
		map.put("category", category);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/manager/editBook.jsp").forward(req, resp);
	}
	
	// 通过书籍id找到书籍信息
	private Book findBookById(String book_id) {
		return service.findBookById(book_id);
	}

	//修改书籍信息的具体实现
	private void editBook(HttpServletRequest req, HttpServletResponse resp) throws FileUploadException, IOException {
		String book_id = req.getParameter("book_id");
		String book_name = req.getParameter("book_name");
		String book_author = req.getParameter("book_author");
		String book_press = req.getParameter("book_press");
		String book_desc = req.getParameter("book_desc");
		double book_price = Double.parseDouble(req.getParameter("book_price"));
		String book_kunumber = req.getParameter("book_kunumber");
		service.editBook(book_id, book_name, book_author, book_press, book_desc, book_price, book_kunumber);
		resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>修改成功！</div><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n" + 
				"				style=\"margin-left:48%\"\r\n" + 
				"				onclick=\"window.location='managerContent.jsp'\">关闭</button>");
	}
	
	//维护书籍信息页面的子页面，删除书籍
	private void delBook(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String book_id = req.getParameter("book_id");
		service.delBook(book_id);
		resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>删除成功！</div><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n" + 
				"				style=\"margin-left:48%\"\r\n" + 
				"				onclick=\"window.location='managerContent.jsp'\">关闭</button>");
	}
	
	//书籍分类信息
	private void categoryList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> categories = service.findAllCategory();
		req.setAttribute("categories", categories);
		req.getRequestDispatcher("/manager/managerCategories.jsp").forward(req, resp);
	}

	//书籍分类信息子界面编辑分类信息
	private void editCategoryUI(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Category category = service.findCategoryById(req.getParameter("category_id"));
		req.setAttribute("category", category);
		req.getRequestDispatcher("/manager/editCategory.jsp").forward(req, resp);
	}
	//编辑分类信息实现
	private void editCategory(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		Category category = new Category(req.getParameter("category_id"), req.getParameter("category_name"),
				req.getParameter("category_desc"));
		service.editCategory(category);
		resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>修改成功！</div><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n" + 
				"				style=\"margin-left:48%\"\r\n" + 
				"				onclick=\"window.location='managerContent.jsp'\">关闭</button>");
	}
	//删除分类
	private void delCategory(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String category_id = req.getParameter("category_id");
		service.delCategory(category_id);
		resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>删除成功！</div><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n" + 
				"				style=\"margin-left:48%\"\r\n" + 
				"				onclick=\"window.location='managerContent.jsp'\">关闭</button>");
	}

	//添加书籍界面
	private void addBookUI(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> categorys = service.findAllCategory();
		req.setAttribute("cs", categorys);
		req.getRequestDispatcher("/manager/managerAddBook.jsp").forward(req, resp);

	}
	
	//添加书籍实现
	private void addBook(HttpServletRequest req, HttpServletResponse resp) throws FileUploadException, IOException {
		// 判断表单是不是multipart/form-data类型
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		if (!isMultipart) {
			throw new RuntimeException("表单上传类型有误！！");
		}
		// 创建工厂用来 解析请求内容
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 构建核心类对象
		ServletFileUpload sfu = new ServletFileUpload(factory);
		List<FileItem> items = new ArrayList<FileItem>();
		items = sfu.parseRequest(req);
		Book book = new Book();
		for (FileItem item : items) {
			if (item.isFormField()) {
				// 普通字段：把数据分装到book对象中
				processFormField(item, req, book);
			} else {
				// 上传字段：上传
				processUplodFiled(item, req, book);
			}
		}
		// 把书籍信息保存到数据库中
		service.addBook(book);
		resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>添加成功！</div><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n" + 
				"				style=\"margin-left:48%\"\r\n" + 
				"				onclick=\"window.location='managerContent.jsp'\">关闭</button>");
	}

	// 处理文件上传
	private void processUplodFiled(FileItem item, HttpServletRequest req, Book book) {
		try {
			// 存放路径：不要放在web-inf中
			// 01.获取存放文件的真实目录
			/* String dirImages = getServletContext().getRealPath("/images"); */ //这样部署会在重新部署tomcat丢失所有图片
			String dirImages = "C:\\Users\\XY\\J2EE\\BookStore\\WebContent\\images";
			// 02. 通过io存文件
			// 03. 生成文件名 （用户上传图片， 图片名可能重复）
			String FieldName = item.getFieldName();// 输入框的name值
			String name = item.getName();
			String fileType = name.substring(name.lastIndexOf(".") + 1);
			String fileName = UUID.randomUUID().toString();// 生成用不重复的文件名
			// 生成文件夹名
			Date time = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String strTime = simpleDateFormat.format(time);
			// path属性filename
			String path = strTime;// 存放到book对象中
			String filename = fileName + "." + fileType;
			// fileDir：图片最终存在于fileDir
			File fileDir = new File(dirImages, path + File.separator + filename);
			// InputStream inputStream = item.getInputStream(); 从请求 对象中 通过流的方式
			// 把 上传的文件加载到 内存中 构建输出流
			File parentDir = new File(dirImages, path);// 父目录
			if (!parentDir.exists()) {
				parentDir.mkdirs();
			}
			book.setFilename(filename);
			book.setPath(path);

			InputStream inputStream = item.getInputStream();
			FileOutputStream fos = new FileOutputStream(fileDir);
			int len = 0;
			while ((len = inputStream.read()) != -1) {
				fos.write(len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 把Fielditem中的数据封装到book中
	private void processFormField(FileItem item, HttpServletRequest req, Book book) {
		try {
			// item每一个item对象代表一个输入框
			// 01. 获取input输入框的 name 的值 根据规范 输入框 的name的取值， 与 javabean 中的 属性名一致
			String inputName = item.getFieldName();
			String inputValue = item.getString("UTF-8");
			if (inputName.equals("categoryid")) {// 分类单独处理
				// 获取到选择的分类的id，根据这个id取到分类的信息
				String categoryid = item.getString();
				Category category = service.findCategoryById(categoryid);
				book.setCategory(category);
			} else {
				BeanUtils.setProperty(book, inputName, inputValue);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 添加书籍分类
	private void addCategory(HttpServletRequest req, HttpServletResponse resp) {
		try {
			Category category = new Category();
			BeanUtils.populate(category, req.getParameterMap());
			service.addCategory(category);// 调用添加方法
			resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>添加成功！</div><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n" + 
					"				style=\"margin-left:48%\"\r\n" + 
					"				onclick=\"window.location='managerContent.jsp'\">关闭</button>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//用户信息管理
	private void findUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<User> users = service.findUsers();
		HttpSession session = req.getSession();
		session.setAttribute("users", users);
		req.getRequestDispatcher("/manager/managerUsers.jsp").forward(req, resp);
	}
	
	//用户信息编辑界面
	private void editUserUI(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id = req.getParameter("userId");
		User user = service.findUserById(user_id);
		req.setAttribute("user", user);
		req.getRequestDispatcher("/manager/editUser.jsp").forward(req, resp);
	}
	
	//用户信息修改实现
	private void editUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String username = req.getParameter("username");
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String tel = req.getParameter("tel");
		String address = req.getParameter("address");
		User user = new User(null, username, null, name, sex, tel, address);
		service.editUser(user);
		resp.getWriter().write("<div style='text-align: center;margin-top: 260px'>添加成功！</div><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\"\r\n" + 
				"				style=\"margin-left:48%\"\r\n" + 
				"				onclick=\"window.location='managerContent.jsp'\">关闭</button>");
	}	
	
	//书籍销量
	private void sales(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Book> sales = service.sales();
		req.setAttribute("sales", sales);
		req.getRequestDispatcher("/manager/managerSales.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
