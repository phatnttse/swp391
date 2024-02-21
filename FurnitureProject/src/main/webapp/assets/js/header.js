/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


const searchProducts = document.querySelector('.js-search-product');
            const modal = document.querySelector('.modal');
            const modalClose = document.querySelector('.js-modal-close');
            function showSearchTool() {
                modal.classList.add('open');
                event.preventDefault();
            }
            function hideSearchTool() {
                modal.classList.remove('open');
            }

            searchProducts.addEventListener('click', showSearchTool);
            modalClose.addEventListener('click', hideSearchTool);