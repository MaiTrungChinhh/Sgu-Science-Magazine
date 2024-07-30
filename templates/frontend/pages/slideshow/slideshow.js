var slideIndex = 0;
var slideInterval;

showSlides(); // Gọi hàm để bắt đầu slideshow

// Hàm để chuyển đến slide tiếp theo hoặc trước đó
function plusSlides(n) {
  showSlides((slideIndex += n));
  resetSlideInterval(); // Reset slide interval khi người dùng nhấn nút
}

// Hàm để chỉ định slide hiện tại
function currentSlide(n) {
  showSlides((slideIndex = n));
  resetSlideInterval(); // Reset slide interval khi người dùng nhấn nút
}

// Hàm để hiển thị các slide
function showSlides() {
  var i;
  var slides = document.getElementsByClassName('slide');
  var dots = document.getElementsByClassName('dot');

  // Nếu slideIndex vượt quá số lượng slide, quay lại slide đầu tiên
  if (slideIndex >= slides.length) {
    slideIndex = 0;
  }
  // Nếu slideIndex nhỏ hơn 0, chuyển đến slide cuối cùng
  if (slideIndex < 0) {
    slideIndex = slides.length - 1;
  }

  // Ẩn tất cả các slide
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = 'none';
  }

  // Xóa lớp "active" của tất cả các dot
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(' active', '');
  }

  // Hiển thị slide hiện tại và thêm lớp "active" cho dot hiện tại
  slides[slideIndex].style.display = 'block';
  dots[slideIndex].className += ' active';
}

// Hàm để bắt đầu slide interval
function startSlideInterval() {
  slideInterval = setInterval(function () {
    showSlides((slideIndex += 1)); // Tự động chuyển slide sau mỗi 2 giây
  }, 3000); // Thay đổi thời gian nếu cần
}

// Hàm để reset slide interval
function resetSlideInterval() {
  clearInterval(slideInterval); // Hủy bỏ slide interval hiện tại
  startSlideInterval(); // Khởi động lại slide interval
}

// Bắt đầu slide interval khi trang được tải
startSlideInterval();
