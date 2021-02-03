package ssm.cd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import ssm.cd.service.Value_SettingService;
import ssm.cd.vo.Value_SettingVO;
import ssm.common.utils.UserSession;


@Controller
@RequestMapping("/value_Setting")
public class Value_SettingController {
	Logger logger=Logger.getLogger(Value_SettingController.class); 
	
	@Autowired
	private Value_SettingService value_SettingService;
	
	@RequestMapping("go_VS_Main")
	public String go_VS_Main (Value_SettingVO vsvo,HttpServletRequest request,Model model){
		logger.info("���������Լ�����");
		String ssNo = "";
		try{
			ssNo = UserSession.getSessionNO(request);
	
		logger.info("ss�̾ƿ�");
		logger.info("ssNo");
		vsvo.setSsNo(ssNo);
		logger.info("vo������>>>"+vsvo.toString());
		List list = value_SettingService.loadValueSetting(vsvo);
		logger.info("vo�޾ƿ°�>>>"+list.get(0).toString());
		if(list!=null){
			model.addAttribute("list",list);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/cd/value_Setting_Main";
	}
	
	@RequestMapping("saveValueSetting")
	public String saveValueSetting(@ModelAttribute Value_SettingVO vsvo,HttpServletRequest request,Model model){
		String resultStr="";
		String isud = request.getParameter("ISUD");
		logger.info(vsvo.toString());
		
		if(isud.equals("I")){
			//�μ�Ʈ
			try{
				vsvo.setSsNo(UserSession.getSessionNO(request));
				
				String chaebun = value_SettingService.makeChaebun_VS()+"";
				if (chaebun.length()==1) chaebun ="000"+chaebun;
				if (chaebun.length()==2) chaebun ="00"+chaebun;
				if (chaebun.length()==3) chaebun ="0"+chaebun;
				chaebun = "VS"+chaebun;
				vsvo.setVsNo(chaebun);
				int result = value_SettingService.saveValueSetting(vsvo);
				if (result>0){
					resultStr="������Ǿ����ϴ�";
					logger.info(resultStr);
				}else{
					resultStr="���忡 ��������";
					logger.info(resultStr);
				}
				
				
			}catch(Exception e){
				e.printStackTrace();
			}
			List list = value_SettingService.loadValueSetting(vsvo);
			logger.info("vo�޾ƿ°�>>>"+list.get(0).toString());
			if(list!=null){
				model.addAttribute("list",list);
			}
			model.addAttribute("resultStr",resultStr);
			return "/cd/value_Setting_Main";
		}else{
			//������Ʈ
			try{
				vsvo.setSsNo(UserSession.getSessionNO(request));
				int result = value_SettingService.updateValueSetting(vsvo);
				if (result>0){
					resultStr="�ߺ���Ǿ����ϴ�";
					logger.info(resultStr);
				}else{
					resultStr="���濡 ��������";
					logger.info(resultStr);
				}
				List list = value_SettingService.loadValueSetting(vsvo);
				logger.info("vo�޾ƿ°�>>>"+list.get(0).toString());
				if(list!=null){
					model.addAttribute("list",list);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			model.addAttribute("resultStr",resultStr);
			return "/cd/value_Setting_Main";
		}
		//����ó���ϸ� �����
		
	}

}
