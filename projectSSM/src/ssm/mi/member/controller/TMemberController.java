package ssm.mi.member.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.common.utils.ChaebunClass;
import ssm.common.utils.FilePath;
import ssm.mi.member.service.TMemberService;
import ssm.mi.member.vo.TMemberVO;

@Controller
@RequestMapping(value = "/tMember")
public class TMemberController {
	private static final String CONTEXT_PATH = "tMember";
	Logger log = Logger.getLogger(TMemberController.class);
	
	@Autowired
	private TMemberService 	tmemberService;

	
	/*�������� ���� ���� ��ü��ȸ*/
	@RequestMapping(value="/listTMember",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listTMember(@ModelAttribute TMemberVO param){
		log.info("START");
		
		List<TMemberVO> list = tmemberService.listTMember(param);
		log.info("list>>> : " + list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("tmemberList",list);
		mav.setViewName(CONTEXT_PATH+"/tMember");
		
		log.info("(log) return : mav >>>" +mav);
		return mav;
	}
	
	//�����ڱ۾�����
	@RequestMapping(value="/insertFormTMember", method=RequestMethod.GET)
	public String tMemInsertForm(){
		log.info("tMemInsertForm ȣ�� ����");
		return "tMember/tMemInsertForm";
	}
	
	//�����ڱ��������Է�
	@RequestMapping(value="/tMemberInsert", method=RequestMethod.POST)
	public String tMemberInsert(@ModelAttribute TMemberVO tvo){
		log.info("boardInsert ȣ�� ����");
		log.info("tvo >> : " +tvo);
//		TMemberVO tmvo0 = (TMemberVO)tvo.gettMemberList().get(0);
//		log.info("tvo.gettMemberList().get(0).getTtName >>> : " + tmvo0.getTtName());	
//		TMemberVO tmvo1 = (TMemberVO)tvo.gettMemberList().get(1);
//		log.info("tvo.gettMemberList().get(1).getTtName >>> : " + tmvo1.getTtName());
		
		int result=0;
		String url="";
		for(int i=0; i<tvo.gettMemberList().size(); i++){
			TMemberVO tmvo = (TMemberVO)tvo.gettMemberList().get(i);
			log.info("["+i+"] ttName >>> : " +tmvo.getTtName());
			log.info("["+i+"] ttBirth >>> : " +tmvo.getTtTransferyear());
			log.info("["+i+"] ttGender >>> : " +tmvo.getTtGender());
			
			/***********chaebun logic*********/
			//transferyear/genderȮ��
			String tgcode = ChaebunClass.TchaeunNo1(tmvo);
			log.info("year/gender code>>>: " +tgcode);
			
			//chaebun service�� max��Ȯ��
			TMemberVO pvo = tmemberService.selectChaebun(tgcode);
			String chNo = pvo.getTtNo();
			log.info("(log)Controller_chNo >> : " +chNo);
			
			//���ڿ����̱�
			tmvo.setTtNo(chNo);
			tgcode = ChaebunClass.TchaeunNo2(tmvo);
			tmvo.setTtNo(tgcode);
			
			
//			String b_file =FileUploadUtil.fileUpload(bvo.getFile(), request);
//			tmvo.setB_file(b_file);
			result = tmemberService.tMemberInsert(tmvo);
		}
		
		if(result == 1){
			url = "/tMember/listTMember.ssm";
		}
		return "redirect:" + url;
	}//tMeminsert
	
	//���� üũ ��
	@RequestMapping(value="/checkFormTMember")
	public String checkFormTMember(){
		log.info("/checkFormTMember ȣ�� ����");
		return "tMember/checkForm";
	}
		
	//���� �������� ��ȸ
	@RequestMapping(value="/joinTMemCheck", method=RequestMethod.POST)
	public String joinTMemCheck(@ModelAttribute TMemberVO tmvo, Model model){
		System.out.println("/joinTMemCheck ȣ�� ����");
		String url = "";
//		System.out.println("tmvo.getTtName()"+tmvo.getTtName());
//		System.out.println("tmvo.getTtBirth()"+tmvo.getTtBirth());
//		System.out.println("tmvo.getTtGender()"+tmvo.getTtGender());
//		System.out.println("tmvo.getSjtCode()"+tmvo.getSjtCode());
//		System.out.println("tmvo.getTtPn()"+tmvo.getTtPn());
		
		TMemberVO tvo = tmemberService.joinTMemberCheck(tmvo);//joinCheck���� db���� ��ġȮ��
//		System.out.println("controller tvo>>>" +tvo);
//		System.out.println("tvo.getSjtCode"+tvo.getSjtCode());
//		System.out.println("tvo.getTtId()"+tvo.getTtId());
		
		
		if(tvo != null){//��ġ ���� ����
			String ttId = tvo.getTtId();
			log.info("ttId >> : " + ttId);
			if(ttId == null){ //��ġ�ϴ� ���� ������ ������ ���� ����
				model.addAttribute("data", tvo);//joinCheck���� �Է��� �⺻�����͸� ������
				url="tMember/tMemJoinForm"; //ȸ������jsp�� �̵�
			}else{//��ġ�ϴ� �����ְ� �̹� ������ ����
				url="tMemberLogin";//�α����������� �̵�
			}
			
		}else{//��ġ�ϴ� ������ ����
			log.info("failed");
			model.addAttribute("mode","failed");//alert�� �޼����� ������
			//url="forward:checkFormTMember.ssm";
			url="tMember/checkForm";//joinCheck������ ��ȯ
		}
			
		return url;
	}	
	//���� ���� ��
	@RequestMapping(value="/joinFormTMember", method=RequestMethod.GET)
	public String joinFormTMember(){
		log.info("/joinFormTMember ȣ�� ����");
		return "tMember/tMemJoinForm";
	}
	
	//���簡��
		@RequestMapping(value="/joinTMember", method=RequestMethod.POST)
		public ModelAndView joinTMember(@ModelAttribute TMemberVO tvo, HttpServletRequest request) {
			String uploadPath = FilePath.SSM_FILEPATH;
			int size = 10* 1024*1024;
			ModelAndView mav = new ModelAndView();
			try{
				MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "EUC-KR", new DefaultFileRenamePolicy());
				String ttName =multi.getParameter("ttName");
				String ttBirth =multi.getParameter("ttBirth");
				String ttGender =multi.getParameter("ttGender");
				String sjtCode =multi.getParameter("sjtCode");				
				String ttId =multi.getParameter("ttId");
				String ttPw =multi.getParameter("ttPw");
				String ttTransferyear =multi.getParameter("ttTransferyear");
				String ttPn =multi.getParameter("ttPn");
				String ttGrade =multi.getParameter("gradeId");
				String ttClass =multi.getParameter("classId");
				String ttEmail =multi.getParameter("ttEmail");
				Enumeration jfiles = multi.getFileNames();
				String ttImage =(String)jfiles.nextElement();			
				String imagefilename = multi.getFilesystemName(ttImage);

				log.info("(log) ttName >>> : " + ttName);
				log.info("(log) ttGender >>> : " + ttGender);
				log.info("(log) classId >>> : " + ttClass);
				TMemberVO ttvo = new TMemberVO();
				ttvo.setTtName(ttName);
				ttvo.setTtPn(ttPn);
				ttvo.setTtId(ttId);
				ttvo.setTtPw(ttPw);
				ttvo.setSjtCode(sjtCode);
				ttvo.setTtGrade(ttGrade);
				ttvo.setTtClass(ttClass);
				ttvo.setTtEmail(ttEmail);
				ttvo.setTtImage(imagefilename);
				
				String resultStr="";
				int result = tmemberService.joinTMember(ttvo);
				log.info("(log)tmemberService.joinTMember(param)>>>" +result );
				
				if(result >0) resultStr="��� �Ϸ�";
				else resultStr = "��Ͻ���";
				
				mav.addObject("result", resultStr);
				mav.setViewName("/result");
				
				log.info("(log) return : mav >>>" +mav);
				log.info("(log) Controller.insertMember END");
				
				
			}catch(Exception e){
				System.out.println("������ >>> : " + e );
			}
			return mav;	

		}//tMeminsert
	
	
}//controller