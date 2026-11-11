# BÀI LÀM – HACKATHON 02

- **Mã đề:** 09
- **Họ tên:Hoàng Khánh Nhi**
- **Lớp:CNTT02**
- **Link repository:**
- **Hệ điều hành (Windows/macOS):Windows**

## 4.2. Thao tác máy tính cơ bản bằng CLI

### Các lệnh đã chạy

```shell
B1 : pwd
B2 : ls -force 
B3 : mv .\noi_quy_thanh_vien.txt .\docs\
B4 : mkdir backup
B5 : cp .\data\thue_cho_thang_9.xlsx .\backup\
B6 : rm .\temp_909.tmp
B7 : cd logs
    ls -force 
    cd..
B8 : Get-childitem -recurse -force 
```

### Kết quả liệt kê toàn bộ dự án (Windows: Get-ChildItem -Recurse -Force; macOS: ls -aR)

```text
 Directory: C:\Users\admin\Downloads\starter-kit (5)\starter-kit\coworking-website


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        11/11/2026   1:36 PM                backup
d-----        11/11/2026   1:34 PM                data
d-----        11/11/2026   1:37 PM                docs
d-----        11/11/2026   1:33 PM                evidence
d-----        11/11/2026   1:37 PM                logs
d-----         11/3/2026   7:08 AM                web
-a----         11/3/2026   7:08 AM             72 .env
-a----         11/3/2026   7:08 AM           2409 bai_lam.md


    Directory: C:\Users\admin\Downloads\starter-kit (5)\starter-kit\coworking-website\backup


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/3/2026   7:08 AM           6162 thue_cho_thang_9.xlsx


    Directory: C:\Users\admin\Downloads\starter-kit (5)\starter-kit\coworking-website\data


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/3/2026   7:08 AM           6162 thue_cho_thang_9.xlsx


    Directory: C:\Users\admin\Downloads\starter-kit (5)\starter-kit\coworking-website\docs


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/3/2026   7:08 AM            146 noi_quy_thanh_vien.txt


    Directory: C:\Users\admin\Downloads\starter-kit (5)\starter-kit\coworking-website\logs


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/3/2026   7:08 AM            991 member.log


    Directory: C:\Users\admin\Downloads\starter-kit (5)\starter-kit\coworking-website\web


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----         11/3/2026   7:08 AM                images
-a----         11/3/2026   7:08 AM            605 app.js
-a----         11/3/2026   7:08 AM            543 index.html
-a----         11/3/2026   7:08 AM            460 style.css


    Directory: C:\Users\admin\Downloads\starter-kit (5)\starter-kit\coworking-website\web\images


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         11/3/2026   7:08 AM           3069 logo-coworkhub.png

```

## 4.3. Lọc log truy cập website

### a) Lệnh lọc các dòng status=500

```shell
Get-content logs/member.log | select-string "status=500" >> logs/loi_500.txt
```

### 2 dòng đầu tiên trong logs/loi_500.txt

```text
2026-09-28 08:10:39 POST /api/dat-cho status=500
2026-09-28 08:12:50 POST /api/dat-cho status=500
```

### b) Lệnh đếm số dòng status=404 và kết quả

```shell
(Get-content logs/member.log | select-string "status=404" |Measure-object).Count
```

```text
4
```

## 4.4. Chạy script tong_hop (.ps1 hoặc .sh)

### Lệnh chạy (Windows: nếu dùng Phụ lục 2 thì ghi cả 2 lệnh)

```shell
Get-content logs/member.log | select-string "status=404" >> logs/tong_hop.txt
(Get-content logs/member.log | select-string "status=500" | Measure-object).Count >> logs/tong_hop.txt

```

### Nội dung file logs/tong_hop.txt

```text
=== BAO CAO SU CO WEBSITE ===

2026-09-28 08:28:45 GET /images/phong-hop-3.jpg status=404
2026-09-28 08:41:40 GET /goi-cu status=404
2026-09-28 08:49:13 GET /images/phong-hop-3.jpg status=404
2026-09-28 08:59:46 GET /images/phong-hop-3.jpg status=404


6

```

## 4.5. README.md và bảo vệ thông tin bí mật

> README.md, .gitignore và .env.example được chấm trực tiếp trên file ở gốc dự án. Đánh dấu `[x]` vào các mục đã làm để tự kiểm tra.

- [x] README.md: Heading 1, mô tả có **in đậm** và *in nghiêng*, bảng, code block, task list, blockquote
- [x] .gitignore có dòng `.env` (tên file đúng, không có đuôi .txt)
- [x] .env.example có đủ tên biến, giá trị để trống (tên file đúng, không có đuôi .txt)

## 4.6. Kiểm tra trang web bằng DevTools (F12) và báo cáo lỗi

### Bảng lỗi

| STT | Tab DevTools phát hiện lỗi | Tên file hoặc thông báo lỗi | Cách khắc phục |
| --- | --- | --- | --- |
| 1 | network | (failed)net::ERR_FILE_NOT_FOUND  | Sửa lỗi log.png thành logo-coworkhub.png trong VS Code |
| 2 | Console  |Uncaught ReferenceError: hienThiBangThue is not defined  | Sửa lỗi hienThiBangThue thành hienThiBangGiaThue trong VS Code |

> Ảnh chụp màn hình lưu trong thư mục `evidence/` (network.png, console.png).

### Báo cáo lỗi gửi trưởng nhóm

- **Context: Em đã vào file index.html bằng trình duyệt Chome** 
- **Expected:Bảng giá thuê hiển thị đầy đủ mã gói, Gói Thuê, Giá/ngày (VND)** 
- **Actual:Bảng giá thuê không hiển thị đủ và lỗi ở tab Console hiện 2 lỗi đỏ** 
- **Log:Uncaught ReferenceError: hienThiBangGoiThue is not defined** 

### Câu tìm kiếm Google

```text
site:stackoverflow.com "Uncaught ReferenceError: hienThiBangGoiThue is not defined"

```

## 4.7. Excel

> Phần Excel được chấm trực tiếp trên file `data/thue_cho_thang_9.xlsx`, không cần ghi vào đây.
