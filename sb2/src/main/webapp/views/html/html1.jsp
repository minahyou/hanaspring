<%--
  Created by IntelliJ IDEA.
  User: tlqla
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--css-->
<style>
    p{
        color:red;
    }
</style>

<!--동적생성, 화면 모두 출력후에 함수 실행-->
<script>
    //jQuery ; 문서가 준비되면 함수 시작
    $(document).ready(function (){
        $('#ptag').text('Replace Text');
        $('p').click(function(){
            alert("ok");
            $(this).text('Click Event');
        });

    });
    //    window.onload = function (){
    // document.getElementById("ptag").innerHTML = 'Replace Text';
    //
    //     document.querySelector('h5').addEventListener(onclick(function (){
    //         alert('ok');
    //     }))
    //};
</script>


<div class="container">
    <h2>HTML1 Page</h2>
    <h5>Title description, Sep 2, 2017</h5>
    <div class="fakeimg">Fake Image</div>
    <p>Some text..</p>
    <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    <span>Span</span>
    <a href="#">A TAG</a>

</div>


