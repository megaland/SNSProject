package com.busanit.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busanit.config.SqlMapConfig;
import com.busanit.model.RegisterBean;
import com.ibatis.sqlmap.client.SqlMapClient;



/**
 * Servlet implementation class registerAction
 */
@WebServlet("/SNS/registerAction")
public class registerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		RegisterBean rb = new RegisterBean();
		rb.setId(request.getParameter("id"));
		rb.setNicname(request.getParameter("nicname"));
		rb.setPassword(request.getParameter("password"));
		rb.setEmail(request.getParameter("email"));
		rb.setTel(request.getParameter("tel"));
		SqlMapClient sqlmap = SqlMapConfig.getSqlMapInstance();
		try {
			sqlmap.insert("insertdata",rb);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
