
$(".open_mnu").click(function(){
    $(this).toggleClass('active').next().slideToggle();
});

var Ego = {};
var selectedSortby;
var tt = 'Thứ tự';
var selectedViewData = "data";
var filter = new Bizweb.SearchFilter()

                function toggleFilter(e) {
    _toggleFilter(e);
    renderFilterdItems();
    doSearch(1);
}
function _toggleFilterdqdt(e) {
    var $element = $(e);
    var group = 'Khoảng giá';
    var field = 'price_min';
    var operator = 'OR';	 
    var value = $element.attr("data-value");	
    filter.deleteValuedqdt(group, field, value, operator);
    filter.addValue(group, field, value, operator);
    renderFilterdItems();
    doSearch(1);
}
function _toggleFilter(e) {
    var $element = $(e);
    var group = $element.attr("data-group");
    var field = $element.attr("data-field");
    var text = $element.attr("data-text");
    var value = $element.attr("value");
    var operator = $element.attr("data-operator");
    var filterItemId = $element.attr("id");

    if (!$element.is(':checked')) {
        filter.deleteValue(group, field, value, operator);
    }
    else{
        filter.addValue(group, field, value, operator);
    }

    $(".catalog_filters li[data-handle='" + filterItemId + "']").toggleClass("active");
}
function renderFilterdItems() {
    var $container = $(".filter-container__selected-filter-list ul");
    $container.html("");

    $(".filter-container input[type=checkbox]").each(function(index) {
        if ($(this).is(':checked')) {
            var id = $(this).attr("id");
            var name = $(this).closest("label").text();
            addFilteredItem(name, id);
        }
    });

    if($(".aside-content input[type=checkbox]:checked").length > 0)
        $(".filter-container__selected-filter").show();
    else
        $(".filter-container__selected-filter").hide();
}
function addFilteredItem(name, id) {
    var filteredItemTemplate = "<li class='filter-container__selected-filter-item' for='{3}'><a href='javascript:void(0)' onclick=\"{0}\"><i class='fa'></i> {1}</a></li>";
    filteredItemTemplate = filteredItemTemplate.replace("{0}", "removeFilteredItem('" + id + "')");
    filteredItemTemplate = filteredItemTemplate.replace("{1}", name);
    filteredItemTemplate = filteredItemTemplate.replace("{3}", id);
    var $container = $(".filter-container__selected-filter-list ul");
    $container.append(filteredItemTemplate);
}
function removeFilteredItem(id) {
    $(".filter-container #" + id).trigger("click");
}
function filterItemInList(object) {
    q = object.val().toLowerCase();
    object.parent().next().find('li').show();
    if (q.length > 0) {
        object.parent().next().find('li').each(function() {
            if ($(this).find('label').attr("data-filter").indexOf(q) == -1)
                $(this).hide();
        })
    }
}

