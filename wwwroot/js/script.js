document.addEventListener("DOMContentLoaded", function () {
    const userMenu = document.querySelector(".user-menu");
    const dropdownBtn = document.querySelector(".dropdown-btn");

    if (dropdownBtn) {
        dropdownBtn.addEventListener("click", function () {
            userMenu.classList.toggle("active");
        });
    }
});
