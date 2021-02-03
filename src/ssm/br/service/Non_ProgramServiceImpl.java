package ssm.br.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.br.dao.Non_ProgramDao;
import ssm.br.vo.Non_ProgramVO;

@Service
@Transactional
public class Non_ProgramServiceImpl implements Non_ProgramService {
	
	@Autowired
	private Non_ProgramDao non_ProgramDao;

	@Override
	public String np_Chaebun() {
		
		return non_ProgramDao.np_Chaebun();
	}

	@Override
	public int np_InsertData(Non_ProgramVO npvo) {
		
		return non_ProgramDao.np_InsertData(npvo);
	}


	@Override
	public List listProgram(Non_ProgramVO npvo) {
		
		return non_ProgramDao.listProgram(npvo);
	}

	@Override
	public List np_detailData(Non_ProgramVO npvo) {

		return non_ProgramDao.np_detailData(npvo);
	}

	@Override
	public int np_DetailUpdate(Non_ProgramVO npvo) {
		return non_ProgramDao.np_DetailUpdate(npvo);
	}

	@Override
	public int np_Delete(Non_ProgramVO npvo) {

		return non_ProgramDao.np_Delete(npvo);
	}



	
	
}
