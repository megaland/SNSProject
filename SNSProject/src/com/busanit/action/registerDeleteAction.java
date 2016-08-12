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
import com.busanit.model.RegisterBean;
import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * Servlet implementation class registerDeleteAction
 */
@WebServlet(name = "/ProjectSNS/registerDeleteAction", urlPatterns = { "//ProjectSNS/registerDeleteAction" })
public class registerDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerDeleteAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		RegisterBean rgb = new RegisterBean();
		rgb.setId(request.getParameter("id"));
		rgb.setPassword(request.getParameter("password"));
		SqlMapClient sqlMap = SqlMapConfig.getSqlMapInstance();
		try {
			sqlMap.delete("deletedata",rgb);
/*			<delete id="deletedata" parameterClass="registerbean">
			delete from registerinfo where id=#id# and password=#password#
					</delete>*/
			response.sendRedirect("갈곳");
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
