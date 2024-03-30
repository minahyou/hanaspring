<%--
  Created by IntelliJ IDEA.
  User: tlqla
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
    let ajax2 = {
        init: function () {
            $('#id').keyup(function (){
                var id = $(this).val();
                ajax2.send(id);
            });
        },
        send: function (id){
            $.ajax({
                url: '<c:url value = "/checkid"/>',
                data: {'id': id},
                //1이 내려오면 쓸 수 있고, 0이면 불가
                success: function (data) {
                    ajax2.display(data);
                    var result = 'Available.';
                    if(data.trim() == '0'){
                        result = 'Not Available.';
                    }
                    $('#id_span').text(result);
                }
            });
        },
        display: function (data){
            $('#result').text(data);

        }
    }
    $(function (id){
        ajax2.init();
    });
</script>

<div class="container">
    <h2>AJAX2 Page</h2>
    <form id = "login_form" >
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
            <span id = "id_span"></span>
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
        </div>
        <button type="button" class="btn btn-primary">LOGIN</button>
    </form>
</div>