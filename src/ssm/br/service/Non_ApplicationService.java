package ssm.br.service;

import java.util.List;

import ssm.br.vo.Non_ApplicationVO;

public interface Non_ApplicationService {
	public List non_ApplicationList(Non_ApplicationVO navo);

	public List non_ApplicationDeatil(Non_ApplicationVO navo);

	public int non_ApplicationInsert(Non_ApplicationVO navo);

	public String chaeBun();
	
	public int non_ApplicationDelete(Non_ApplicationVO navo);

	public int non_ApplicationUpdate(Non_ApplicationVO navo);

	public List teacherApplicationList(Non_ApplicationVO nvvo);

	public int approval(Non_ApplicationVO nvvo);

	public int approvalCancel(Non_ApplicationVO nvvo);
}
