package ssm.cd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ssm.cd.vo.TestTeacherVO;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;


@Repository
public class TestTeacherDaoImpl implements TestTeacherDao {
   private SqlSession session;
   
   
   @Override
   public List<TestTeacherVO> listStudent(TestTeacherVO ttvo) {
      // TODO Auto-generated method stub
      return session.selectList("listStudent",ttvo);
   }


   @Override
   public TMemberVO myclass(TMemberVO tvo) {
      // TODO Auto-generated method stub
      return session.selectOne("myclass",tvo);
   }


   @Override
   public List<SMemberVO> mystudent(TMemberVO tvo) {
      // TODO Auto-generated method stub
      return session.selectList("mystudent",tvo);
   }

}