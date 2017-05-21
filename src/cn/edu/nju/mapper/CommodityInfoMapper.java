package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.UserInfo;

public interface CommodityInfoMapper {
	public boolean addCommodity(CommodityInfo co);
	public boolean removeCommodity(CommodityInfo co);
	public boolean updateCommodity(CommodityInfo co);
	public List<CommodityInfo> getCommoditiesByClassification(String str);
	public List<CommodityInfo> getCommoditiesByDes(String str);
	public List<CommodityInfo> getCommodities();
	public CommodityInfo getCommodityById(CommodityInfo co);
	public List<CommodityInfo> getCommodityByUserAccount(UserInfo user);
	public CommodityInfo addOrder(CommodityInfo co,UserInfo user);
	public List<CommodityInfo> showOrder(UserInfo user);
	public CommodityInfo removeOrder(CommodityInfo co);
	public void collectCommodity(CommodityInfo co,UserInfo user);
	public void removeCollectCommodity(CommodityInfo co,UserInfo user);
	public List<CommodityInfo> getCollectCommodity(UserInfo user);
	public List<CommodityInfo> getCommoditiesLike(CommodityInfo co);
}
