//package job.data.login;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//@Repository
//public class UserAccountDao {
//
//	@Autowired
//	UserAccountInter dao;
//	
//	public void insertUserAccount(UserAccountDto dto) {
//	
//		dao.save(dto); //id유무에 따라 자동으로 insert 또는 update
//	}
//	
//	public UserAccountDto getData(long id)
//	{
//		UserAccountDto dto=dao.getById(id);  //겟바이 아이디는 파라미터 받는게 롱 타입으로 받게 되어있음
//		return dto;
//	}
//	
//	//DB에 데이타 수정
//		public void updateUserAccount(UserAccountDto dto) {
//			dao.save(dto);// num 이 dto 에 포함이므로 수정
//	}
//		
//	//삭제
//	public void deleteCar(long id) {
//		dao.deleteById(id);
//	}
//
//	
//	
//	
//}
