package cn.edu.nju.mapper;

import java.util.List;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.CartInfo;
import cn.edu.nju.po.UserInfo;

public interface CartInfoMapper {
	public boolean addCart(CartInfo re);
	public boolean removeCart(CartInfo re);
	public boolean removeCartByCommodityId(CartInfo re);
	public List<CartInfo> getCartByUserAccount(UserInfo user);
	public List<CartInfo> getCartByCommodityId(CartInfo cart);
}
