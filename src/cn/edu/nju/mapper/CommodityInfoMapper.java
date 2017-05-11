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
	public CommodityInfo getCommodityByAccount(UserInfo user);
	public CommodityInfo addOrder(CommodityInfo co);
	public CommodityInfo removeOrder(CommodityInfo co);
}
