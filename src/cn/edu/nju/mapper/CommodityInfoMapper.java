package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.UserInfo;

public interface CommodityInfoMapper {
	public boolean addCommodity(CommodityInfo user);
	public boolean removeCommodity(CommodityInfo co);
	public boolean updateCommodity(CommodityInfo co);
	public List<CommodityInfo> getCommoditysLike();
	public List<CommodityInfo> getCommoditys();
	public CommodityInfo getCommodityById(CommodityInfo co);
	public CommodityInfo getCommodityByAccount(UserInfo user);
}
