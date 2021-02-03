package ssm.br.controller;


import java.io.File;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.br.service.Non_ProgramService;
import ssm.br.vo.Non_ProgramVO;
import ssm.cd.controller.TeacherController;
import ssm.cd.vo.TestTeacherVO;

@Controller
@RequestMapping("/nonprogram")
public class Non_ProgramController {
   

   Logger logger = Logger.getLogger(TeacherController.class);
   
   @Autowired
   private Non_ProgramService non_ProgramService;
   
   //����ȭ�� ����Ʈ�̱�
   @RequestMapping("/np_Main")
   public String np_Main(@ModelAttribute Non_ProgramVO npvo ,Model model){
      String npTitle="";
      String npContents="";
      if(npvo.getNpTitle()!=null) {
         npTitle=npvo.getNpTitle();
         model.addAttribute("npTitle",npTitle);

      }
      if(npvo.getNpContents()!=null){         
         npContents=npvo.getNpContents();
         model.addAttribute("npContents",npContents);
      }
      //����Ʈ����� ���Ͻ�(ó�� ȭ���� �����)����
      if(npvo.getListSize()==null){
         logger.info("listSize()���� null�Դϴ� 10���� �ʱ�ȭ�մϴ�");
         npvo.setListSize("10");
      }
      
      //������������ ���Ͻ� (ó�� ȭ�� �����)����
      if(npvo.getPageNo()==null){
         logger.info("pageNo()���� null�Դϴ� 1���� �ʱ�ȭ�մϴ�");
         npvo.setPageNo("1");
      }
      
      
      List list = non_ProgramService.listProgram(npvo);
      
      if(list.size()>0){
         model.addAttribute("list",list);   
      }else{
         logger.info("����Ʈ������ 0�̾�~");
      }

      logger.info("list>>>"+list.size());
      logger.info("npvo.toString()>>>"+npvo.toString());
      model.addAttribute("listSize",npvo.getListSize());
      

      return "br/np_Main";
   }
   //���Է� ������
   @RequestMapping("/np_InsertForm")
   public String np_InsertForm(){
      return "br/np_InsertForm";
   }
   
   //���ۼ� Ŭ���� �����Լ�
   @RequestMapping("/np_InsertData")
      public String np_InsertData(HttpServletRequest hsr,Model model){
      logger.info("���ۼ� ����");
      
      int result = 0;
      String resultStr="";
      Non_ProgramVO npvo = new Non_ProgramVO();
      
      try{
         logger.info("try�� ��������");
      String npNo="";
      logger.info("�� ä�� ������");
         npNo = non_ProgramService.np_Chaebun();
         logger.info("�� ä�������");
         if (npNo.length()==1) npNo ="000"+npNo;
         if (npNo.length()==2) npNo ="00"+npNo;
         if (npNo.length()==3) npNo ="0"+npNo;
         npNo = "NP"+npNo;
         
         
         MultipartRequest mr = new MultipartRequest(hsr,
                        "C:/ProjectSSM/java142_Luna_SungIll/ProjectSSM/Project_SSM/WebContent/file",
                        10000*10000,
                        "utf-8"
                        ,new DefaultFileRenamePolicy());
         
         
         logger.info("�� npvo ������");
         npvo.setNpNo(npNo);
         npvo.setNpTitle(mr.getParameter("npTitle"));
         npvo.setNpContents(mr.getParameter("npContents"));
         npvo.setNpCenter(mr.getParameter("npCenter"));
         npvo.setNpImage(mr.getFilesystemName("npImage"));
         npvo.setNpRsdate(mr.getParameter("npRsdate"));
         npvo.setNpRedate(mr.getParameter("npRedate"));
         npvo.setNpPsdate(mr.getParameter("npPsdate"));
         npvo.setNpPedate(mr.getParameter("npPedate"));
         npvo.setNpObject(mr.getParameter("npObject"));
         npvo.setNpPersonnel(mr.getParameter("npPersonnel"));
         //npvo.setTtNo(mr.getParameter("ttNo"));ttno �������� ��������
         npvo.setTtNo("T200001");
         npvo.setNpIo(mr.getParameter("npIo"));
         npvo.setAcode(mr.getParameter("Acode"));
         //����ģ��
         logger.info("���Ͻ���");
         npvo.setNpFile(mr.getFilesystemName("npFile"));
         logger.info("���ϳ�");
         //����ģ�� ��
         logger.info("�߼��� ������");
         result = non_ProgramService.np_InsertData(npvo);
         logger.info("try�� ������");
      }catch(Exception e){
         e.printStackTrace();
      }
      logger.info("npvo.toString()>>>"+npvo.toString());
      if(result>0) resultStr="���ۼ�����";
      else resultStr="����";
         model.addAttribute("resultStr",resultStr);
         
      return "br/result";   
      }
   //������
   @RequestMapping("/np_detailData")
   public String np_detailData(@RequestParam String npNo ,Model model){
      logger.info("npNo>>>"+npNo);
      Non_ProgramVO npvo = new Non_ProgramVO();
      npvo.setNpNo(npNo);
      
      
      List list = non_ProgramService.np_detailData(npvo);
      if(list.size()>0){
         model.addAttribute("list",list);
         logger.info("�������>>"+list.get(0).toString());
         }else{
         logger.info("list ���̾�~");
      }
         
      return "br/np_Detail";
   }
   
