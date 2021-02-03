package ssm.br.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ssm.br.vo.Non_ProgramVO;
@Repository
public class Non_ProgramDaoImpl implements Non_ProgramDao {

	private SqlSession session;
	
	@Override
	public String np_Chaebun() {

		return session.selectOne("np_Chaebun");
	}
	
	@Override
	public int np_InsertData(Non_ProgramVO npvo) {
		
		return session.insert("np_InsertData",npvo);
	}
	@Override
	public List listProgram(Non_ProgramVO npvo) {
		
		return session.selectList("listProgram");
	}

	@Override
	public List np_detailData(Non_ProgramVO npvo) {
		return session.selectOne("np_detailData",npvo);
	}

	@Override
	public int np_DetailUpdate(Non_ProgramVO npvo) {
	
		return session.update("np_DetailUpdate",npvo);
	}

	@Override
	public int np_Delete(Non_ProgramVO npvo) {
		
		return session.update("np_Delete",npvo);
	}


}
