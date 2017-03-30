package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.PostInfo;

public interface PostInfoMapper {
	public boolean addPost(PostInfo user);
	public boolean removePost(PostInfo user);
	public List<PostInfo> getPostsLike();
	public List<PostInfo> getPosts();
	public PostInfo getPostByNameAndPwd(PostInfo post);
}
