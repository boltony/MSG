package msg.board;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.file")
public class FileController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());
		
		if(cmd.contentEquals("/download.file")) {
			String fileName = request.getParameter("fileName");
			String oriName = request.getParameter("oriName");
			String root = request.getParameter("root");
			String path = request.getServletContext().getRealPath("/board_files/file"+root);
			String fullPath = path+"/"+fileName;
			System.out.println(fullPath);
			
			File f = new File(fullPath);
			try(
					FileInputStream fis = new FileInputStream(f);
					DataInputStream fileDis = new DataInputStream(fis);
					ServletOutputStream sos = response.getOutputStream();
					){
				byte[] fileContents = new byte[(int)f.length()];
				fileDis.readFully(fileContents);
				
				response.reset();
				response.setContentType("application/octet-stream");
				String encFileName = new String(oriName.getBytes("utf8"),"iso-8859-1");
				
				response.setHeader("Content-Disposition", "attachement; filename=\""+encFileName+"\"");
				response.setHeader("Content-Length", String.valueOf(f.length())); 
				
				sos.write(fileContents);
				sos.flush();
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
