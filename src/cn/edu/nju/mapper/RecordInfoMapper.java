package cn.edu.nju.mapper;

import java.util.List;

import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.RecordInfo;
import cn.edu.nju.po.UserInfo;

public interface RecordInfoMapper {
	public boolean addRecord(RecordInfo re);
	public boolean removeRecord(RecordInfo re);
	public List<RecordInfo> getRecordsLike(RecordInfo re);
	public List<RecordInfo> getRecords();
	public RecordInfo getRecordById(RecordInfo re);
	public List<RecordInfo> getRecordByUserAccount(UserInfo user);
	public List<RecordInfo> getRecordByCommodityId(CommodityInfo co);
	public List<RecordInfo> getRecordBySellerAccount(UserInfo user);
}
