package in.nishan.dao;

import in.nishan.entity.User;

public interface UserDao {
	public boolean userRegister(User us);
	
	public User login(String email,String password);
	
	public boolean checkPassword(int id,String psw);
	
	public boolean updateProfile(User us);
	
	public boolean checkUser(String email);
}
