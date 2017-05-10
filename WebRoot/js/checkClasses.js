/**
 * Created by lcx on 2017/5/8.
 */
var sheng_json=[
    {sheng:'衣服',shi:['女装','男装','内衣']},
    {sheng:'鞋靴',shi:['鞋','箱包','配件']},
    {sheng:'数码',shi:['家电','数码','手机']},
    {sheng:'美妆',shi:['美妆','洗护','保健品']},
    {sheng:'手表',shi:['珠宝','眼镜','手表']},
    {sheng:'户外',shi:['运动','户外','乐器']},
    {sheng:'房子',shi:['房产','装修','材料']},
    {sheng:'汽车',shi:['汽车','二手车','汽车用品']},
    {sheng:'家具',shi:['家具','家饰','家纺']}
];
var sheng_length = sheng_json.length;
$(function(){

    var flage = $("#proList").children().get(0);
    if(flage == null){
        for(var i=0;i<sheng_length;i++){
            var sheng = sheng_json[i].sheng;
            $("#proList").append("<li><a href=\"#\" value="+sheng+">"+sheng+"</a></li>");
        }
    }



    $('#proList li a').on('click', function(event) {
        var sheng = $(this).attr('value');
        var citys = new Array();
        $("#pro").html(sheng);
        for(var i=0;i<sheng_length;i++){
            if(sheng == sheng_json[i].sheng){
                citys = sheng_json[i].shi;
                break;
            }
        }

        var flage2 = $("#cityList").children().get(0);
        if(flage2 != null){
            $("#cityList").empty();
            $("#city").html("城市");
        }
        for(var j=0;j<citys.length;j++){
            $("#cityList").append("<li><a href=\"#\" value="+citys[j]+">"+citys[j]+"</a></li>");
        }

    });


    $("#city").on('click', function(event) {
        $("#cityList li a").on('click', function(event) {
            var city = $(this).attr('value');
            $("#city").html(city);
        });;

    });


});