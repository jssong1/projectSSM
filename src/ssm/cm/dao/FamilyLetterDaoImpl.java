package ssm.cm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cm.vo.FamilyLetterVO;

public class FamilyLetterDaoImpl implements FamilyLetterDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<FamilyLetterVO> fllist(FamilyLetterVO fvo) {
		// TODO Auto-generated method stub
		return session.selectList("fllist");
	}

	@Override
	public FamilyLetterVO flChaebun(FamilyLetterVO fvo) {
		// TODO Auto-generated method stub
		return session.selectOne("flChaebun");
	}

	@Override
	public int flInsert(FamilyLetterVO fvo) {
		// TODO Auto-generated method stub
		return session.insert("flInsert");
	}

	@Override
	public FamilyLetterVO flDetail(FamilyLetterVO fvo) {
		// TODO Auto-generated method stub
		return session.selectOne("flDetail");
	}

	@Override
	public int pwdConfirm(FamilyLetterVO fvo, String ttPw) {
		// TODO Auto-generated method stub
		return session.selectOne("pwdConfirm");
	}

	@Override
	public int flUpdate(FamilyLetterVO fvo) {
		// TODO Auto-generated method stub
		return session.update("flUpdate");
	}

	@Override
	public int flDelete(FamilyLetterVO fvo) {
		// TODO Auto-generated method stub
		return session.update("flDelete");
	}

	@Override
	public void flViews(FamilyLetterVO fvo) {
		// TODO Auto-generated method stub
		session.update("flViews");
		
	}


}
