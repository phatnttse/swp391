/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


document.addEventListener("DOMContentLoaded", function () {
        var inputs = document.querySelectorAll('.code-input input');

        inputs.forEach(function (input, index) {
            input.addEventListener('input', function () {
                if (input.value.length === 1) {
                    // Nếu người dùng đã nhập một ký tự, tự động chuyển sang ô tiếp theo
                    if (index < inputs.length - 1) {
                        inputs[index + 1].focus();
                    }
                } else if (input.value.length === 0) {
                    // Nếu người dùng xóa ký tự, tự động chuyển sang ô trước đó (nếu có)
                    if (index > 0) {
                        inputs[index - 1].focus();
                    }
                }
            });
        });
    });

    function submitForm(event) {    
        document.querySelector('.link a:nth-child(1)').classList.add('disabled');
        setTimeout(function () {
            document.querySelector('.link a:nth-child(1)').classList.remove('disabled');
        }, 3000);
    }
    function resetForm(event) {       
        document.querySelector('.link a:nth-child(2)').classList.add('disabled');
        setTimeout(function () {
            document.querySelector('.link a:nth-child(2)').classList.remove('disabled');
        }, 3000);
    }
    function reloadPage() {
        location.reload();
    }