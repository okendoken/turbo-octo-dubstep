onLoad = function(){
    $('body').on('click', '#notifications .dropdown-menu a', function(){
        $.ajax({
            type: "POST",
            url: "/notifications/update",
            data: { id: $(this).parent().data('notification-id') }
        });
    });
};

$(onLoad);
$(document).on('page:change', onLoad);