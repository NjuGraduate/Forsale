package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.ShopInfo;
import cn.edu.nju.po.UserInfo;

public interface ShopInfoMapper {
	public boolean addShop(ShopInfo user);
	public boolean removeRecord(ShopInfo co);
	public boolean updateShop(ShopInfo co);
	public List<ShopInfo> getShopsLike(ShopInfo co);
	public List<ShopInfo> getShops();
	public ShopInfo getShopById(ShopInfo co);
	public ShopInfo getShopByUserAccount(UserInfo user);
}
