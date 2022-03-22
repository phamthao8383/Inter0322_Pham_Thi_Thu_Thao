use resort_management;
-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được
--  thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
--  và đã từng lập hợp đồng cho một hoặc nhiều khách
--  hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
  create view v_nhan_vien as
  select *from nhan_vien join hop_dong on nhan_vien.staffID=hop_dong.staffID 
  where nhan_vien.address like '%Hải Châu%'
  and hop_dong.start_day='2019-12-12';

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- ối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này
update v_nhan_vien
set address='Liên Chiểu';
-- 23Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với
-- ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
DELIMITER $$
create procedure sp_xoa_khach_hang(in customerId int)
begin
delete  from khach_hang where customerID= customerId;
end; $$
DELIMITER 
-- thực thi
call sp_xoa_khach_hang(1);
-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi 
-- trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra
--  giao diện console của database.


