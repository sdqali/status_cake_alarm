(
    function($) {
        $(".toggle").click(function() {
            var details = $(".detailed");
            if(details.css("display") == "none") {
                details.show();
                $(this).text("▼");
            } else {
                details.hide();
                $(this).text("►");
            }
        });
    }
)(jQuery);
