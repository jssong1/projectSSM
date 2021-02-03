package ssm.cd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;










import ssm.cd.service.TestTeacherService;
import ssm.cd.vo.TestTeacherVO;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

@Controller
@RequestMapping("testTeacher")
public class TeacherController {
   @Autowired
   private TestTeacherService testTeacherService;
   
   Logger logger = Logger.getLogger(TeacherController.class);
   
   
   /*@RequestMapping("/listStudent")
   public String listStudent (@ModelAttribute TestTeacherVO ttvo,Model model){
      
      logger.info("ó������ ����>>>"+ttvo.toString());
      //�ݰ� �й��� ���������� ���� ����
      String saveGrade="";
      String saveClass="";
      String saveName="";
      saveGrade=ttvo.getSsGrade();
      saveClass=ttvo.getSsClass();
      saveName=ttvo.getSsName();
      logger.info("saveGrade>>>"+saveGrade);
      logger.info("saveClass>>>"+saveClass);
      logger.info("saveName>>>"+saveName);
      
      

      //����Ʈ����� ���Ͻ�(ó�� ȭ���� �����)����
      if(ttvo.getListSize()==null){
         logger.info("listSize()���� null�Դϴ� 10���� �ʱ�ȭ�մϴ�");
         ttvo.setListSize("10");
      }
      
      //������������ ���Ͻ� (ó�� ȭ�� �����)����
      if(ttvo.getPageNo()==null){
         logger.info("pageNo()���� null�Դϴ� 1���� �ʱ�ȭ�մϴ�");
         ttvo.setPageNo("1");
      }
      
      
      
      boolean bFlag = ttvo.getSsGrade()==null;
      boolean bFlag2= ttvo.getSsClass()==null;
      logger.info("bFlab>>>" +bFlag);//ó�������� ������ false������
      logger.info("bFlab2>>>" +bFlag2);
      if(ttvo.getSsGrade()==null && ttvo.getSsClass()==null){
         logger.info("save Grade,Class \"00\"���� �ʱ�ȭ�մϴ�");
         saveGrade = "DD";
         saveClass = "DD";   
      }
      model.addAttribute("loadName",saveName);
      model.addAttribute("loadGrade",saveGrade);
      model.addAttribute("loadClass",saveClass);
      
      if("DD".equals(ttvo.getSsGrade())){
         logger.info("dd�� ���񽺷ε��� null�� �ٲ�ϴ�");
         ttvo.setSsGrade("");
      }
         
      if("DD".equals(ttvo.getSsClass())){
         logger.info("dd�� �����ε��� null�� �ٲ�ϴ�");
         ttvo.setSsClass("");
      }
      logger.info("�������� ����>>>"+ttvo.toString());
      List<TestTeacherVO> list = testTeacherService.listStudent(ttvo);
      logger.info("���񽺰���� ���°�����>>>"+list.size());
      
      if(list.size() > 0){
         model.addAttribute("list",list);
         
      }else{
         logger.info("�𵨿� ������ ���");
      }
      model.addAttribute("listSize",ttvo.getListSize());
      
      return "cd/test_Teacher";
   }*/
   
   @RequestMapping("/listStudent")
   public String listStudent (@ModelAttribute TMemberVO tvo,Model model,HttpSession session){
      
	   logger.info("����Ʈ��Ʃ��Ʈ ����");
      
      //�������� 
      String userNO = (String)session.getAttribute("USERNO");
      tvo.setTtNo(userNO);
      
      //�ڱ�� �г� �� ������
      tvo = testTeacherService.myclass(tvo);
      logger.info("���� Ŭ����������");
      
      //�г� ���ش� �л� 20�� ����Ʈ ������
      List<SMemberVO> mystudent=testTeacherService.mystudent(tvo); 
      logger.info("���̽�Ʃ��Ʈ ������");
      
      //����Ʈ jsp�� ����
      model.addAttribute("mystudent", mystudent);
      
      return "cd/test_Teacher_";
   }
   
   
}