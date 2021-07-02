 $(function(){
    $(".openModal").click(function(){
        $(".allModal").css("display","flex");
    });

    $("#closeBtn").click(function(){
        $(".allModal").hide();

    });
});