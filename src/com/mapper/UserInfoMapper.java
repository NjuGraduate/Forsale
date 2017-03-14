package com.mapper;

import java.util.List;

import com.po.UserInfo;

public interface UserInfoMapper {
	
	public List<UserInfo> getAllUser();
	public UserInfo getUserByNameAndPwd(UserInfo user);

}
