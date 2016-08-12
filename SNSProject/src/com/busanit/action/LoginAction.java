package com.busanit.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.busanit.config.SqlMapConfig;
import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/SNS/loginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		SqlMapClient sqlmap = SqlMapConfig.getSqlMapInstance();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();	
		try {
			String dbpassword = (String)sqlmap.queryForObject("loginSelect", id);
			if(dbpassword==null){
				out.println("0");
			}else if(dbpassword.equals(password)){
				session.setAttribute("login", id);
				out.println("1");
			}else{
				out.println("2");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
