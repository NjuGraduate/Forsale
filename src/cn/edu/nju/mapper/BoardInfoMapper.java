package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.BoardInfo;
import cn.edu.nju.po.UserInfo;

public interface BoardInfoMapper {
	public boolean addBoard(BoardInfo user);
	public boolean removeBoard(BoardInfo user);
	public List<BoardInfo> getBoardsByAccount(UserInfo user);
}
