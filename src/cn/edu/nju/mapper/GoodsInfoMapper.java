package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.GoodsInfo;
import cn.edu.nju.po.UserInfo;

public interface GoodsInfoMapper {
	public boolean addGoods(GoodsInfo user);
	public boolean removeRecord(GoodsInfo co);
	public boolean updateGoods(GoodsInfo co);
	public List<GoodsInfo> getGoodsLike(GoodsInfo co);
	public List<GoodsInfo> getGoods();
	public GoodsInfo getGoodsById(GoodsInfo co);
	public GoodsInfo getGoodsByUserAccount(UserInfo user);

}
