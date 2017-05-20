package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.AdvertisementInfo;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.UserInfo;

public interface AdvertisementInfoMapper {
	public boolean addAdvertisement(AdvertisementInfo user);
	public boolean removeAdvertisement(AdvertisementInfo ad);
	public boolean updateAdvertisement(AdvertisementInfo ad);
	public List<AdvertisementInfo> getAdvertisementsLike(String str);
	public List<AdvertisementInfo> getAdvertisements();
	public AdvertisementInfo getAdvertisementById(AdvertisementInfo ad);
	public List<AdvertisementInfo> getAdvertisementByUserAccount(UserInfo user);
	public AdvertisementInfo getAdvertisementByCommodityId(AdvertisementInfo ad);
}
