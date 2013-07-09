package com.snow.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.snow.model.Article;
import com.snow.model.User;
import com.snow.util.DBUtil;

/**
 * Servlet implementation class ArticleServlet
 */
public class ArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		
		if("query".equals(method)) {
			query(request, response);
		} else if ("insert".equals(method)) {
			insert(request, response);
		} else if ("update".equals(method)) {
			update(request, response);
		} else if ("delete".equals(method)) {
			delete(request, response);
		} else if ("preUpdate".equals(method)) {
			preUpdate(request, response);
		}
		
	}

	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String typeid = request.getParameter("typeid");
		String userid = request.getParameter("userid");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String content = request.getParameter("content");
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:ss");
		String time = df.format(date);
		Connection conn = DBUtil.getConn();
		String sql = "insert into article values (null, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(typeid));
			if(userid != null && !"".equals(userid)){
				ps.setInt(2, Integer.parseInt(userid));
			}else {
				ps.setInt(2, 9999);
			}
			if(userid == null || "".equals(userid)){
				ps.setString(3, author + "-" + title);
			}else{
				ps.setString(3, title);
			}
			ps.setString(4, content);
			ps.setString(5, time);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
		
	}

	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String typeid = request.getParameter("typeid");
		String source = request.getParameter("source");
		User u = (User) request.getSession().getAttribute("user");
		Integer userid = null;
		if(null != u) {
			userid = u.getId();
		} else {
			userid = 9999;
		}
		Connection conn = DBUtil.getConn();
		String sql = "select * from article where typeid = ? and userid = ? order by id desc";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, typeid);
			ps.setInt(2, userid);
			if("admin".equals(source)) {
				sql = "select * from article where userid = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, userid);
			} 
			ResultSet rs = ps.executeQuery();
			List<Article> list = new ArrayList<Article>();
			while(rs.next()) {
				Article a = new Article();
				a.setId(Integer.parseInt(rs.getString("id")));
				a.setTypeid(Integer.parseInt(rs.getString("typeid")));
				a.setUserid(Integer.parseInt(rs.getString("userid")));
				a.setTitle(rs.getString("title"));
				a.setContent(rs.getString("content"));
				a.setTime(rs.getString("time"));
				//System.out.println(a.toString());
				list.add(a);
			}
			request.setAttribute("list", list);
			request.setAttribute("typeid", typeid);
			if("admin".equals(source)) {
				request.getRequestDispatcher("/jsp/admin/article/list.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("/list.jsp").forward(request, response);
			}
			//response.sendRedirect(request.getContextPath() + "/l.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
		
	}
	
	
	private void preUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Connection conn = DBUtil.getConn();
		String sql = "select * from article where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(id));
			ResultSet rs = ps.executeQuery();
			Article a = new Article();
			while(rs.next()) {
				a.setId(Integer.parseInt(rs.getString("id")));
				a.setTypeid(Integer.parseInt(rs.getString("typeid")));
				a.setUserid(Integer.parseInt(rs.getString("userid")));
				a.setTime(rs.getString("title"));
				a.setTitle(rs.getString("title"));
				a.setContent(rs.getString("content"));
				a.setTime(rs.getString("time"));
			}
			request.setAttribute("article", a);
			request.getRequestDispatcher("/jsp/admin/article/update.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		} 
	}
	
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String typeid = request.getParameter("typeid");
		String userid = request.getParameter("userid");
		String title = request.getParameter("title");
		title = new String(title.getBytes("ISO-8859-1"),"utf-8");
		String content = request.getParameter("content");
		content = new String(content.getBytes("ISO-8859-1"),"utf-8");
		Connection conn = DBUtil.getConn();
		String sql = "update article set typeid=?, userid=?, title=?, content=?, time=? where id=?";
		try {
			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:ss");
			String time = df.format(date);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(typeid));
			ps.setInt(2, Integer.parseInt(userid));
			ps.setString(3, title);
			ps.setString(4, content);
			ps.setString(5, time);
			ps.setInt(6, Integer.parseInt(id));
			int num = ps.executeUpdate();
			System.out.println(num);
			Article a = new Article();
			if(num > 0) {
				a.setId(Integer.parseInt(id));
				a.setTypeid(Integer.parseInt(typeid));
				a.setUserid(Integer.parseInt(userid));
				a.setTitle(title);
				a.setContent(content);
				a.setTime(new Date().toString());
			}
			request.setAttribute("article", a);
			request.getRequestDispatcher("/jsp/admin/article/update.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
	}
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		Connection conn = DBUtil.getConn();
		String sql = "delete from article where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(id));
			int num = ps.executeUpdate();
			System.out.println(num);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
		response.sendRedirect(request.getContextPath() + "/ArticleServlet?method=query&source=admin");
	}
}
