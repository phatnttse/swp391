/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


function autoCloseAlert() {
    var alertBox = document.getElementById('autoCloseAlert');
    if (alertBox) {
        setTimeout(function () {
            alertBox.style.display = 'none'; // Ẩn alert
        }, 5000); // 5 giây
    }
}

// Gọi hàm để tự động đóng alert khi trang được tải
window.onload = autoCloseAlert;