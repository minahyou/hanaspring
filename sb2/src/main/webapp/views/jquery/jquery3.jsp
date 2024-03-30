<%--
  Created by IntelliJ IDEA.
  User: tlqla
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<script>
    let jquery1 = {
        //hover: 마우스 커서가 올라가면 이벤트 실행
        init: function () {
            $('#btn_get').click(function () {
                $.ajax({
                    url: '<c:url value="/getdata"/>',
                    success: function (data) {
                        jquery1.display(data);
                    }
                })
            })
        },
        display: function (datas) {
            let result = '';
            $(datas).each(function (index, data) {//배열 데이터를 반복
                result +=  data.id + data.pwd + data.name;
            });
            alert(result);
        }
    };
    $(function (){
        jquery1.init()
    })
</script>

<div class="container">
    <h2>JQuery3 Page</h2>
    <button id = "btn_get" type="button" class="btn btn-primary">GET</button>
</div>