package ssm.cd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cd.dao.Value_SettingDao;
import ssm.cd.vo.Value_SettingVO;
@Service
@Transactional
public class Value_SettingServiceImpl implements Value_SettingService {
	
	@Autowired
	private Value_SettingDao value_SettingDao;
	
	
	@Override
	public int saveValueSetting(Value_SettingVO vsvo) {

		return value_SettingDao.saveValueSetting(vsvo);
	}
	@Override
	public int makeChaebun_VS(){
		return value_SettingDao.makeChaebun_VS();
	}
	@Override
	public List loadValueSetting(Value_SettingVO vsvo) {
		
		return value_SettingDao.loadValueSetting(vsvo);
	}
	@Override
	public int updateValueSetting(Value_SettingVO vsvo) {
		
		return value_SettingDao.updateValueSetting(vsvo);
	}
}
