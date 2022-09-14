package nguyentg.controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyentg.dao.UserDao;
import nguyentg.dto.ErrorObject;
import nguyentg.dto.User;

import stackjava.com.accessgoogle.common.GooglePojo;
import stackjava.com.accessgoogle.common.GoogleUtils;

public class LoginGoogleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(LoginGoogleServlet.class.getName());
	public LoginGoogleServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            
		String code = request.getParameter("code");

		if (code == null || code.isEmpty()) {
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
		} else {
			String accessToken = GoogleUtils.getToken(code);
			GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                        System.out.println(googlePojo.getId() + " " + googlePojo.getEmail() );
                        UserDao dao= new UserDao();                  
                    try {
                        
                        User user= dao.checkLoginByGoogle(googlePojo.getId(), googlePojo.getEmail());
                        
                        if(user.getId()!=null){
                            request.getSession().setAttribute("user", user);
                        }else{
                            ErrorObject errorObject= new ErrorObject();
                            errorObject.setLoginError("User is not exist");
                            request.setAttribute("error", errorObject);
                        }
                    } catch (Exception ex) {
                        log.error(ex.toString());
                    }
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			dis.forward(request, response);
		}
            

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
