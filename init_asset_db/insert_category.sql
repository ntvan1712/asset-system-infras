INSERT INTO asset_types (code, name, description)
VALUES
    ('pc', 'Máy tính bàn', 'Thiết bị điện tử cho công việc văn phòng, hỗ trợ nhân viên trong công việc hằng ngày.'),
    ('laptop', 'Laptop', 'Thiết bị di động cho công việc văn phòng, có thể mang đi nhiều nơi, thuận tiện cho di chuyển.'),
    ('printer', 'Máy in', 'Thiết bị để in tài liệu, báo cáo và các giấy tờ cần thiết.'),
    ('office_desk', 'Bàn ghế văn phòng', 'Bàn ghế văn phòng cung cấp không gian làm việc thoải mái cho nhân viên.'),
    ('keyboard', 'Bàn phím', 'Thiết bị ngoại vi dùng để nhập liệu cho máy tính.'),
    ('mouse', 'Chuột máy tính', 'Thiết bị ngoại vi dùng để điều khiển máy tính.'),
    ('monitor', 'Màn hình', 'Thiết bị hiển thị cho máy tính.'),
    ('speaker', 'Loa', 'Thiết bị phát âm thanh cho máy tính.'),
    ('headset', 'Tai nghe', 'Thiết bị âm thanh hỗ trợ cho việc nghe và liên lạc qua máy tính.'),
    ('network_device', 'Thiết bị mạng', 'Các thiết bị hỗ trợ kết nối mạng, bao gồm router, switch, và modem.'),
    ('storage_drive', 'Ổ đĩa', 'Thiết bị lưu trữ dữ liệu cho máy tính, bao gồm ổ cứng, ổ SSD.'),
    ('usb', 'USB', 'Thiết bị lưu trữ nhỏ gọn, có khả năng lưu trữ và truyền dữ liệu dễ dàng.'),
    ('cloud_storage', 'Thiết bị lưu trữ đám mây', 'Thiết bị và dịch vụ lưu trữ dữ liệu trực tuyến thông qua nền tảng đám mây.');


INSERT INTO asset_qualities (code, name, description)
VALUES
('new', 'Mới', 'Tài sản hoàn toàn mới, chưa qua sử dụng.'),
('good', 'Tốt', 'Tài sản ở trạng thái tốt, hoạt động hiệu quả và không có hỏng hóc.'),
('fair', 'Trung bình', 'Tài sản có dấu hiệu hao mòn nhưng vẫn hoạt động. Cần theo dõi hoặc bảo dưỡng nhẹ.'),
('poor', 'Kém', 'Tài sản xuống cấp, hoạt động không ổn định hoặc kém hiệu quả. Cần sửa chữa.'),
('broken', 'Hỏng', 'Tài sản không còn sử dụng được, cần sửa chữa hoặc thay thế.');

INSERT INTO currencies (code, name, symbol) VALUES
('usd', 'US Dollar', '$'),
('eur', 'Euro', '€'),
('gbp', 'British Pound', '£'),
('vnd', 'Vietnamese Dong', '₫'),
('jpy', 'Japanese Yen', '¥'),
('aud', 'Australian Dollar', '$'),
('cad', 'Canadian Dollar', '$'),
('cny', 'Chinese Yuan', '¥'),
('krw', 'South Korean Won', '₩'),
('inr', 'Indian Rupee', '₹');

INSERT INTO locations (name, description)
VALUES
-- Phòng
('Phòng 101', 'Phòng làm việc của bộ phận Kỹ thuật'),
('Phòng 102', 'Phòng làm việc của bộ phận Nhân sự'),
('Phòng 103', 'Phòng họp nội bộ'),
('Phòng 104', 'Phòng làm việc của Giám đốc'),
('Phòng 201', 'Phòng họp lớn tầng 2'),
('Phòng 202', 'Phòng làm việc của bộ phận Marketing'),
('Phòng 203', 'Phòng thiết kế'),
('Phòng 204', 'Phòng IT'),
-- WC
('WC Tầng 1', 'Nhà vệ sinh tầng 1, khu nam'),
('WC Tầng 1', 'Nhà vệ sinh tầng 1, khu nữ'),
('WC Tầng 2', 'Nhà vệ sinh tầng 2, khu nam'),
('WC Tầng 2', 'Nhà vệ sinh tầng 2, khu nữ'),
-- Hành lang
('Hành lang Tầng 1', 'Hành lang dẫn tới các phòng tại tầng 1'),
('Hành lang Tầng 2', 'Hành lang dẫn tới các phòng tại tầng 2'),
('Hành lang Tầng 3', 'Hành lang chính tầng 3'),
-- Cầu thang
('Cầu thang 1', 'Cầu thang bộ từ tầng 1 lên tầng 2'),
('Cầu thang 2', 'Cầu thang bộ từ tầng 2 lên tầng 3'),
('Cầu thang 3', 'Cầu thang bộ thoát hiểm tầng 1'),
-- Sảnh
('Sảnh chính', 'Khu vực sảnh chính của tòa nhà'),
('Sảnh phụ', 'Khu vực sảnh phụ của tòa nhà'),
-- Khu vực chung
('Phòng họp 1', 'Phòng họp nội bộ tầng 1'),
('Phòng họp 2', 'Phòng họp nội bộ tầng 2'),
('Pantry Tầng 1', 'Khu vực pantry phục vụ ăn uống tầng 1'),
('Pantry Tầng 2', 'Khu vực pantry phục vụ ăn uống tầng 2'),
-- Phòng lưu trữ
('Phòng lưu trữ Tầng 1', 'Phòng lưu trữ hồ sơ và tài liệu tầng 1'),
('Phòng lưu trữ Tầng 2', 'Phòng lưu trữ hồ sơ và tài liệu tầng 2'),
-- Phòng thiết bị
('Phòng thiết bị Tầng 1', 'Phòng chứa các thiết bị IT tầng 1'),
('Phòng thiết bị Tầng 2', 'Phòng chứa các thiết bị IT tầng 2'),
-- Phòng bảo vệ
('Phòng bảo vệ Tầng 1', 'Phòng bảo vệ ở tầng 1'),
-- Phòng tạp vụ
('Phòng tạp vụ', 'Phòng chứa dụng cụ vệ sinh của nhân viên tạp vụ tầng 1');
