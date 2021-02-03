package ssm.cd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ssm.cd.service.TestService;
import ssm.cd.vo.J_DataVO;
import ssm.cd.vo.Job_DataVO;
import ssm.cd.vo.M_DataVO;
import ssm.cd.vo.Major_DataVO;
import ssm.cd.vo.S_DataVO;
import ssm.cd.vo.School_DataVO;
import ssm.cd.vo.TestVO;
import ssm.common.utils.UserSession;
import ssm.mi.service.SMemberService;
import ssm.mi.vo.SMemberVO;

@Controller
@RequestMapping("/test")
public class TestController {
	
	Logger logger = Logger.getLogger(TestController.class);
	@Autowired
	private TestService testService;
	
	@Autowired
	private SMemberService SMemberService;
	
	// �׽�Ʈ
	@RequestMapping("/test")
	public String test(){
		return"cd/test";
	}
	
	// �˻������� ���� �Լ�
	@RequestMapping("/goMainPage")
	public String goMainPage(HttpServletRequest req,Model model){
		logger.info("goMainPage start");
		
		String ssNo   = "";
		TestVO tvo    = null;
		SMemberVO svo = null;
		List list     = null;
		List list2    = null;
		try {
			ssNo = UserSession.getSessionNO(req);
			tvo = new TestVO();
			tvo.setSsNo(ssNo);
			list = testService.testList(tvo);
			if(list != null){
				model.addAttribute("list", list);
			}
			svo = new SMemberVO();
			svo.setSsNo(ssNo);
			list2 = SMemberService.getGrade(svo);
			model.addAttribute("list2", list2);
			SMemberVO svo2 = (SMemberVO)list2.get(0);
			logger.info("grade >>> : "+svo2.getSsGrade());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.info("error >>> : "+e.getMessage());
			e.printStackTrace();
		}
		
		logger.info("goMainPage end");
		return "cd/cd_Main2";
	}
	
	
	@RequestMapping("/go_test")
	public String JobAptitudePage(@RequestParam("page") String page,HttpServletRequest req,Model model){
		logger.info("test() start");
	      String ssNo   = "";
	      String url = "";
	      List list     = null;
	      SMemberVO svo = null;
	      
	      try {
	         ssNo = UserSession.getSessionNO(req);
	         svo = new SMemberVO();
	         svo.setSsNo(ssNo);
	         list = SMemberService.sInformation(svo);
	         if(list != null){
	            model.addAttribute("list", list);
	            url = "cd/"+page;
	         }else{
	            model.addAttribute("alert","ȸ�������� ������ �� �����ϴ�. �ٽ� �α��� ���ּ���.");
	            url = "mainForm";
	            
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      
	      logger.info("test() end");
		return url;
	}
	
	
	//�˻� ���ֱ��Լ�
	@RequestMapping("/jobAptitudeInsert")
	public String insertResult(@ModelAttribute TestVO cdvo,Model model){
	logger.info("insertResult �Լ� ����");
	int result = 0;
	String resultStr="";
//	String SsNo = "1";//�����Լ��� �޾ƿ���
//	String CdGrade="1";//�����Լ��� �޾ƿ���
	
	int chaebun = testService.makeChaebun();//ä������
	String Chaebun = chaebun+"";
	if (Chaebun.length()==1) Chaebun ="000"+Chaebun;
	if (Chaebun.length()==2) Chaebun ="00"+Chaebun;
	if (Chaebun.length()==3) Chaebun ="0"+Chaebun;
	Chaebun = "CD"+Chaebun;
	cdvo.setCdNo(Chaebun);
	
//	logger.info("cdvo�� CdNo>>>"+ cdvo.getCdNo());
//	cdvo.setSsNo(SsNo);
//	logger.info("cdvo�� SsNo>>>"+ cdvo.getSsNo());
//	cdvo.setCdGrade(CdGrade);
//	logger.info("cdvo�� CdGrade>>>"+ cdvo.getCdGrade());
//	cdvo.setCdValue("JA");
//	logger.info("cdvo�� setCdValue>>>"+ cdvo.getCdValue());
//	logger.info("cdvo�� CdUrl>>>"+ cdvo.getCdUrl());
	
	String url = "";
	result = testService.insertResult(cdvo);
		if(result>0)resultStr="����"; 
		else resultStr="����";
		model.addAttribute("resultStr", resultStr);
		model.addAttribute("resultUrl", cdvo);
		return "cd/result";
	}
	
	//�б����� �������� ���� �Լ�
		@RequestMapping("/schoolInfoList")
		public String schoolInfoList(@ModelAttribute School_DataVO svo,Model model,@ModelAttribute S_DataVO dvo){
			logger.info("schoolInfoList() start");
			if(svo.getSd_listSize() == null){
				svo.setSd_listSize("10");
			}
			if(svo.getSd_curPage() == null){
				svo.setSd_curPage("1"); 
			}
			List list = null;
			list = testService.schoolInfoList(svo);
			logger.info("list.size() >>> : "+list.size());
			model.addAttribute("list", list);
			model.addAttribute("saveData", dvo);
			model.addAttribute("saveData3", svo);
			logger.info("schoolInfoList() end");
			return "cd/schoolInfoList";
		}
		
		//�а����� �������� ���� �Լ�
		@RequestMapping("/majorList")
		public String majorList(@ModelAttribute Major_DataVO mdvo,Model model,@ModelAttribute M_DataVO mdvo2){
			logger.info("majorList() start");
			
			if(mdvo.getListSize() == null){
				mdvo.setListSize("10");
			}
			if(mdvo.getCurPage() == null){
				mdvo.setCurPage("1"); 
			}
			
			List list = testService.majorList(mdvo);
//			List list = null;
			if(list != null){
				model.addAttribute("list", list);
				model.addAttribute("saveData", mdvo);
				model.addAttribute("saveData2", mdvo2);
			}else{
				logger.info("list.size >>> : 0�Դϴ�.");
			}
			
			logger.info("majorList() end");
			return "cd/majorList";
		}
		
		//�а����� ������������
		@RequestMapping("/majorDetail")
		public String majorDetail(@RequestParam("majorSeq") String majorSeq,Model mod){
			logger.info("majorDeatail() start");
			logger.info("majorSeq >>> : "+majorSeq);
			
			if(majorSeq != null && majorSeq.length() > 0){
				Major_DataVO mdvo = null;
				mdvo = new Major_DataVO();
				mdvo.setMajorSeq(majorSeq);
				List list = testService.majorDetail(mdvo);
				if(list != null && list.size() > 0){
					mod.addAttribute("list", list);
				}
			}
			
			logger.info("majorDeatail() end");
			return "cd/majorDetail";
		}
		
		//�������� ������ ������
		@RequestMapping("/jobDetail")
		public String jobDetail(@RequestParam("jobDicSeq") String jobDicSeq,Model model){
			logger.info("jobDetail() start");
			logger.info("jobDicSeq >>> : "+jobDicSeq);
			String url = "";
			Job_DataVO jdvo = null;
			List list = null;
			
			if(jobDicSeq != null && jobDicSeq.length() > 0){
				jdvo = new Job_DataVO();
				jdvo.setJobDicSeq(jobDicSeq);
				list = testService.jobDetail(jdvo);
				if(list != null && list.size() > 0){
					model.addAttribute("list", list);
					url = "cd/jobDetail";
				}else{
					url = "cd/jobList";
				}
			}else{
				url = "cd/jobList";
			}
			
			logger.info("jobDetail() end");
			return url;
		}
			
			
		//�������� ����Ʈ������
		@RequestMapping("/jobList")
		public String jobList(@ModelAttribute Job_DataVO jdvo,Model model,@ModelAttribute J_DataVO jvo ){
			logger.info("jobList() start");
			logger.info("jdvo.ppossibility >>> : "+jdvo.getPpossibility());
			if(jdvo.getListSize() == null){
				jdvo.setListSize("10");
			}
			if(jdvo.getCurPage() == null){
				jdvo.setCurPage("1"); 
			}
			List list = testService.jobList(jdvo);
			if(list != null && list.size() > 0){
				model.addAttribute("list", list);
				model.addAttribute("saveData", jdvo);
			}
			model.addAttribute("saveData2", jvo);
			logger.info("jobList() end");
			return "cd/jobList";
		}
}
