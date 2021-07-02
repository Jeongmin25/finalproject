package job.data.profile;

public interface JobGroupMapper {
	public void insertJobOfJobGroup(JobGroupDto dto);
	public int searchIdOfJobGroup(int id);
	public void updateJobOfJobGroup(JobGroupDto dto);
	public JobGroupDto getDataOfJobGroup(int id);
}
