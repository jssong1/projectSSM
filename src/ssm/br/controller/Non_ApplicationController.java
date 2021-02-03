package ssm.br.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.br.service.Non_ApplicationService;
import ssm.br.vo.Non_ProgramVO;
import ssm.br.vo.Non_ApplicationVO;

@Controller
@RequestMapping("/non_Application")
public class Non_ApplicationController {
   Logger logger = Logger.getLogger(Non_ApplicationController.class);
   
   @Autowired
   private Non_ApplicationService non_ApplicationService;
   
   @RequestMapping("/non_ApplicationList")
   public String non_ApplicationList (Non_ApplicationVO navo,Model model){
	  logger.info("신청이력리스트 뽑기시작");
	  navo.setSsNo("S7180001");//세션가져오기S
      List list = non_ApplicationService.non_ApplicationList(navo);
      logger.info("listSize>>>"+list.size());
      if(list.size()>0){
         model.addAttribute("list",list);
      }
         
      return "br/na_StudentMain";
   }
   

   @RequestMapping("/non_ApplicationDetail")
   public ResponseEntity<Object> non_ApplicationDetail(@RequestParam("ssNo") String ssNo,@RequestParam("npNo") String npNo,Model model){
      logger.info("ssNo>>"+ssNo);
      logger.info("spNo>>"+npNo);
      ResponseEntity<Object> entity = null;
      Non_ApplicationVO navo= new Non_ApplicationVO();
      List list = null;
      try{
         navo.setSsNo(ssNo);
         navo.setNpNo(npNo);
         logger.info("<<<<tttttt>>>"+navo.toString());
         list = non_ApplicationService.non_ApplicationDeatil(navo);
         logger.info(list.get(0).toString());
         if(list !=null && list.size()>0){
            entity = new ResponseEntity<Object>(list,HttpStatus.OK);
         }
      }catch(Exception e){
         e.printStackTrace();
      }
      return entity;
   }
   
   @RequestMapping("/non_ApplicationInsert")
   public String non_ApplicationInsert (HttpServletRequest request,Non_ApplicationVO navo,Model model){
      int result=0;
      String resultStr="";
      logger.info("navoTtttoString>>>"+navo.toString());
      
      try{
         MultipartRequest mr = new MultipartRequest(request,
                                          "C:/ProjectSSM/java142_Luna_SungIll/ProjectSSM/Project_SSM/WebContent/file",
                                          10000*10000,
                                          "utf-8",
                                          new DefaultFileRenamePolicy());
         logger.info("넣을게");
         String naNo=non_ApplicationService.chaeBun();
         logger.info("채번돌고옴");
         if(naNo.length()==1) naNo="NA000"+naNo;
         if(naNo.length()==2) naNo="NA00"+naNo;
         if(naNo.length()==3)naNo="NA0"+naNo;
         navo.setNaNo(naNo);
         navo.setNpNo(mr.getParameter("npNo"));
         navo.setSsNo(mr.getParameter("ssNo"));
         navo.setNaContents(mr.getParameter("naContents"));
         navo.setNaFile(mr.getFilesystemName("naFile"));
         logger.info("toString>>>"+navo.toString());
         result = non_ApplicationService.non_ApplicationInsert(navo);
         logger.info("result>>>"+result);
         if(result>0) {
             resultStr="신청서작성 성공";
          }else{
             resultStr="신청서작성 실패";
          }
         model.addAttribute("resultStr",resultStr);
      }catch(Exception e){
         e.printStackTrace();
      }   
      return"br/result";
      
      
   }
   @RequestMapping("/downLoad")
   public String downLoad(@ModelAttribute Non_ProgramVO npvo,HttpServletRequest hsr,Model model ){
      String npFile = hsr.getParameter("fileName");
      logger.info("npFile>>"+npFile);
      model.addAttribute("npFile",npFile);
      return "common/download";
   }
   
   @RequestMapping("/non_ApplicationDelete")
   public String non_ApplicationDelete(@ModelAttribute Non_ApplicationVO navo,Model model){
      logger.info("navoString>>>"+navo.toString());
      int result =0;
      String resultStr="";
      result=non_ApplicationService.non_ApplicationDelete(navo);
      if(result>0) resultStr="디테일삭제 성공";
      else resultStr="디테일삭제 실패";
      logger.info(resultStr);
      model.addAttribute("resultStr",resultStr);
      return "br/result";
   }
   @RequestMapping("/non_ApplicationUpdate")
   public String non_ApplicationUpdate (HttpServletRequest request,Non_ApplicationVO navo,Model model){
      int result=0;
      String resultStr="";

      
      try{
         MultipartRequest mr = new MultipartRequest(request,
                                          "C:/ProjectSSM/java142_Luna_SungIll/ProjectSSM/Project_SSM/WebContent/file",
                                          10000*10000,
                                          "utf-8",
                                          new DefaultFileRenamePolicy());
         logger.info("수정넣을게");

         logger.info("navo업뎃>>>"+mr.getParameter("naNo"));
         logger.info("navo업뎃>>>"+mr.getParameter("naContents"));
         navo.setNaNo(mr.getParameter("naNo"));
         navo.setNaContents(mr.getParameter("naContents"));
         if(mr.getFilesystemName("naFile")!=null&&mr.getFilesystemName("naFile")!=""){
            navo.setNaFile(mr.getFilesystemName("naFile"));   
         }
         logger.info("toString>>>"+navo.toString());
         result = non_ApplicationService.non_ApplicationUpdate(navo);
         logger.info("result>>>"+result);
         if(result>0) {
             resultStr="신청서수정 성공";
          }else{
             resultStr="신청서수정 실패";
          }
         model.addAttribute("resultStr",resultStr);
      }catch(Exception e){
         e.printStackTrace();
      }   
      return"br/result";
      
   }
   
   @RequestMapping("/applicationList")
   public String applicationList(@ModelAttribute Non_ApplicationVO nvvo,Model model){
      logger.info("nvvo.toString>>>"+nvvo.toString());
      List list =non_ApplicationService.teacherApplicationList(nvvo);
      model.addAttribute("list",list);
      model.addAttribute("npNo",nvvo.getNpNo());
      return "br/na_TeacherMain";
   }
   
   @RequestMapping("/approval")
   public String approval(@ModelAttribute Non_ApplicationVO nvvo,Model model){
      logger.info("nvvo.toString>>>"+nvvo.toString());
      int result =non_ApplicationService.approval(nvvo);
      List list =non_ApplicationService.teacherApplicationList(nvvo);
      model.addAttribute("list",list);
      model.addAttribute("npNo",nvvo.getNpNo());
      logger.info("컨트롤러승인함수의 nvvo.getNpNo()>>>"+nvvo.getNpNo());
      return "br/na_TeacherMain";
   }
   
   @RequestMapping("/approvalCancel")
   public String approvalCancel(@ModelAttribute Non_ApplicationVO nvvo,Model model){
      logger.info("nvvo.toString>>>"+nvvo.toString());
      int result = non_ApplicationService.approvalCancel(nvvo);
      List list =non_ApplicationService.teacherApplicationList(nvvo);
      model.addAttribute("list",list);
      model.addAttribute("npNo",nvvo.getNpNo());
      logger.info("컨트롤러 승인취소함수의 nvvo.getNpNo()>>>"+nvvo.getNpNo());
      return "br/na_TeacherMain";
   }
   
}