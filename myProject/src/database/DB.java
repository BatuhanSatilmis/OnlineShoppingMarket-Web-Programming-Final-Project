package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import getset.Product;
import getset.User;


public class DB {
	
	private String username = "root";
	private String password = "root";
	private String url = "jdbc:mysql://localhost:3306/myproject?characterEncoding=latin1&useConfigs=maxPerformance";
	private String driver = "com.mysql.jdbc.Driver";
	
	ArrayList<Product> list = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	
	
	 Connection con;
	private void dbConnect() {
		try {
			
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, username, password);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public boolean checkUser(String username, String password) throws SQLException {
		dbConnect();
		int count = 0;
		String sql = "Select * from user where username = ? and password = ?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, username);
		st.setString(2, password);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			count = 1;
		}
		
		dbClose();
		if(count == 0)
			return false;
		
		return true;
	}

	public ArrayList<Product> fetchProduct() throws SQLException {
		dbConnect();
		String sql = "Select * from product";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			int id=rs.getInt("id");
			String name= rs.getString("name");
			String category= rs.getString("category");
			String price= rs.getString("price");
			String featured= rs.getString("featured");
			String image= rs.getString("image");
			
			Product p = new Product();
			p.setCategory(category);
			p.setFeatured(featured);
			p.setId(id);
			p.setImage(image);
			p.setName(name);
			p.setPrice(price);
			list.add(p);
			p=null;
			
		}
		
		dbClose();
		return list;
	}

	public ArrayList<User> fetchUser() throws SQLException {
		dbConnect();
		String sql = "Select * from user";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
		
			String user = rs.getString("username");
			int id = rs.getInt("id");
			String password = rs.getString("password");
			User u = new User();
			u.setId(id);
			u.setUsername(user);
			u.setPassword(password);
			userList.add(u);
			u=null;
				
		}
		
		dbClose();
		return userList;
	}







}
