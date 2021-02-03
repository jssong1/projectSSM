package ssm.br.dao;

import java.util.List;

import ssm.br.vo.Non_VideoVO;

public interface Non_VideoDao {

	public List listVideo();

	public int insertVideo(Non_VideoVO nvvo);

	public String chaebun();

	public int updateVideo(Non_VideoVO nvvo);

	public List goUpdateVideo(Non_VideoVO nvvo);

	public int deleteVideo(Non_VideoVO nvvo);

}
