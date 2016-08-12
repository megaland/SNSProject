package com.busanit.action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * Servlet implementation class AddBBSAction
 */
@WebServlet("/SNS/detailaddbbsAction")
public class DetailAddBBSAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailAddBBSAction() {
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
		
		//String savefolder = "C:/jsp/SNSProject/WebContent/SNS/pictures/bbspictures";
		String savefolder = "C:/jsp/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SNSProject/SNS/pictures/bbspictures";
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
		
		SqlMapClient sqlmap = SqlMapConfig.getSqlMapInstance();
		RegisterBean rb =null;
		try {
			rb = (RegisterBean) sqlmap.queryForObject("listdata", multi.getParameter("addbbsid"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		BBSBean bean = new BBSBean();
	
		bean.setId(rb.getId());
		bean.setNicname(rb.getNicname());
		bean.setContent(multi.getParameter("addcontent"));

		if(multi.getParameter("clicknum")!=null){
			bean.setClicknum(Integer.parseInt(multi.getParameter("clicknum")));
		}
	
		String filename1 = null;
		if (multi.getFilesystemName("filename1") != null) {
			
			filename1 = multi.getFilesystemName("filename1");
			bean.setPicture1("pictures/bbspictures/"+filename1);
		}
		
		
	
		String filename2 = null;
		if (multi.getFilesystemName("filename2") != null) {
			
			filename2 = multi.getFilesystemName("filename2");
			bean.setPicture2("pictures/bbspictures/"+filename2);
		}

		
		try{
				sqlmap.insert("insertbbs", bean);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("retwitedit.jsp");
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
