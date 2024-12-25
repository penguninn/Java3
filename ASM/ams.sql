CREATE DATABASE AssJava3 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE AssJava3;

-- Tạo bảng CATEGORIES
CREATE TABLE CATEGORIES (
    Id VARCHAR(50) PRIMARY KEY,
    Names NVARCHAR(250) NOT NULL
);

-- Tạo bảng USERS
CREATE TABLE USERS (
    Id VARCHAR(50) PRIMARY KEY,
    Passwords VARCHAR(250) NOT NULL,
    Fullname NVARCHAR(250) NOT NULL,
    Birthday DATE NOT NULL,
    Gender BIT NOT NULL,
    Mobile VARCHAR(20) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Roles BIT NOT NULL
);

-- Tạo bảng NEWS
CREATE TABLE NEWS (
    Id VARCHAR(50) PRIMARY KEY,
    Title NVARCHAR(250) NOT NULL,
    Content TEXT NOT NULL,
    Images VARCHAR(250) NOT NULL,
    PostedDate DATE NOT NULL,
    Author VARCHAR(50),
    ViewCount INT NOT NULL,
    CategoryId VARCHAR(50),
    Home BIT,
    FOREIGN KEY (CategoryId) REFERENCES CATEGORIES(Id),
    FOREIGN KEY (Author) REFERENCES USERS(Id)
);

-- Tạo bảng NEWSLETTERS
CREATE TABLE NEWSLETTERS (
    Email VARCHAR(250) PRIMARY KEY NOT NULL,
    Enableds BIT NOT NULL
);

-- Chèn dữ liệu vào bảng CATEGORIES
INSERT INTO CATEGORIES (Id, Names) VALUES
('CAT001', 'Tin tức'),
('CAT002', 'Công nghệ'),
('CAT003', 'Thể thao'),
('CAT004', 'Giải trí'),
('CAT005', 'Kinh doanh'),
('CAT006', 'Khoa học'),
('CAT007', 'Sức khỏe'),
('CAT008', 'Du lịch'),
('CAT009', 'Giáo dục'),
('CAT010', 'Ẩm thực');

-- Chèn dữ liệu vào bảng USERS
INSERT INTO USERS (Id, Passwords, Fullname, Birthday, Gender, Mobile, Email, Roles) VALUES
('USER001', 'pass123', 'Nguyễn Văn A', '1990-01-15', 1, '0901234567', 'nguyenvana@email.com', 1),
('USER002', 'pass234', 'Trần Thị B', '1992-05-20', 0, '0912345678', 'tranthib@email.com', 0),
('USER003', 'pass345', 'Lê Văn C', '1988-11-30', 1, '0923456789', 'levanc@email.com', 0),
('USER004', 'pass456', 'Phạm Thị D', '1995-03-25', 0, '0934567890', 'phamthid@email.com', 1),
('USER005', 'pass567', 'Hoàng Văn E', '1993-07-10', 1, '0945678901', 'hoangvane@email.com', 0),
('USER006', 'pass678', 'Ngô Thị F', '1991-09-05', 0, '0956789012', 'ngothif@email.com', 0),
('USER007', 'pass789', 'Đặng Văn G', '1994-12-20', 1, '0967890123', 'dangvang@email.com', 1),
('USER008', 'pass890', 'Vũ Thị H', '1989-02-28', 0, '0978901234', 'vuthih@email.com', 0),
('USER009', 'pass901', 'Bùi Văn I', '1996-06-15', 1, '0989012345', 'buivani@email.com', 0),
('USER010', 'pass012', 'Lý Thị K', '1997-04-01', 0, '0990123456', 'lythik@email.com', 1),
('USER011', 'pass1234', 'Nguyễn Văn L', '1992-01-10', 1, '0901234568', 'nguyenl@email.com', 1),
('USER012', 'pass2345', 'Trần Thị M', '1993-05-15', 0, '0912345679', 'tranm@email.com', 0),
('USER013', 'pass3456', 'Lê Văn N', '1987-11-20', 1, '0923456790', 'lenn@email.com', 0),
('USER014', 'pass4567', 'Phạm Thị O', '1995-02-25', 0, '0934567891', 'phamthio@email.com', 1),
('USER015', 'pass5678', 'Hoàng Văn P', '1994-07-30', 1, '0945678902', 'hoangp@email.com', 0),
('USER016', 'pass6789', 'Ngô Thị Q', '1991-09-14', 0, '0956789013', 'ngoqu@email.com', 0),
('USER017', 'pass7890', 'Đặng Văn R', '1996-12-05', 1, '0967890124', 'dangvr@email.com', 1),
('USER018', 'pass8901', 'Vũ Thị S', '1990-04-22', 0, '0978901235', 'vuthis@email.com', 0),
('USER019', 'pass9012', 'Bùi Văn T', '1997-03-18', 1, '0989012346', 'buivt@email.com', 0),
('USER020', 'pass0123', 'Lý Thị U', '1998-10-30', 0, '0990123457', 'lythu@email.com', 1);

