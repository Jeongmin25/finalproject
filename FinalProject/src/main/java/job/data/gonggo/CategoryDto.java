package job.data.gonggo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("category")
public class CategoryDto {
	private int idx;
	private String ctg;
	private String ctg_idx;
	private String tag;
	private String tag_idx;
	private int num;
}
