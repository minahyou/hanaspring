<%--
  Created by IntelliJ IDEA.
  User: tlqla
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    let ajax3 = {
        init: function (){
            setInterval(function (){
                $.ajax({
                    url:'/getdata',
                    success: function (data){
                        ajax3.display(data);
                    }
                });
            }, 2000);
        },
        // display: function (data){
        //     let result = '';
        //     $(data).each(function (index, item) {//배열 데이터를 반복
        //         setInterval(function () {
        //             result = item.id + item.pwd + item.name;
        //             $('#result').text(result);
        //         }, 1000)
        //     });
        // }
        display: function (data){
            let index = 0;
            function displayNextItem() {
                if (index < data.length) {
                    let item = data[index];
                    let result = item.id + item.pwd + item.name;
                    $('#result').text(result);
                    index++;
                    setTimeout(displayNextItem, 1000);
                }
            }
            displayNextItem();
        }
    };
    $(function (){
        ajax3.init();
    });
</script>

<div class="container">
    <h2>AJAX3 Page</h2>
    <h3>Server Time</h3>
    <h3 id="result"></h3>
</div>