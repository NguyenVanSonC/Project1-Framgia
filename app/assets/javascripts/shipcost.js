$(document).on("change", "#order_ship_id", function(){
    var value_cost = (document.getElementById("order_ship_id")).value;
    var str = "You chose ship cost : ";
    $.ajax({
        url: "/orders/new",
        method: "GET",
        dataType: "json",
        success: function(data) {
            $.each(data, function (index) {
                if (data[index].id==value_cost){
                    console.log(data[index].price);
                    $('#ship-cost').text(str+data[index].price+" $");
                    $("#ship-cost").css("background-color", "#FE980F");
                }
            });
        }
    });
});