-- Chèn dữ liệu vào bảng NEWS
INSERT INTO NEWS (Id, Title, Content, Images, PostedDate, Author, ViewCount, CategoryId, Home) VALUES
('NEWS001', 'Tin tức mới nhất về COVID-19', 
    'Cập nhật tình hình dịch bệnh COVID-19 mới nhất. Mọi người cần chú ý tới các biện pháp phòng tránh. Thời gian này có nhiều thông tin mới đáng chú ý. Giữ gìn sức khỏe là ưu tiên hàng đầu của chúng ta. Hãy thường xuyên theo dõi các bản tin từ chuyên gia.', 
    'covid19.jpg', '2023-09-01', 'USER001', 1000, 'CAT001', 1),
('NEWS002', 'iPhone 15 ra mắt', 
    'Apple giới thiệu dòng iPhone mới với nhiều tính năng vượt trội. Hệ điều hành iOS mới đi kèm và các ứng dụng được tối ưu hơn rất nhiều. Đặc biệt, chúng ta có thể trải nghiệm các màu sắc mới, và thiết kế mới cũng rất hấp dẫn. Chắc chắn sẽ làm hài lòng người dùng yêu công nghệ.', 
    'iphone15.jpg', '2023-09-02', 'USER002', 1500, 'CAT002', 1),
('NEWS003', 'Kết quả Euro 2024', 
    'Tổng hợp các trận đấu kịch tính của Euro 2024. Người hâm mộ đang chờ đợi những điều bất ngờ. Đội tuyển yêu thích sẽ thể hiện sức mạnh ra sao? Hãy cùng theo dõi để biết đội nào sẽ giành được ngôi vô địch. Kết quả sẽ được cập nhật liên tục.', 
    'euro2024.jpg', '2023-09-03', 'USER003', 2000, 'CAT003', 0),
('NEWS004', 'Phim bom tấn mùa hè', 
    'Danh sách các phim bom tấn mùa hè đang được mong đợi nhất. Hãy sẵn sàng cho những giây phút giải trí thú vị và đầy hấp dẫn. Những bộ phim này sẽ mang lại cảm xúc và trải nghiệm đáng nhớ. Đừng bỏ lỡ cơ hội để xem phim cùng bạn bè.', 
    'movies.jpg', '2023-09-04', 'USER004', 1200, 'CAT004', 1),
('NEWS005', 'Thị trường chứng khoán biến động', 
    'Phân tích xu hướng thị trường chứng khoán trong thời gian qua. Có nhiều biến động đáng chú ý và các nhà đầu tư cần thận trọng hơn trong giai đoạn này. Theo dõi các chỉ số chứng khoán để nắm bắt xu hướng. Hãy chuẩn bị cho các kế hoạch đầu tư thông minh.', 
    'stock.jpg', '2023-09-05', 'USER005', 800, 'CAT005', 0),
('NEWS006', 'Khám phá sao Hỏa', 
    'NASA công bố hình ảnh mới nhất về sao Hỏa. Những khám phá thú vị về hành tinh đỏ đang thu hút sự chú ý của các nhà khoa học. Hãy cùng tìm hiểu về các nghiên cứu mới và điều kỳ diệu mà vũ trụ mang lại. Sao Hỏa đang là tâm điểm.', 
    'mars.jpg', '2023-09-06', 'USER006', 1800, 'CAT006', 1),
('NEWS007', 'Bí quyết sống khỏe', 
    'Chế độ ăn uống và tập luyện rất quan trọng để giữ gìn sức khỏe. Các chuyên gia khuyên rằng cần có kế hoạch hợp lý cho việc luyện tập. Hãy cùng nhau tìm hiểu về các bí quyết sống khỏe và sống vui vẻ hơn mỗi gày. Sức khỏe là vàng.', 
    'health.jpg', '2023-09-07', 'USER007', 1300, 'CAT007', 0),
('NEWS008', '10 điểm đến hấp dẫn 2023', 
    'Gợi ý cho kỳ nghỉ của bạn với những điểm đến hấp dẫn nhất. Hãy chuẩn bị cho những trải nghiệm đáng nhớ và kỳ thú. Khám phá văn hóa và ẩm thực tại các địa điểm này sẽ rất thú vị. Đừng quên lên kế hoạch trước khi đi du lịch nhé.', 
    'travel.jpg', '2023-09-08', 'USER008', 1600, 'CAT008', 1),
