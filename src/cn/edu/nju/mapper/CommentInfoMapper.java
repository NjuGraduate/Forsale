package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.CommentInfo;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.UserInfo;

public interface CommentInfoMapper {
	public boolean addComment(CommentInfo user);
	public boolean removeComment(CommentInfo co);
	public boolean updateComment(CommentInfo co);
	public List<CommentInfo> getCommentsLike(CommentInfo co);
	public List<CommentInfo> getComments();
	public CommentInfo getCommentById(CommentInfo co);
	public List<CommentInfo> getCommentByCommodityUserAccount(CommodityInfo com);
	public List<CommentInfo> getCommentByCommodityId(CommodityInfo com);
}
