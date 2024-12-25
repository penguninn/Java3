package poly.dao;

import java.util.List;

import poly.entity.Emlpoyee;

public interface EmpolyeeDAO {
	/**Truy vấn tất cả*/
	List<Emlpoyee> findAll();
	/**Truy vấn theo mã*/
	Emlpoyee findById(String id);
	/**Thêm mới*/
	void create(Emlpoyee item);
	/**Cập nhật*/
	void update(Emlpoyee item);
	/**Xóa theo mã*/
	void deleteById(String id);

}
