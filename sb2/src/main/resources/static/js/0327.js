// JSON (JavaScript Object Notation)
let datas = [
    {"id":"id01","name":"james1"},
    {"id":"id02","name":"james2"},
    {"id":"id03","name":"james3"},
    {"id":"id04","name":"james4"},
    {"id":"id05","name":"james5"}
];
let html2 = {
    init: function () {
        $('#btn').click(function () {
            // this.display(datas); this는 #btn을 가리켜서 에러
            html2.display(datas);
        });
    },
    display: function (datas) {
        let result = '';
        $(datas).each(function (index, data) {//배열 데이터를 반복
            result += '<tr>';
            result += '<td>'+data.id + '</td>';
            result += '<td>'+data.name + '</td>';
            result += '</tr>';
        });
        $('#cust_tb > tbody').html(result);
    }
};


let login = {
    url: '',
    init: function (url){
        this.url = url;
        // id      >  tag
        $('#login_form > button').click(function (){
            let id = $('#id').val(); // text, form에서 가져올때는 val(value)
            let pwd = $('#pwd').val();
            if(id=='' || id == null){
                alert("ID를 입력하세요");
                $('#id').focus();
                return;
            }
            if(pwd=='' || pwd == null){
                alert("PWD를 입력하세요");
                return;
            }
            login.send();
        });
    },
    send: function (){
        $('#login_form').attr({
            'method': 'post',
            'action': this.url
        }); //attr: form 태그의 action
        $('#login_form').submit();
    }
};