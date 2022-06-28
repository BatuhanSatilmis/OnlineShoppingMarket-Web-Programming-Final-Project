package controller;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DB;
import getset.Product;
import getset.User;

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ArrayList<Product> productlist = new ArrayList<>();
	static ArrayList<String> cartlist = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	
	HttpSession session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page == null || page.equals("product")) {
			
			DB db = new DB();
			 try {
				productlist = db.fetchProduct();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 session = request.getSession();
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", productlist);
			
			request.getRequestDispatcher("product.jsp").forward(request, response);
		}else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page.equals("login")) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		if(page.equals("login-form")) {
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			DB db = new DB();
			boolean status = false;
			try {
				status = db.checkUser(username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(status) {
				session = request.getSession();
				session.setAttribute("session", session);
				
				try {
					userList = db.fetchUser();
				} catch (SQLException e) {
					e.printStackTrace();
				}

				session.setAttribute("username", username);
				request.getRequestDispatcher("product.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "Invalid Crediantials");
				request.setAttribute("username", username);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		}
		
		if(page.equals("logout")) {
			session = request.getSession();
			session.invalidate();
			
			 session = request.getSession();
			 cartlist.clear();
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", productlist);
			
			request.getRequestDispatcher("product.jsp").forward(request, response);
		}
		

		if(page.equals("showcart")) {
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(page.equals("addtocart")) {
			String id = request.getParameter("id");
			String action = request.getParameter("action");
			Product p = new Product(); 
			boolean check = p.check(cartlist,id);
			
			if(check)
				System.out.println("Product is already added to Cart");
			else {
			cartlist.add(id);
			System.out.println("Product successfully added to Cart");
			}
			
			if(action.equals("product"))
				request.getRequestDispatcher("product.jsp").forward(request, response);
			
		}
		
		if(page.equals("success")) {
			
			request.getRequestDispatcher("success.jsp").forward(request, response);
			
		}
		
		if(page.equals("remove")) {
			String id = request.getParameter("id");
			Product p = new Product();
			cartlist = p.remove(cartlist,id);
			
			session = request.getSession();
			session.setAttribute("cartlist", cartlist);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		
	}

}

