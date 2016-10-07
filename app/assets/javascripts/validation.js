function check(){
    JsHttpRequest.query(
        'ajax.php?x=c'+Math.random(),
        {
            'a1': 1,
            'a2': 11,
            'a3': 111
        },
        //Вместо  1, 11 и 111 напиши document.getElementById('АйДи инпута').value;
        function(result, errors) {
            if(errors)alert(errors);
            else{
                if(result==0){alert("ERRRRRRRRRRROR!");return false;}
            }
        }
    );
}

function controlF(x) {
    var flag = true, txt = '';
    var input_phone = document.getElementById('phone_number').value
    if(input_phone == '') { flag = false; txt = 'Вы не заполнили поле: phone_number \r\n'; }
    else {
        if (/^\d[\d\(\)\ -]{4,14}\d$/.test(document.getElementById('phone_number').value) == true) {
            flag = false;
            txt = 'Incorrect number \r\n';
        }
    }
    if(flag) x.submit();
    else { alert(txt); }
}