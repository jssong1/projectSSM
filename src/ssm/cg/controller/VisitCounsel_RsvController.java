package ssm.cg.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.cg.service.VisitCounsel_RsvService;
import ssm.cg.vo.Online_CommentVO;
import ssm.cg.vo.VisitCounsel_RsvVO;
import ssm.common.utils.ChaebunClass;
import ssm.common.utils.CodeTable;

@Controller
@RequestMapping(value="/visitCounsel")
public class VisitCounsel_RsvController {

   Logger logger = Logger.getLogger(VisitCounsel_RsvController.class);
   
   @Autowired
   private VisitCounsel_RsvService visitCounsel_RsvService;
    
   @RequestMapping(value="/vcSchedule")
   public String vcSchedule(){
      logger.info("vcSchedule() start");
      String url = "";
      url = "/cg/visit/vrStudent/vcSchedule";            
      logger.info("vcSchedule() end");
      return url;
   }
   
   // 내 예약현황 보기
   @RequestMapping(value = "/vcMineList", method= {RequestMethod.GET, RequestMethod.POST})
   public String vcMineList(@ModelAttribute VisitCounsel_RsvVO vcRvo, Model model,
                     HttpSession session)  throws Exception{
      logger.info("(log)Controller.vcMineList() start >>>");
      String ssNo = (String) session.getAttribute("USERNO");
      VisitCounsel_RsvVO ssNoInfo =  visitCounsel_RsvService.ssNoInfo(ssNo);      
      String ssName = ssNoInfo.getSmemberVO().getSsName();
      String ttNo = ssNoInfo.getTmemberVO().getTtNo();
      String ttName = ssNoInfo.getTmemberVO().getTtName();
      
      logger.info("ssName>>:" +ssName);
      logger.info("ttNo>>:" +ttNo);
      logger.info("ttName>>:" +ttName);
      
      //내 예약정보가져오기           
      vcRvo.setTtNo(ttNo);
      vcRvo.setSsNo(ssNo);
      List<VisitCounsel_RsvVO> vcMineList = visitCounsel_RsvService.vcMineList(vcRvo);
      logger.info("controller vcMineList >> : " + vcMineList);
      model.addAttribute("vcMineList", vcMineList);      
      logger.info("(log)Controller.vcMineList() end >>>"); 
      
      return "cg/visit/vrStudent/vcMine";
      
   }
   
   // 시간표 출력 ajax
   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping(value = "/vcScheduleList", method= {RequestMethod.GET, RequestMethod.POST})
   public JSONArray vcRsvList(@ModelAttribute VisitCounsel_RsvVO vcRvo, Model model,HttpSession session){
      
      logger.info("(log)Controller.vcScheduleList() start >>>");
      String ssNo = (String) session.getAttribute("USERNO");
    //학생번호로 교사번호 가지고 오기
      VisitCounsel_RsvVO ssNoInfo =  visitCounsel_RsvService.ssNoInfo(ssNo);
      String ttNo = ssNoInfo.getTmemberVO().getTtNo();
      
      vcRvo.setSsNo(ssNo);
      vcRvo.setTtNo(ttNo);
      List<VisitCounsel_RsvVO> timeList = visitCounsel_RsvService.vcRsvList(vcRvo);
      
      // json객체, 배열 생성
      JSONObject jObj = new JSONObject();
      JSONArray jArr = new JSONArray();
      
      ArrayList<VisitCounsel_RsvVO> aTimeList = (ArrayList<VisitCounsel_RsvVO>)timeList;
      
      for(int i = 0; i < aTimeList.size(); i++){
         jObj = new JSONObject();
         
         // 교사번호
         jObj.put("groupId", aTimeList.get(i).getTtNo());
         
         // 학생 번호
         jObj.put("id", aTimeList.get(i).getSsNo());
         
         // 상담시간
         jObj.put("title", aTimeList.get(i).getVrTime());
         
         // 날짜
         jObj.put("start", aTimeList.get(i).getVrDate());
         

         if(aTimeList.get(i).getVrStatus()==null){
            jObj.put("groupId", aTimeList.get(i).getTtNo());
            jObj.put("color", "#88d2d2");
            jObj.put("textColor", "white");
            jObj.put("title", aTimeList.get(i).getVrTime());
         } else {
        	 // 승인상태별 글씨, 배경 색상설정#
        	 /*
        	  * 01	대기 , 02	승인, 03	취소, 04	완료*/
            if(aTimeList.get(i).getVrStatus().equals("00")){jObj.put("color", "#337AB7");jObj.put("textColor", "CD0000");}
            if(aTimeList.get(i).getVrStatus().equals("01")){jObj.put("color", "#aaaaaa");jObj.put("textColor", "white");}
            if(aTimeList.get(i).getVrStatus().equals("02")){jObj.put("color", "#aaaaaa");jObj.put("textColor", "white");}
            if(aTimeList.get(i).getVrStatus().equals("03")){jObj.put("color", "#3788d8");jObj.put("textColor", "white");}
            if(aTimeList.get(i).getVrStatus().equals("04")){jObj.put("color", "#aaaaaa");jObj.put("textColor", "white");}
         }

         jArr.add(jObj);
      }

      logger.info("(log)Controller.vcScheduleList() end >>>");
      
      return jArr;

   } 
   
