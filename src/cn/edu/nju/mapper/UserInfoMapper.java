package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.UserInfo;

public interface UserInfoMapper {
	public boolean addUser(UserInfo user);
	public boolean removeUser(UserInfo user);
	public boolean updateUser(UserInfo user);
	public List<UserInfo> getUsersLike();
	public List<UserInfo> getUsers();
	public UserInfo getUserByNameAndPwd(UserInfo user);
}
