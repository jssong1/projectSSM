package ssm.cd.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cd.vo.Value_SettingVO;
@Repository
public class Value_SettingDaoImpl implements Value_SettingDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int saveValueSetting(Value_SettingVO vsvo) {
		
		return session.insert("saveValueSetting");
	}

	@Override
	public int makeChaebun_VS() {
		
		return session.selectOne("makeChaebun_VS");
	}

	@Override
	public List loadValueSetting(Value_SettingVO vsvo) {

		return session.selectList("loadValueSetting");
	}

	@Override
	public int updateValueSetting(Value_SettingVO vsvo) {
		
		return session.update("updateValueSetting");
	}

}
