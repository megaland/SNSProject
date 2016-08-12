package com.busanit.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.busanit.config.SqlMapConfig;
import com.busanit.model.RegisterBean;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class ChangeModifie
 */
@WebServlet("/SNS/ChangeModifie")
public class ChangeModifie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeModifie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddhhmmss");
		String datehash = sdf.format(date);

		//String savefolder = "C:/jsp/SNSProject/WebContent/SNS/pictures/personalpictures";
		String savefolder = "C:/jsp/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SNSProject/SNS/pictures/personalpictures";
		String enctype = "utf-8";
		int maxsize = 5*1024*1024;
		
		File file = new File(savefolder);
		if(!file.exists()){
			file.mkdirs();

		}
		

		
		MultipartRequest multi=  new MultipartRequest(request, savefolder,maxsize, enctype,
				new FileRenamePolicy() {
					
					@Override
					public File rename(File f) {
						String fparent = f.getParent();
						String fname = f.getName();
						
						String newname = fparent+"/"+datehash+fname;
						f = new File(newname);
						return f;
					}
				}
		);
		
		RegisterBean rgb = new RegisterBean();
		rgb.setId(multi.getParameter("id"));
		rgb.setNicname(multi.getParameter("nicname"));
		rgb.setPassword(multi.getParameter("password1"));
		rgb.setEmail(multi.getParameter("email"));
		rgb.setTel(multi.getParameter("tel"));
		rgb.setIntroduce(multi.getParameter("introduce"));
		
		String filename = null;
		if (multi.getFilesystemName("filename") != null) {
			
			filename = multi.getFilesystemName("filename");
			
		}
		rgb.setPicture("pictures/personalpictures/"+filename);
		
		SqlMapClient sqlMap = new SqlMapConfig().getSqlMapInstance();
		if(filename==null){
			try {
				sqlMap.update("updatenopic", rgb);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else{
			try {
				sqlMap.update("update",rgb);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
				
				
		
		

		
		
		response.sendRedirect("ownerpage.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
