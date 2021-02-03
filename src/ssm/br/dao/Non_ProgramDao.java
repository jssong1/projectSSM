package ssm.br.dao;

import java.util.List;

import ssm.br.vo.Non_ProgramVO;

public interface Non_ProgramDao {

	public String np_Chaebun();
	
	public int np_InsertData(Non_ProgramVO npvo);

	public List listProgram(Non_ProgramVO npvo);

	public List np_detailData(Non_ProgramVO npvo);

	public int np_DetailUpdate(Non_ProgramVO npvo);

	public int np_Delete(Non_ProgramVO npvo);



}
