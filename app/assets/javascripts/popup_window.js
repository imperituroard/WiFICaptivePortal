function controlF(x) {
    var flag = true, txt = '';
    if(document.getElementById('phone_number').value == '') { flag = false; txt += 'Вы не ввели номер телефона ! \r\n'; }
    else {
        //if (/^[1-9][0-9]{10,14}$/.test(document.getElementById('phone_number').value) == false) {
      //      flag = false;
      //      txt = 'Номер телефона введен неправильно ! \r\n';
     //   }
    }
    if(flag) x.submit();
    else {
        swal({
            title: "Error!",
            text: txt,
            type: "error",
            confirmButtonText: "Ok",
            confirmButtonColor: "#e30613"
        });

       // MessageBox.message('show', 'error');
       // alert(txt);

    }
}