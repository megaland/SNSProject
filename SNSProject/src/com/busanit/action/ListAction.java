package com.busanit.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

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
 * Servlet implementation class ListAction
 */
@WebServlet("/SNS/listAction")
public class ListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HashMap<String, String> hm = new HashMap<String, String>();
		String pagefirst = request.getParameter("pagefirst");
		String pagelast = request.getParameter("pagelast");
		
		hm.put("pagefirst", pagefirst);
		hm.put("pagelast", pagelast);
		
		SqlMapClient sqlmap = SqlMapConfig.getSqlMapInstance();
		try {
			List<BBSBean> arr  = sqlmap.queryForList("SelectAll", hm);
			List<RegisterBean> arrpic = new ArrayList<RegisterBean>();
			HashSet<String> hs = new HashSet<String>();
			for (int i = 0; i < arr.size(); i++) {
				hs.add(arr.get(i).getId());
			}
			Iterator<String> hsiter = hs.iterator();
			while(hsiter.hasNext()){
				arrpic.add((RegisterBean)sqlmap.queryForObject("selectidpic", hsiter.next()));
			}
			
			request.setAttribute("lists2", arrpic);
			
			request.setAttribute("lists", arr);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("listresult.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
