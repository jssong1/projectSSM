package ssm.ef.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.br.vo.NonprogramVO;
import ssm.cd.vo.CareerdesignVO;
import ssm.cd.vo.ValuesettingVO;
import ssm.cg.vo.OnlineApplication_BoardVO;
import ssm.cm.vo.FamilyLetterVO;
import ssm.cm.vo.NoticeBoardVO;
import ssm.ef.service.EportfolioService;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

@Controller
@RequestMapping(value="/eportfolio")
public class EportfolioController {

	@Autowired
	private EportfolioService eportfolioservice;
	
	@RequestMapping(value="/teacher")
	public String teacherlist(@ModelAttribute TMemberVO tvo, Model model, HttpSession session){
		
		//技记利侩 
		String userNO = (String)session.getAttribute("USERNO");
		tvo.setTtNo(userNO);
		
		List<SMemberVO> eflist=eportfolioservice.eflist(tvo); 
		model.addAttribute("eflist", eflist);
		return "ef/teacher";
	}
	
	 
	@RequestMapping(value="/student")
	public String student(@ModelAttribute SMemberVO svo, Model model,HttpSession session){
		
		
		
		//技记利侩 
		String userNO = (String)session.getAttribute("USERNO");
		String userAU = (String)session.getAttribute("USERAUTHORIRY");
		
		if(userAU.equals("1")){
			svo.setSsNo(userNO);
		}
		
		SMemberVO svo_ =eportfolioservice.mylist(svo);
		int listSize = 4; 
		svo.setListSize(listSize+"");
		if(svo.getBrpageNo()==null ){
			svo.setBrpageNo("1");
		}
		if(svo.getCgpageNo()==null){
			svo.setCgpageNo("1");
		}
		if(svo.getCdyearNo()==null && svo.getBryearNo()==null && svo.getCdyearNo()==null){
			String year = "20";
			svo.setCdyearNo(year);
			svo.setBryearNo(year);
			svo.setCgyearNo(year);
		}
		List<CareerdesignVO> cdlist=eportfolioservice.cdlist(svo);
		List<NonprogramVO> brlist=eportfolioservice.brlist(svo);
		List<OnlineApplication_BoardVO> cglist=eportfolioservice.cglist(svo); 
		ValuesettingVO vslist=eportfolioservice.vslist(svo); 
		
		model.addAttribute("mylist",svo_);
		model.addAttribute("cdlist",cdlist);
		model.addAttribute("brlist",brlist);
		model.addAttribute("cglist",cglist);
		model.addAttribute("vslist",vslist);
		model.addAttribute("listSize",listSize);
		model.addAttribute("pageNo",svo);
		return "ef/student";
	}
	
}
