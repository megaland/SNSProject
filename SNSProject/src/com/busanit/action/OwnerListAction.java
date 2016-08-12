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
import com.busanit.model.FriendBean;
import com.busanit.model.RegisterBean;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.sun.org.apache.bcel.internal.generic.LUSHR;

/**
 * Servlet implementation class ListAction
 */
@WebServlet("/SNS/ownerlistAction")
public class OwnerListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerListAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	  
	  request.setCharacterEncoding("utf-8");
		SqlMapClient sqlMap = SqlMapConfig.getSqlMapInstance();
		
		String id= request.getParameter("id");
		String pagefirst= request.getParameter("pagefirst");
		String pagelast= request.getParameter("pagelast");
		
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("id", id);
		hm.put("pagefirst", pagefirst);
		hm.put("pagelast", pagelast);
		
		
		try {		  	  
			List<BBSBean> arr = sqlMap.queryForList("getfriend",hm);
      
			List<RegisterBean> arrpic = new ArrayList<RegisterBean>();
			HashSet<String> hs = new HashSet<String>();
			for (int i = 0; i < arr.size(); i++) {
				hs.add(arr.get(i).getId());
			}
			Iterator<String> hsiter = hs.iterator();
			while(hsiter.hasNext()){
				arrpic.add((RegisterBean)sqlMap.queryForObject("selectidpic", hsiter.next()));
			}
			
			request.setAttribute("lists2", arrpic);
      
			request.setAttribute("lists", arr);
     
    } catch (SQLException e) {
      // TODO �ڵ� ������ catch ���
      e.printStackTrace();
    }
		RequestDispatcher dispatcher = request.getRequestDispatcher("listresult.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
