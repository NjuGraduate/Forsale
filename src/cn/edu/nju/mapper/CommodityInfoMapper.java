package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.CommodityInfo;

public interface CommodityInfoMapper {
	public boolean addCommodity(CommodityInfo user);
	public boolean removeCommodity(CommodityInfo co);
	public boolean updateCommodity(CommodityInfo co);
	public List<CommodityInfo> getCommoditysLike();
	public List<CommodityInfo> getCommoditys();
	public CommodityInfo getCommodityByName(CommodityInfo co);
}
