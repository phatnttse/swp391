function loadNewestProducts(page) {
        $.ajax({
            type: "GET",
            url: "/home/page",
            data: {
                page: page,
            },
            dataType: 'html',
            success: function(response) {
            const content = $("#newest-products");
            const contain = $("#contain");
            content.html(response);
            },
            error: function(xhr) {
                console.error(xhr);
            }
        });
    }