function clearAllFiltered() {
    filter = new Bizweb.SearchFilter();
    

                    $(".filter-container__selected-filter-list ul").html("");
    $(".filter-container input[type=checkbox]").attr('checked', false);
    $(".filter-container__selected-filter").hide();

    doSearch(1);
}
function doSearch(page, options) {
    if(!options) options = {};
    //NProgress.start();
    $('.aside.aside-mini-products-list.filter').removeClass('active');
    filter.search({
        view: selectedViewData,
        page: page,
        sortby: selectedSortby,
        success: function (html) {
            var $html = $(html);
            // Muốn thay thẻ DIV nào khi filter thì viết như này
            var $categoryProducts = $($html[0]); 
            $(".category-products").html($categoryProducts.html());
            pushCurrentFilterState({sortby: selectedSortby, page: page});
            awe_lazyloadImage();
            Ego.Wishlist.wishlistProduct();

            var modal = $('.quickview-product');
            var btn = $('.quick-view');
            var span = $('.quickview-close');

            btn.click(function () {
                modal.show();
            });

            span.click(function () {
                modal.hide();
            });

            $(window).on('click', function (e) {
                if ($(e.target).is('.modal')) {
                    modal.hide();
                }
            });

            $(".swatch").each(function(index, elem) {
                var scrapImg = $(this).find(".swatch-element");
                if(scrapImg.length > 3 ) {
                    var number = scrapImg.length-3;
                    $(this).attr('number',number);
                    $(this).append('<span class="btn-num">+'+ number +'</span>');
                    console.log($(this), number);
                }

            });
            $(".col-item .thumbs-list .thumbs-list-item img").hover(function () {
                var t = $(this).attr("data-img");
                $(this).parent().siblings().removeClass("active"), $(this).parent().addClass("active");
                var e = $(this).parents(".col-item").find(".product-thumb img");
                e && $(e).attr("src", t);
            });
            $('.add_to_cart').click(function(e){	
                e.preventDefault();		
                var $this = $(this);
                var form = $this.parents('form');	
                $.ajax({
                    type: 'POST',
                    url: '/cart/add.js',
                    async: false,
                    data: form.serialize(),
                    dataType: 'json',
                    beforeSend: function() { },
                    success: function(line_item) {
                        $('.cart-popup-name').html(line_item.title).attr('href', line_item.url, 'title', line_item.title);
                        ajaxCart.load();
                        $('#popup-cart-desktop, .cart-sidebar, .backdrop__body-backdrop___1rvky').addClass('active');
                    },
                    cache: false
                });
            });
            $('html, body').animate({
                scrollTop: $('.category-products').offset().top
            }, 0);
            resortby(selectedSortby);
            if (window.BPR !== undefined){
                return window.BPR.initDomEls(), window.BPR.loadBadges();
            }
        }
    });		
}
function sortby(sort) {		
    $('.sort-cate-left li').removeClass('active');
    switch(sort) {
        case "price-asc":
            selectedSortby = "price_min:asc";					   
            break;
        case "price-desc":
            selectedSortby = "price_min:desc";
            break;
        case "alpha-asc":
            selectedSortby = "name:asc";
            break;
        case "alpha-default":
            selectedSortby = "name:default";
            break;
        case "alpha-desc":
            selectedSortby = "name:desc";
            break;
        case "created-desc":
            selectedSortby = "created_on:desc";
            break;
        case "created-asc":
            selectedSortby = "created_on:asc";
            break;
        default:
            selectedSortby = "";
            break;
    }

    doSearch(1);
}
function resortby(sort) {
    switch(sort) {				  
        case "price_min:asc":
            tt = "Giá tăng dần";
            $('.sort-cate-left .price-asc').addClass("active");
            break;
        case "price_min:desc":
            tt = "Giá giảm dần";
            $('.sort-cate-left .price-desc').addClass("active");
            break;
        case "name:asc":
            tt = "A → Z";
            $('.sort-cate-left .alpha-asc').addClass("active");
            break;
        case "name:default":
            tt = "Mặc định";
            $('.sort-cate-left .alpha-default').addClass("active");
            break;
        case "name:desc":
            tt = "Z → A";
            $('.sort-cate-left .alpha-desc').addClass("active");
            break;
        case "created_on:desc":
            tt = "Hàng mới nhất";
            $('.sort-cate-left .position-desc').addClass("active");
            break;
        case "created_on:asc":
            tt = "Hàng cũ nhất";
            break;
        default:
            tt = "Mặc định";
            $('.sort-cate-left .default').addClass("active");
            break;
    }			   
    $('#sort-by > ul > li > span').html(tt);
}
function _selectSortby(sort) {			 
    resortby(sort);
    switch(sort) {
        case "price-asc":
            selectedSortby = "price_min:asc";
            break;
        case "price-desc":
            selectedSortby = "price_min:desc";
            break;
        case "alpha-asc":
            selectedSortby = "name:asc";
            break;
        case "alpha-default":
            selectedSortby = "name:default";
            break;
        case "alpha-desc":
            selectedSortby = "name:desc";
            break;
        case "created-desc":
            selectedSortby = "created_on:desc";
            break;
        case "created-asc":
            selectedSortby = "created_on:asc";
            break;
        default:
            selectedSortby = sort;
            break;
    }
}
function toggleCheckbox(id) {
    $(id).click();
}
function pushCurrentFilterState(options) {
    if(!options) options = {};
    var url = filter.buildSearchUrl(options);
    var queryString = url.slice(url.indexOf('?'));			  
    if(selectedViewData == 'data_list'){
        queryString = queryString + '&view=list';				 
    }
    else{
        queryString = queryString + '&view=grid';				   
    }
    pushState(queryString);
}
function pushState(url) {
    window.history.pushState({
        turbolinks: true,
        url: url
    }, null, url)
}
function switchView(view) {			  
    switch(view) {
        case "list":
            selectedViewData = "data_list";					   
            break;
        default:
            selectedViewData = "data";
            break;
    }			   
    var url = window.location.href;
    var page = getParameter(url, "page");
    if(page != '' && page != null){
        doSearch(page);
    }else{
        doSearch(1);
    }
}
function selectFilterByCurrentQuery() {
    awe_lazyloadImage();
    var isFilter = false;
    var url = window.location.href;
    var queryString = decodeURI(window.location.search);
    var filters = queryString.match(/\(.*?\)/g);
    var page = 0;
    if(queryString) {
        isFilter = true;
        $.urlParam = function(name){
            var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
            return results[1] || 0;
        }
        page = $.urlParam('page');
    }
    if(filters && filters.length > 0) {
        filters.forEach(function(item) {
            item = item.replace(/\(\(/g, "(");
            var element = $(".aside-content input[value='" + item + "']");
            element.attr("checked", "checked");
            _toggleFilter(element);
        });

        isFilter = true;
    }
    var sortOrder = getParameter(url, "sortby");
    if(sortOrder) {
        _selectSortby(sortOrder);
    }
    if(isFilter) {
        doSearch(page);
        renderFilterdItems();
    }
}
function getParameter(url, name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(url);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

$(document).ready(function(){
    $(window).on('popstate', function(){
        location.reload(true);
    });
    selectFilterByCurrentQuery();
    $('.filter-container .aside-item').click( function(){
        if ($(this).hasClass('active')){
            $(this).removeClass('active');
        }else{
            $('.filter-container .aside-item.active').removeClass('active');
            $(this).addClass('active');    
        }
    });

    $('#show-admin-bar').click(function(e){
        $('.aside.aside-mini-products-list.filter').toggleClass('active');
    });
    $('.filter-container__selected-filter-header-title').click(function(e){
        $('.aside.aside-mini-products-list.filter').toggleClass('active');
    });

    $('.aside-filter .aside-hidden-mobile .aside-item .aside-title').on('click', function(e){
        e.preventDefault();
        var $this = $(this);
        $this.parents('.aside-filter .aside-hidden-mobile .aside-item').find('.aside-content').stop().slideToggle();
        $(this).toggleClass('active');
        return false;
    });
    $('.open-filters').click(function(e){
        e.stopPropagation();
        $(this).toggleClass('openf');
        $('.dqdt-sidebar').toggleClass('openf');
        $('.backdrop__body-backdrop___1rvky').toggleClass('active');
    });
    $('.backdrop__body-backdrop___1rvky').click(function(e){
        $('.backdrop__body-backdrop___1rvky').removeClass('active');
        $('.dqdt-sidebar, .open-filters').removeClass('openf')
    });
    

});


