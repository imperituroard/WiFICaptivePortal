
    (function( $ ){

//// ---> Ïðîâåðêà íà ñóùåñòâîâàíèå ýëåìåíòà íà ñòðàíèöå
        jQuery.fn.exists = function() {
            return jQuery(this).length;
        }

//	Phone Mask
        $(function() {

            if($('#phone_number').exists()){

                $('#phone_number').each(function(){
                    $(this).mask("(999) 999-99-99");
                });

            }

            if($('.phone_number').exists()){

                var form = $('.phone_number'),
                    btn = form.find('.btn_submit');

                form.find('.rfield').addClass('empty_field');

                setInterval(function(){

                    if($('#phone_number').exists()){
                        var pmc = $('#phone_number');
                        if ( (pmc.val().indexOf("_") != -1) || pmc.val() == '' ) {
                            pmc.addClass('empty_field');
                        } else {
                            pmc.removeClass('empty_field');
                        }
                    }

                    var sizeEmpty = form.find('.empty_field').size();

                    if(sizeEmpty > 0){
                        if(btn.hasClass('disabled')){
                            return false
                        } else {
                            btn.addClass('disabled')
                        }
                    } else {
                        btn.removeClass('disabled')
                    }

                },200);

                btn.click(function(){
                    if($(this).hasClass('disabled')){
                        return false
                    } else {
                        form.submit();
                    }
                });

            }

        });

    })( jQuery );


