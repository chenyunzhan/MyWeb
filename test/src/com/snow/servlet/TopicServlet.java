package com.snow.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.snow.model.Topic;
import com.snow.model.Type;
import com.snow.util.DBUtil;

/**
 * Servlet implementation class TopicServlet
 */
public class TopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TopicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if("query".equals(method)) {
			query(request, response);
		} else if("insert".equals(method)) {
			insert(request, response);
		} else if("detail".equals(method)) {
			detail(request, response);
		}
	}

	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBUtil.getConn();
		String typeid = request.getParameter("typeid");
		String sql = "select * from topic where typeid = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(typeid));
			ResultSet rs = ps.executeQuery();
			List<Topic> list = new ArrayList<Topic>();
			while(rs.next()) {
				Topic t = new Topic();
				t.setId(Integer.parseInt(rs.getString("id")));
				t.setTitle(rs.getString("title"));
				t.setContent(rs.getString("content"));
				t.setTypeid(Integer.parseInt(rs.getString("typeid")));
				list.add(t);
			}
			request.setAttribute("list", list);
			request.setAttribute("typeid", typeid);
			request.getRequestDispatcher("/jsp/forum/").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}		
	}
	
	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		title = new String(title.getBytes("ISO-8859-1"),"utf-8");
		String content = request.getParameter("content");
		content = new String(content.getBytes("ISO-8859-1"),"utf-8");
		String typeid = request.getParameter("typeid");
		Connection conn = DBUtil.getConn();
		String sql = "insert into topic (title, content, typeid) values (?, ?, ?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, Integer.parseInt(typeid));
			int num = ps.executeUpdate();
			System.out.println(num);
			request.getRequestDispatcher("jsp/forum/topic/add.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}
	}
	
	private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBUtil.getConn();
		String id = request.getParameter("id");
		String sql = "select * from topic where id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(id));
			ResultSet rs = ps.executeQuery();
			Topic t = new Topic();
			while(rs.next()) {
				t.setId(Integer.parseInt(rs.getString("id")));
				t.setTitle(rs.getString("title"));
				t.setContent(rs.getString("content"));
				t.setTypeid(Integer.parseInt(rs.getString("typeid")));
			}
			request.setAttribute("topic", t);
			request.getRequestDispatcher("/jsp/forum/forum.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn);
		}		
	}

}
