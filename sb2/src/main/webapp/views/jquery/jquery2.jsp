<%--
  Created by IntelliJ IDEA.
  User: tlqla
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<style>
    .div_bg{
        border:2px solid #b62f5b !important;
    }
</style>
<script>
    let jquery2 = {
        init:function (){
            $('#append').click(function (){
                $('#result').append('<h2>Append..</h2>');
            });
            $('#prepend').click(function (){
                $('#result').prepend('<h2>Prepend..</h2>');
            });
            $('#after').click(function (){
                $('#result').after('<h2>After..</h2>');
            });
            $('#before').click(function (){
                $('#result').before('<h2>Before..</h2>');
            });
            $('#remove').click(function (){
                $('#result').remove();
            });
            $('#empty').click(function (){
                $('#result').empty();
            });

        }
    };
    $(function (){
        jquery2.init();

    })
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <h2>jQuery2 Page</h2>
    <button id = "append" type="button" class="btn btn-primary">ADD</button>
    <button id = "prepand" type="button" class="btn btn-primary">PREPEND</button>
    <button id = "after" type="button" class="btn btn-primary">AFTER</button>
    <button id = "before" type="button" class="btn btn-primary">BEFORE</button>
    <button id = "remove" type="button" class="btn btn-primary">REMOVE</button>
    <button id = "empty" type="button" class="btn btn-primary">EMPTY</button>

    <div id = "result" class ="container div_bg">

    </div>

</div>