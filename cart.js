$(function(){
    //1.从localStorage获取购物信息
    var books = localStorage.getItem("carts");
    var bookArr = JSON.parse(books);//将获取到的字符串存放进数组中
    //2.声明一个html用来拼接页面
    var html = "";
    html += "<table id='cart' class='table text-center'>";
    html +=     "<tr class='danger'>";
    html +=         "<th class='text-center'>序号</th>";
    html +=         "<th class='text-center'>商品名称</th>";
    html +=         "<th class='text-center'>价格</th>";
    html +=         "<th class='text-center'>购买数量</th>";
    html +=         "<th class='text-center'>库存</th>";
    html +=         "<th class='text-center'>小计</th>";
    html +=     "</tr>";
    //3.遍历数组
    for(var i = 0;i < bookArr.length;i++){
        //获取一本书
        var abook = bookArr[i];
        //将书本的信息填到表格中
        html +=     "<tr>";
        html +=         "<td>"+i+"</td>";
        html +=         "<td>"+abook.name+"</td>";
        html +=         "<td>"+abook.price+"</td>";
        html +=         "<td><a class='glyphicon glyphicon-minus-sign' οnclick='subBuyNum(this)'></a>"+abook.buynum+"<a class='glyphicon glyphicon-plus-sign' οnclick='addBuyNum(this)'></a></td>";
        html +=         "<td>"+abook.num+"</td>";
        html +=         "<td>"+abook.price*abook.buynum+"</td>";
        html +=     "</tr>";
    }
    html += "</table>";
    $("#cartable").html(html);
});
//点击减号按钮
function subBuyNum(caller){
    calFunction(caller,"sub");
}
//点击加号按钮
function addBuyNum(caller){
    calFunction(caller,"add");
}
//优化代码
function calFunction(caller,tag){
    //得到当前调用者的父节点
    var $parent = $(caller).parent();
    //找到父节点的文本信息
    var buyNum = parseInt($parent.text());
    //判断当前是+还是-
    if(tag == "sub"){
        //减号
        if(buyNum>=2){
            buyNum--;
        }
    }
    //加号
    else{
        buyNum++;
    }
    //4.拼接html信息,把html放到parent中
    var html = "";
    html += "<a class='glyphicon glyphicon-minus-sign' οnclick='subBuyNum(this)'></a>"+buyNum+"<a class='glyphicon glyphicon-plus-sign' οnclick='addBuyNum(this)'></a>";
    $parent.html(html);

    //5.找到价格元素的信息
    var $price = $parent.prev();
    var price = parseFloat($price.text());

    //6.修改小计元素的信息
    var $lastB = $parent.next().next();
    $lastB.text(price*buyNum);

    //7.修改总计元素的信息
    calTotal();

    //8.修改本地购物车的数量
    //8.1找到序号数列
    var $first = $parent.parent().children(":first-child");
    var n = parseInt($first.text());
    modiyBuyNum(n,buyNum);
}

//计算当前购物车的总价格
function calTotal(){
    var $totalPrice = $("#totalprice"); 
    //找到table里面的tbody,其实table的所有正文信息都放在tbody里面
    var $table = $("#cart").children();
    var $children = $table.children(":not(:first)");
    var $rowprices = $children.children(":last-child");
    var totalp = 0;
    $rowprices.each(function(){
        var p = parseFloat($(this).text());
        totalp += p;
    })
    $totalPrice.text("总计:"+totalp);
}

//页面一载入就计算总计购物车的总价信息
$(function(){
    calTotal();
})


//修改本地购物车的数量
function modiyBuyNum(idx,buynum){
    //1.获取本地购车的数据(字符串)
    var books = localStorage.getItem("carts");
    //2.把字符串转换为数组对象
    var bookArr = JSON.parse(books);
    //3.从数组中获取指定idx的数据
    var abook = bookArr[idx];
    //4.修改这条数据
    abook.buynum = buynum;
    //5.重新保存购物车
    var booksStr = JSON.stringify(bookArr);
    localStorage.setItem("carts",booksStr);
}
————————————————
版权声明：本文为CSDN博主「Java_jfei」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/Java_jfei/article/details/58716451