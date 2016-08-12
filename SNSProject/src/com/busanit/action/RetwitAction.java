package com.busanit.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.imageio.spi.RegisterableService;
import javax.net.ssl.SSLContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busanit.config.SqlMapConfig;
import com.busanit.model.BBSBean;
import com.busanit.model.RegisterBean;
import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * Servlet implementation class RetwitAction
 */
@WebServlet("/SNS/retwitAction")
public class RetwitAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetwitAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String number1 = request.getParameter("number1");
		SqlMapClient sqlMap = SqlMapConfig.getSqlMapInstance();
		try {
			BBSBean arr = (BBSBean) sqlMap.queryForObject("retwitdata", number1);
			RegisterBean rb =  (RegisterBean)sqlMap.queryForObject("listdata", arr.getId());
			
			request.setAttribute("lists2", rb);
			
			request.setAttribute("lists", arr);
			RequestDispatcher dispatcher = request.getRequestDispatcher("retwit.jsp");
			dispatcher.forward(request, response);
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
