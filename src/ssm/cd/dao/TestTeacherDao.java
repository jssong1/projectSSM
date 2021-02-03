package ssm.cd.dao;


import java.util.List;

import ssm.cd.vo.TestTeacherVO;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

public interface TestTeacherDao {

   public List<TestTeacherVO> listStudent(TestTeacherVO ttvo);
   public TMemberVO myclass(TMemberVO tvo);
   public List<SMemberVO> mystudent(TMemberVO tvo);
}