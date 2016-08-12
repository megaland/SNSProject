package com.busanit.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busanit.config.SqlMapConfig;
import com.ibatis.sqlmap.client.SqlMapClient;


/**
 * Servlet implementation class followAction
 */
@WebServlet("/SNS/followAction")
public class followAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public followAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("followAction");
		String myid=request.getParameter("myid");
		String friendid=request.getParameter("friendid");
		System.out.println(friendid);
		System.out.println(myid);
		HashMap<String, String> hm = new HashMap<>();
		
		hm.put("friendid", friendid);
		hm.put("myid", myid);
		SqlMapClient sqlMap = SqlMapConfig.getSqlMapInstance();
		try {
			sqlMap.insert("frienddata",hm);
			
		
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
