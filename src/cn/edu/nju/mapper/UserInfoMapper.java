package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.UserInfo;

public interface UserInfoMapper {
	
	public List<UserInfo> getAllUser();
	public UserInfo getUserByNameAndPwd(UserInfo user);

}
