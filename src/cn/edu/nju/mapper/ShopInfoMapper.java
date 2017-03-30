package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.ShopInfo;

public interface ShopInfoMapper {
	public boolean addShop(ShopInfo user);
	public boolean removeShop(ShopInfo co);
	public boolean updateShop(ShopInfo co);
	public List<ShopInfo> getShopsLike();
	public List<ShopInfo> getShops();
	public ShopInfo getShopByName(ShopInfo co);
}
