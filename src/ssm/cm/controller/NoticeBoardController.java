package ssm.cm.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.GenericServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.cm.chaebun.NoticeBoardChaebun;
import ssm.cm.service.NoticeBoardService;
import ssm.cm.vo.NoticeBoardVO;

import java.io.*;
@Controller
@RequestMapping(value="/noticeboard")
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService noticeboardservice;
	
	//����ȸ
	@RequestMapping(value="nblist")
	public String nblist(@ModelAttribute NoticeBoardVO nvo, Model model){
		
		int ListSize = 10; 
		
		//����¡ �ʱ⼳��
		if(nvo.getListSize()==null){
			nvo.setListSize(ListSize+"");
			nvo.setPageNo("1");
		}
		
		
		List nblist=noticeboardservice.nblist(nvo); 
		
		model.addAttribute("nblist",nblist);
		model.addAttribute("listSize",ListSize);
		model.addAttribute("Searchdata",nvo);
		
		return "cm/nb/nblist";
	}
	
	//���ۼ������� �̵�
	@RequestMapping(value="nbwirteform")
	public String nbwirteform(){
		
		return "cm/nb/nbwirteform";
	}
	
	//���ۼ�
	@RequestMapping(value="nbwirte")
	public String nbinsert(@ModelAttribute NoticeBoardVO nvo, HttpServletRequest req){
		
		String url="";
		String uploadPath=req.getSession().getServletContext().getRealPath("/file");
		String daFileName="";
		int result=0;
		boolean bval= false;
		int size=10*1024*1024;
		try{
			MultipartRequest multi = new MultipartRequest(req,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
			
			Enumeration files=multi.getFileNames();
			String file=(String)files.nextElement();
			String fileName=multi.getFilesystemName(file);
			daFileName="../"+"upload"+"/"+fileName;
			
			String ttNo=multi.getParameter("ttNo");
			String nbTitle=multi.getParameter("nbTitle");
			String nbContents=multi.getParameter("nbContents");
			
			nvo.setTtNo(ttNo);
			nvo.setNbTitle(nbTitle);
			nvo.setNbContents(nbContents);
			nvo.setNbFile(daFileName);
			
			//ä����
			NoticeBoardVO nvo_ =noticeboardservice.nbChaebun(nvo); 
			String no =nvo_.getNbNo();
			nvo.setNbNo(NoticeBoardChaebun.nbchaebun(no));
			
			//������
			result=noticeboardservice.nbInsert(nvo);
		}catch(Exception e){
			System.out.println("������ >>>: " + e);	
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/noticeboard/nblist.ssm";
		System.out.println("url >>>: " + url);		
		return "redirect:"+url;
	}
	
	//�ۻ������� �̵�
	@RequestMapping(value="/nbDetail")
	public String nbDetail(@ModelAttribute NoticeBoardVO nvo, Model model){
		
		System.out.println("�Ѿ�°���>>>: " + nvo.getNbNo());
		NoticeBoardVO nbdetail = null;
		nbdetail = noticeboardservice.nbDetail(nvo);
		
		nbdetail.setNbContents(nbdetail.getNbContents().toString().replaceAll("\n","<br>"));

		//��ȸ�� �������� +1 �ϴ°�
		noticeboardservice.nbViews(nvo);
		
		model.addAttribute("nbdetail",nbdetail);
		return "cm/nb/nbDetail";
	}
	
	//�ۻ������� �̵�2
		@RequestMapping(value="/nbDetail2")
		public String nbDetail2(@ModelAttribute NoticeBoardVO nvo, Model model){
			
			System.out.println("�Ѿ�°���>>>: " + nvo.getNbNo());
			nvo.setNbNo("NB00" + nvo.getNbNo());;
			NoticeBoardVO nbdetail = null;
			nbdetail = noticeboardservice.nbDetail(nvo);
			
			nbdetail.setNbContents(nbdetail.getNbContents().toString().replaceAll("\n","<br>"));

			//��ȸ�� �������� +1 �ϴ°�
			noticeboardservice.nbViews(nvo);
			
			model.addAttribute("nbdetail",nbdetail);
			return "cm/nb/nbDetail";
		}
	
	//�� �����̳� ������ ���ۼ����� ��й�ȣ�˻� ajax
	@ResponseBody
	@RequestMapping(value="/pwdConfirm")
	public String pwdConfirm(@ModelAttribute NoticeBoardVO nvo,HttpServletRequest request){
		String ttPw =request.getParameter("ttPw");
	
		int result = 0;
		result= noticeboardservice.pwdConfirm(nvo,ttPw);
		
		return result+"";
		
	}
	
	//�ۼ��������� �̵�
	@RequestMapping(value="/nbupdateForm")
	public String updateForm(@ModelAttribute NoticeBoardVO nvo, Model model){
		
		NoticeBoardVO updateData =null;
		updateData= noticeboardservice.nbDetail(nvo);
		
		model.addAttribute("updateData",updateData);
		return "cm/nb/nbupdateform";
		
	}
	
	//�ۼ���
	@RequestMapping(value="nbupdate")
	public String nbupdate(@ModelAttribute NoticeBoardVO nvo, HttpServletRequest req){
		
		String url="";
		String uploadPath=req.getSession().getServletContext().getRealPath("/file");
		String daFileName="";
		int result=0;
		boolean bval= false;
		int size=10*1024*1024;
		try{
			MultipartRequest multi = new MultipartRequest(req,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
			
			Enumeration files=multi.getFileNames();
			String file=(String)files.nextElement();
			String fileName=multi.getFilesystemName(file);
			daFileName="../"+"upload"+"/"+fileName;
			
			String nbTitle=multi.getParameter("nbTitle");
			String nbContents=multi.getParameter("nbContents");
			String nbNo=multi.getParameter("nbNo");
			
			nvo.setNbTitle(nbTitle);
			nvo.setNbContents(nbContents);
			nvo.setNbFile(daFileName);
			nvo.setNbNo(nbNo);
			
			result=noticeboardservice.nbUpdate(nvo);
		}catch(Exception e){
			System.out.println("������>>>:" + e);
		}
		boolean bResult = result > 0;
			
		if(bResult) url="/noticeboard/nblist.ssm";
		return "redirect:"+url;
	}
	
	//�ۻ���
	@RequestMapping(value="/nbDelete")
	public String nbDelete(@ModelAttribute NoticeBoardVO nvo){
		String url="";
		int result = 0;
		
		result= noticeboardservice.nbDelete(nvo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/noticeboard/nblist.ssm";
		return "redirect:"+url;
		
		
	}
	
	//�ٿ�ε�
	@RequestMapping(value="/nbDownload")
	public String nbDownload(@ModelAttribute NoticeBoardVO nvo,HttpServletRequest request,Model model){
		String file =(String) request.getParameter("file");
		System.out.println("file>>>:"+ file);
		
		model.addAttribute("file",file);
		return "common/download";
		
	}
}
