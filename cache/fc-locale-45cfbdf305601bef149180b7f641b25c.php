<?php return array (
  'plugins.generic.backup.failure' => '<strong>CẢNH BÁO: </strong>Một lỗi có thể đã xảy ra trong quá trình sao lưu. Nguyên nhân phổ biến nhất là quyền truy cập tập tin.',
  'plugins.generic.backup.tar.config' => '{$footNoteNum}. <strong>CẢNH BÁO:</strong> Công cụ "tar" chưa được cấu hình trong tệp cấu hình config.inc.php. Cấu hình sẽ phụ thuộc vào cấu hình máy chủ của bạn. Nó nên được chỉ định trong một phần gọi là [cli], trong tùy chọn cấu hình có tên là "tar", chỉ định đường dẫn đến tiện ích "tar", tức là:<br />
<pre>[cli]
tar = "/bin/tar"
</pre><br />',
  'plugins.generic.backup.db.config' => '{$footNoteNum}. <strong>CẢNH BÁO:</strong> Công cụ kết xuất cơ sở dữ liệu chưa được cấu hình trong tệp cấu hình config.inc.php. Cấu hình sẽ phụ thuộc vào cấu hình máy chủ của bạn và loại cơ sở dữ liệu bạn sử dụng. Nó nên được chỉ định trong một phần gọi là [cli], trong tùy chọn cấu hình có tên là "dump". Đối với MySQL, sử dụng công cụ mysqldump, tức là:<br />
<pre>[cli]
dump = "/usr/bin/mysqldump -h {$hostname} -u {$username} -p{$password} {$databasename}"
</pre>
Mã thông báo "%s" sẽ được thay thế bằng, theo thứ tự:<ol>
	<li>Database hostname</li>
	<li>Database username</li>
	<li>Database password</li>
	<li>Database name</li>
</ol>
Lưu ý rằng điều này liên quan đến việc chỉ định mật khẩu cơ sở dữ liệu trong dòng lệnh, có thể là mối quan tâm bảo mật.<br /><br />',
  'plugins.generic.backup.code' => 'Mã',
  'plugins.generic.backup.files' => 'Các tập tin',
  'plugins.generic.backup.db' => 'Cơ sở dữ liệu',
  'plugins.generic.backup.longdescription' => '<p>Các liên kết sau cho phép Quản trị viên Trang web tải xuống bản sao lưu đầy đủ các thành phần khác nhau của bản cài đặt. Một bản sao lưu hoàn chỉnh chứa <strong>tất cả</strong> các thành phần sau đây. Vui lòng tham khảo tài liệu kỹ thuật để biết thêm thông tin về cách các thành phần này liên quan đến nhau.</p>',
  'plugins.generic.backup.link' => 'Tải xuống sao lưu',
  'plugins.generic.backup.description' => 'Plugin này tạo ra một bản sao lưu của cài đặt.',
  'plugins.generic.backup.name' => 'Plugin sao lưu',
);