   //예약하기팝업
   @ResponseBody
   @RequestMapping("/vcSchedulePop")
   public Map<String, Object>  selectMember (@RequestBody VisitCounsel_RsvVO vcRvo, Model model,HttpSession session){
      logger.info("(log) Controller.vcSchedulePop>>> : ");
      
      String ssNo = (String) session.getAttribute("USERNO");
      
      //세션번호로 정보 얻기
      VisitCounsel_RsvVO ssNoInfo =  visitCounsel_RsvService.ssNoInfo(ssNo);
      String ttName = ssNoInfo.getTmemberVO().getTtName();
      String ssName = ssNoInfo.getSmemberVO().getSsName();
      
      Map<String, Object> map = new HashMap<String, Object>();
      String fulldate = vcRvo.getVrDate();
      String vrDate = CodeTable.vrDate(fulldate);
      
      vcRvo.setVrDate(vrDate);
      
      map.put("groupId", vcRvo.getTtNo());
      map.put("time", vcRvo.getVrTime());
      map.put("id", vcRvo.getVrNo());
      map.put("start", vcRvo.getVrDate());
      map.put("ttName",ttName);
      map.put("ssName",ssName);
      String reserved = vcRvo.getVrNo();

         if(reserved.equals("null")){
            logger.info("일정없음 예약가능");
            map.put("alert", "possible");
         }else{
            logger.info("일정있음 예약불가");
            map.put("alert", "reserved");         
         }
      return map;
   }
   
   @RequestMapping("/insertBooking")
   public String insertBooking (@ModelAttribute VisitCounsel_RsvVO vcRvo, Model model){
      logger.info("(log) Controller.insertBooking>>> : ");
      logger.info("getVrDate >> : " +vcRvo.getVrDate());
      logger.info("getSsNo >> : " +vcRvo.getSsNo());
      logger.info("getTtNo >> : " +vcRvo.getTtNo());   
      logger.info("getVrStatus >> : " +vcRvo.getVrStatus());   
      logger.info("getVrTime >> : " +vcRvo.getVrTime());   
      logger.info("getVrField >> : " +vcRvo.getVrField()); 
      logger.info("getTtNo >> : " +vcRvo.getTtNo()); 
      
      String vrDate = CodeTable.vrDate(vcRvo.getVrDate());
      vcRvo.setVrDate(vrDate);
      
      String chNo="";
      VisitCounsel_RsvVO vcvo = visitCounsel_RsvService.vrChaebun(vcRvo); 
      chNo = vcvo.getVrNo();
      vcRvo.setVrNo(ChaebunClass.VRchaeunNo(chNo));
      int vcRvo1 = visitCounsel_RsvService.insertVC(vcRvo);
      logger.info("vcRvo1>>> :"+vcRvo1);
      model.addAttribute("vcRvo", vcRvo);
      return "/cg/visit/vrStudent/result";
   }
   
   @ResponseBody
   @RequestMapping(value="/{vrNo}.ssm",method = {RequestMethod.PUT, RequestMethod.PATCH})
   public ResponseEntity<String> cancelBooking(@PathVariable("vrNo") String vrNo, @RequestBody VisitCounsel_RsvVO vcRvo){
      logger.info("cancelBooking START");
      logger.info("cancelBooking>>: " + vrNo);
      ResponseEntity<String> entity = null;
      
      try{
         vcRvo.setVrNo(vrNo);
         visitCounsel_RsvService.cancelBooking(vcRvo);
         entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
      }catch(Exception e){
         e.printStackTrace();
         entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
      }
      logger.info("cancelBooking END");
      return entity;
   }
} // VisitCounsel_ScheduleController