package in.nishan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import in.nishan.entity.User;

public class UserDaoImpl implements UserDao {

	private Connection conn;
	
	public UserDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User us) {
		
		boolean flag=false;
		PreparedStatement ps=null;
		
		try {
			String sql="INSERT INTO user(name,email,phno,password) values(?,?,?,?)";
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			
			int i = ps.executeUpdate();
			if(i==1) {
				flag=true;
				System.out.println("Inserted to DB");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public User login(String email, String password) {
		
		User us=null;
		
		try {
			String sql="SELECT * FROM user WHERE email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				us=new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return us;
	}

	@Override
	public boolean checkPassword(int id,String psw) {
		boolean flag=false;
		
		try {
			String sql="SELECT * FROM user WHERE id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, psw);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				flag=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean updateProfile(User us) {
		
		boolean flag=false;
		PreparedStatement ps=null;
		
		try {
			String sql="UPDATE user SET name=?, email=?, phno=? WHERE id=?";
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setInt(4, us.getId());
			
			int i = ps.executeUpdate();
			if(i==1) {
				flag=true;
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean checkUser(String email) {
		boolean flag=true;
		PreparedStatement ps=null;
		
		try {
			
			String sql="SELECT * FROM user WHERE email=?";
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, email);
			
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				flag=false;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	
}
