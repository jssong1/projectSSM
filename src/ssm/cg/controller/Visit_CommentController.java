package ssm.cg.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.cg.common.CgCommon;
import ssm.cg.service.Visit_CommentService;
import ssm.cg.vo.Visit_CommentVO;
import ssm.common.utils.ChaebunClass;

@Controller
@RequestMapping(value="/vrComment")
public class Visit_CommentController {
	
	@Autowired
	private Visit_CommentService visit_CommentService;
	
	Logger logger = Logger.getLogger(Edu_ScheduleController.class);
	
	// 채번 구분코드
	public static final String VC_CHAEBUN = "VC";

	@ResponseBody
	@RequestMapping(value="/vcInsert")
	public String vcInsert(@RequestBody Visit_CommentVO vvo, HttpSession session){
		
		logger.info("(log)Controller.vcInsert() start >>>");
		
		int result = 0;

		//세션
		String user = (String)session.getAttribute("USERNO");
		vvo.setTtNo(user);
	
		//채번
		Visit_CommentVO chaebun = visit_CommentService.vcChaebun(vvo);
		String vcChaebun = chaebun.getVcNo();
		vvo.setVcNo(VC_CHAEBUN + ChaebunClass.commNum(vcChaebun));
		
		logger.info("(log)vrNo : " + vvo.getVrNo());
		logger.info("(log)vcNo : " + vvo.getVcNo());
		logger.info("(log)ttNo : " + vvo.getTtNo());
		logger.info("(log)ssNo : " + vvo.getSsNo());
		logger.info("(log)vcComments : " + vvo.getVcComments());
		
		// insert
		result = visit_CommentService.vcInsert(vvo);
				
		boolean bResult = result != 0;
		
		// 확인
		logger.info("(log)result  : " + result);
		
		String vcComments = vvo.getVcComments();
		
		logger.info("(log)Controller.vcInsert() end <<<");
		
		if(bResult) return  vcComments;
		else return null;
	}
	
	// 상담 결과지 수정
	@ResponseBody
	@RequestMapping(value="/vcUpdate")
	public String vcUpdate(@RequestBody Visit_CommentVO vvo){
		
		logger.info("(log)Controller.vcUpdate() start >>>");
		
		String vcComments = vvo.getVcComments();
		
		logger.info("(log)vrNo : " + vvo.getVrNo());
		logger.info("(log)vcComments : " + vvo.getVcComments());
		
		int result = 0;
		String url = "";
		result = visit_CommentService.vcUpdate(vvo);
		
		boolean bResult = result != 0;
		
		logger.info("(log)Controller.vcUpdate() end <<<");
		
		if(bResult) return vcComments;
		else return null;
	}
	
	// 상담 결과지 삭제
	@RequestMapping(value="/vcDelete")
	public String vcDelete(@ModelAttribute Visit_CommentVO vvo){
		
		logger.info("(log)Controller.vcUpdate() start >>>");
		
		logger.info("(log)vrNo : " + vvo.getVrNo());
		
		int result = 0;
		String url = "";
		result = visit_CommentService.vcDelete(vvo);
		
		boolean bResult = result != 0;
		if(bResult) url = "/eduSchedule/eduRsvList.ssm";
		
		logger.info("(log)Controller.vcUpdate() end <<<");
		
		return "redirect:" + url;
	}
}
