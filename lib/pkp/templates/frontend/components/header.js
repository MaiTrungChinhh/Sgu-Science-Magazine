document.addEventListener("DOMContentLoaded", function() {
    const currentUrl = window.location.href;

    const registerLink = document.querySelector('.pkp_nav_list a[href="http://localhost/Sgu-Science-Magazine/index.php/TCKH/user/register"]');
    const loginLink = document.querySelector('.pkp_nav_list a[href="http://localhost/Sgu-Science-Magazine/index.php/TCKH/login"]');

    if (currentUrl.includes("register")) {
        registerLink.classList.add('active');
    } else if (currentUrl.includes("login")) {
        loginLink.classList.add('active');
    }
});