 //������
   @RequestMapping("/np_detailData2")
   public String np_detailData2(@ModelAttribute Non_ProgramVO nvo ,Model model){
	   logger.info("np�ε� �Ѿ�°���>>>: " + nvo.getNpNo());
      if(Integer.parseInt(nvo.getNpNo()) < 10){
    	  nvo.setNpNo("0" + nvo.getNpNo());
      }
	  nvo.setNpNo("NP00" + nvo.getNpNo());
      List list = non_ProgramService.np_detailData(nvo);
      if(list.size()>0){
         model.addAttribute("list",list);
         logger.info("�������>>"+list.get(0).toString());
         }else{
         logger.info("list ���̾�~");
      }
         
      return "br/np_Detail";
   }
   
   //������ ����
   @RequestMapping("/updateForm")
   public String updateForm(@RequestParam String npNo ,Model model){
      logger.info("npNo>>>"+npNo);
      Non_ProgramVO npvo = new Non_ProgramVO();
      npvo.setNpNo(npNo);
      
      
      List list = non_ProgramService.np_detailData(npvo);
      if(list.size()>0){
         model.addAttribute("list",list);
      }else{
         logger.info("list ���̾�~");
      }   
      return "br/np_UpdateForm";
   }
   //���� Ŭ���� �����Լ�
   @RequestMapping("/np_DetailUpdate")
   public String np_DetailUpdate(HttpServletRequest hsr,Model model){
      int result = 0;
      String resultStr="";
      Non_ProgramVO npvo = new Non_ProgramVO();
      String uploadFile = hsr.getSession().getServletContext().getRealPath("file");
      try{
         logger.info("try�� ��������");
         logger.info("�� npvo ������");
         MultipartRequest mr = new MultipartRequest(hsr,
        		 		uploadFile,
                        10000*10000,
                        "utf-8"
                        ,new DefaultFileRenamePolicy());
         
         
         logger.info("�� npvo ������");
         npvo.setNpNo(mr.getParameter("npNo"));
         npvo.setNpTitle(mr.getParameter("npTitle"));
         npvo.setNpContents(mr.getParameter("npContents"));
         npvo.setNpCenter(mr.getParameter("npCenter"));
         npvo.setNpImage(mr.getParameter("npImage"));
         npvo.setNpRsdate(mr.getParameter("npRsdate"));
         npvo.setNpRedate(mr.getParameter("npRedate"));
         npvo.setNpPsdate(mr.getParameter("npPsdate"));
         npvo.setNpPedate(mr.getParameter("npPedate"));
         npvo.setNpObject(mr.getParameter("npObject"));
         npvo.setNpPersonnel(mr.getParameter("npPersonnel"));
         //npvo.setTtNo(mr.getParameter("ttNo"));ttno �������� ��������
         npvo.setTtNo("T200001");
         npvo.setNpIo(mr.getParameter("npIo"));
         npvo.setAcode(mr.getParameter("Acode"));
         logger.info("�����̹���"+mr.getParameter("npImage"));
         logger.info("���ο� �̹���"+mr.getFilesystemName("NEW_npImage"));
         if(mr.getFilesystemName("NEW_npImage")!="" && mr.getFilesystemName("NEW_npImage")!=null){
            npvo.setNpImage(mr.getFilesystemName("NEW_npImage"));
         }else{
            npvo.setNpImage(mr.getParameter("npImage"));
         }
         logger.info("�߼��� ������");
         result = non_ProgramService.np_DetailUpdate(npvo);
         logger.info("try�� ������");
      }catch(Exception e){
         e.printStackTrace();
      }
      logger.info("npvo.toString()>>>"+npvo.toString());
      if(result>0) resultStr="������Ʈ����";
      else resultStr="����";
         model.addAttribute("resultStr",resultStr);
         model.addAttribute("npNo",npvo.getNpNo());
      return "br/result";   
      }
   
   //���� ����
      @RequestMapping("np_Delete")
      public String np_Delete(@ModelAttribute Non_ProgramVO npvo,Model model){
         logger.info("npvo.getNpNo>>>"+npvo.getNpNo());
         int result = 0;
         String resultStr = "";
         result = non_ProgramService.np_Delete(npvo);
         logger.info("result>>>"+result);
         if(result>0) resultStr = "np���� ����";
         else resultStr = "np���� ����";
         model.addAttribute("resultStr",resultStr);
         return "br/result";
      }
      
      @RequestMapping("downLoad")
      public String downLoad(@ModelAttribute Non_ProgramVO npvo,HttpServletRequest hsr,Model model ){
         String npFile = hsr.getParameter("filename");
         logger.info("npFile>>"+npFile);
         model.addAttribute("file",npFile);
         return "common/download";
      }
      
}
