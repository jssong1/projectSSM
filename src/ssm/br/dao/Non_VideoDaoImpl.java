package ssm.br.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.br.vo.Non_VideoVO;

@Repository
public class Non_VideoDaoImpl implements Non_VideoDao {
	
	@Autowired
	private SqlSession session;
	@Override
	public List listVideo() {
		// TODO Auto-generated method stub
		return session.selectList("listVideo");
	}
	@Override
	public int insertVideo(Non_VideoVO nvvo) {
		return session.insert("insertVideo");
	}
	@Override
	public String chaebun() {
		
		return session.selectOne("chaebun");
	}
	@Override
	public int updateVideo(Non_VideoVO nvvo) {
		
		return session.update("updateVideo");
	}
	@Override
	public List goUpdateVideo(Non_VideoVO nvvo) {

		return session.selectList("goUpdateVideo");
	}
	@Override
	public int deleteVideo(Non_VideoVO nvvo) {
		
		return session.update("deleteVideo");
	}

}
