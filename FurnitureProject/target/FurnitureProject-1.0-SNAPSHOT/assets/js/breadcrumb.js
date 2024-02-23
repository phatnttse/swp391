// breadcrumb.js
function changePageTitle(newTitle) {
    document.getElementById('page-title').innerText = newTitle;
}

document.addEventListener('DOMContentLoaded', function () {
    var breadcrumbLinks = document.querySelectorAll('.breadcrumb a');
    breadcrumbLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            var pageTitle = this.innerText.trim();
            changePageTitle(pageTitle);
        });
    });
});
