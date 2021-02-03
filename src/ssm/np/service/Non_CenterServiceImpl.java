package ssm.np.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.mi.controller.SMemberController;
import ssm.np.dao.Non_CenterDAO;
import ssm.np.vo.Non_CenterVO;

@Service("Non_CenterService")
@Transactional
public class Non_CenterServiceImpl implements Non_CenterService {

	Logger log = Logger.getLogger(Non_CenterServiceImpl.class);
	
	@Autowired
	private Non_CenterDAO non_CenterDAO;
	
	@Override
	public List<Non_CenterVO> nCenterList(Non_CenterVO ncvo) {
		log.info("service >>>");
		List<Non_CenterVO> list = new ArrayList<Non_CenterVO>();
		list = non_CenterDAO.nCenterList(ncvo);
		log.info("service <<<");
		return list;
	}

}