('NEWS009', 'Xu hướng giáo dục trực tuyến', 
    'Thay đổi trong phương pháp học đang diễn ra mạnh mẽ. Học trực tuyến có nhiều lợi ích và tiện lợi hơn cho học viên. Cùng theo dõi các xu hướng mới nhất trong giáo dục thiết kế nội dung và phương pháp giảng dạy. Hãy cập nhật thường xuyên để không bị lạc hậu.', 
    'education.jpg', '2023-09-09', 'USER009', 900, 'CAT009', 0),
('NEWS010', 'Món ăn đặc sản các vùng miền', 
    'Khám phá ẩm thực Việt Nam với những món ăn đặc sản từ các vùng miền. Mỗi món ăn đều mang hương vị đặc trưng và câu chuyện riêng. Hãy cùng chúng tôi tìm hiểu thêm về cách chế biến và lịch sử của các món ăn này. Chắc chắn bạn sẽ thích. Đừng bỏ lỡ các món ngon!', 
    'food.jpg', '2023-09-10', 'USER010', 1100, 'CAT010', 1),
('NEWS011', 'Xu hướng thời trang 2024', 
    'Các xu hướng thời trang mới nhất cho năm 2024 đã xuất hiện. Đừng bỏ lỡ cơ hội để cập nhật cho tủ đồ của bạn với những món đồ mới.', 
    'fashion2024.jpg', '2023-09-11', 'USER011', 1500, 'CAT001', 1),
('NEWS012', 'Album mới của ca sĩ nổi tiếng', 
    'Ca sĩ X vừa phát hành album mới, hứa hẹn sẽ là một trong những sản phẩm âm nhạc hot nhất năm nay.', 
    'album.jpg', '2023-09-12', 'USER012', 1800, 'CAT002', 0),
('NEWS013', 'Cách sống xanh trong cuộc sống hàng ngày', 
    'Những mẹo đơn giản để bạn có thể sống xanh hơn trong cuộc sống hàng ngày.', 
    'greenliving.jpg', '2023-09-13', 'USER013', 1200, 'CAT003', 1),
('NEWS014', 'Khám phá những mẫu xe mới nhất', 
    'Những mẫu xe mới ra mắt trong năm 2024 sẽ mang đến cho bạn nhiều lựa chọn thú vị.', 
    'newcars.jpg', '2023-09-14', 'USER014', 2000, 'CAT004', 0),
('NEWS015', 'Cách quản lý tài chính cá nhân hiệu quả', 
    'Hướng dẫn quản lý tài chính cá nhân để có cuộc sống thoải mái hơn.', 
    'personalfinance.jpg', '2023-09-15', 'USER015', 800, 'CAT001', 1),
('NEWS016', 'Những bí quyết làm đẹp tự nhiên', 
    'Tìm hiểu về các phương pháp làm đẹp tự nhiên mà bạn có thể thực hiện tại nhà.', 
    'naturalbeauty.jpg', '2023-09-16', 'USER016', 1600, 'CAT001', 0),
('NEWS017', 'Chăm sóc thú cưng hiệu quả', 
    'Những điều cần biết để chăm sóc thú cưng của bạn một cách tốt nhất.', 
    'pets.jpg', '2023-09-17', 'USER017', 1400, 'CAT009', 1),
('NEWS018', 'Kỹ năng sống cần thiết cho giới trẻ', 
    'Các kỹ năng sống mà giới trẻ cần trang bị để thành công trong cuộc sống.', 
    'lifeskills.jpg', '2023-09-18', 'USER018', 1300, 'CAT003', 0),
('NEWS019', 'Câu chuyện lịch sử thú vị', 
    'Khám phá những câu chuyện lịch sử thú vị từ các nền văn minh cổ đại.', 
    'history.jpg', '2023-09-19', 'USER019', 900, 'CAT007', 1),
('NEWS020', 'Thực phẩm tốt cho sức khỏe', 
    'Những thực phẩm nên có trong chế độ ăn uống hàng ngày để bảo vệ sức khỏe.', 
    'healthyfood.jpg', '2023-09-20', 'USER020', 1100, 'CAT008', 0);

-- Chèn dữ liệu vào bảng NEWSLETTERS
INSERT INTO NEWSLETTERS (Email, Enableds) VALUES
('subscriber1@email.com', 1),
('subscriber2@email.com', 1),
('subscriber3@email.com', 0),
('subscriber4@email.com', 1),
('subscriber5@email.com', 1),
('subscriber6@email.com', 0),
('subscriber7@email.com', 1),
('subscriber8@email.com', 1),
('subscriber9@email.com', 0),
('subscriber10@email.com', 1);

select * from CATEGORIES;
select * from NEWS;
select * from NEWSLETTERS;
select * from USERS;
SELECT * FROM News ORDER BY ViewCount DESC LIMIT 5;
