package ssm.br.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.br.service.Non_VideoService;
import ssm.br.vo.Non_VideoVO;

@Controller
@RequestMapping("/Non_Video")
public class Non_VideoController {
	Logger logger = Logger.getLogger(Non_VideoController.class);
	@Autowired
	private Non_VideoService non_VideoService;
	
	@RequestMapping("/goInsertForm")
	public String goInsertForm(){
		return "br/nv_InsertForm";
	}
	
	@RequestMapping("/VideoMain")
	public String VideoMain(@ModelAttribute Non_VideoVO nvvo,Model model){
		List list = non_VideoService.listVideo();
		logger.info("toString����>>>"+nvvo.toString());
		if(list.size()>0) {
			logger.info("��Ʈ��������>>>"+list.get(0));
			model.addAttribute("list",list);
		}
		else logger.info("����Ʈ����");
		return "br/nv_Main";
	}
	
	@RequestMapping("/insertVideo")
	public String insertVideo(HttpServletRequest request,@ModelAttribute Non_VideoVO nvvo,Model model){
		logger.info("�μ�Ʈ��������");
		String nvNo="";
		int result = 0;
		String resultStr="";
		
		try{
			MultipartRequest mr = new MultipartRequest(request,
													   "C:/ProjectSSM/java142_Luna_SungIll/ProjectSSM/Project_SSM/WebContent/video",
													   100000*100000,
													   "utf-8",
													   new DefaultFileRenamePolicy());
			nvNo=non_VideoService.chaebun();
			if(nvNo.length()==1) nvNo="NA000"+nvNo;
			if(nvNo.length()==2) nvNo="NA00"+nvNo;
			if(nvNo.length()==3) nvNo="NA0"+nvNo;
			if(nvNo.length()==4) nvNo="NA"+nvNo;
			nvvo.setNvNo(nvNo);
			nvvo.setNvTitle(mr.getParameter("nvTitle"));
			nvvo.setNvVideo(mr.getFilesystemName("nvVideo"));
			logger.info("nvvo���ѽ�Ʈ��"+nvvo.toString());
			//nvvo.setTtNo(mr.getParameter("ttNo")); ������Ǯ��
			nvvo.setTtNo("T8100001");
			result = non_VideoService.insertVideo(nvvo);
			if(result>0) {
				resultStr="������ �Խü���";
				
				}
			else {resultStr="������ �Խý���";}
			model.addAttribute("resultStr",resultStr);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "br/result";
	}
	
	//������Ʈ�������Լ�
	@RequestMapping("/goUpdateVideo")
	public String goupdateVideo(@ModelAttribute Non_VideoVO nvvo,Model model){
		List list=null;
		list = non_VideoService.goUpdateVideo(nvvo);
		model.addAttribute("list",list);
		return "br/nv_UpdateForm"; 
	}
	
	
	@RequestMapping("/updateVideo")
	public String updateVideo(HttpServletRequest request,@ModelAttribute Non_VideoVO nvvo,Model model){
		int result =0;
		String resultStr="";
		try{
			MultipartRequest mr = new MultipartRequest(request,
									   "C:/ProjectSSM/java142_Luna_SungIll/ProjectSSM/Project_SSM/WebContent/video",
									   100000*100000,
									   "utf-8",
									   new DefaultFileRenamePolicy());
			
			nvvo.setNvTitle(mr.getParameter("nvTitle"));
			nvvo.setNvNo(mr.getParameter("nvNo"));
			if(mr.getFilesystemName("nvVideo")!=null){
				nvvo.setNvVideo(mr.getFilesystemName("nvVideo"));
			}
			logger.info("nvvo���ѽ�Ʈ��"+nvvo.toString());
			result = non_VideoService.updatetVideo(nvvo);
			if(result>0) {
				resultStr="������ ��������";
				}
			else {resultStr="������ ��������";}
			model.addAttribute("resultStr",resultStr);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "br/result";
	}
	
	@RequestMapping("/deleteVideo")
	public String deleteVideo(@ModelAttribute Non_VideoVO nvvo,Model model){
		int result =0;
		String resultStr="";
		result = non_VideoService.deleteVideo(nvvo);
		if(result>0) {
			resultStr="������ ��������";
			}
		else {resultStr="������ ��������";}
		model.addAttribute("resultStr",resultStr);
		return "br/result"; 
	}
}
