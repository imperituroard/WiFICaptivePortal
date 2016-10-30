function proverka(input) {
    var value = input.value;
    var rep = /\d+$/;
    if (rep.test(value)) {
        return 0;
    } else {
        value = value.replace(rep, '');
        input.value = value;
    }
}


$(function() {
    $('#popup').hide(); // ñêðûëè ôîí è âñïëûâàþùåå îêíî
    $('#hide-layout').css({opacity: .5}); // êðîññáðàóçåðíàÿ ïðîçðà÷íîñòü
    alignCenter($('#popup')); // öåíòðèðîâàëè îêíî
    $(window).resize(function() {
        alignCenter($('#popup')); // öåíòðèðîâàíèå ïðè ðåñàéçå îêíà
    })
    $('#click-me').click(function() {
        $('#hide-layout, #popup').fadeIn(300); // ïëàâíî îòêðûâàåì
    })
    $('#btn-close, #hide-layout').click(function() {
        $('#hide-layout, #popup').fadeOut(300); // ïëàâíî ñêðûâàåì
    })
    $('#btn-yes, #btn-no').click(function() {
        alert('Âûïîëíèëè êàêîå-òî äåéñòâèå, çàòåì ñêðûâàåì îêíî...'); // ñäåëàëè ÷òî-òî...
        $('#hide-layout, #popup').fadeOut(300); // ñêðûëè
    })
    // ôóíêöèÿ öåíòðèðîâàíèÿ
    function alignCenter(elem) {
        elem.css({
            left: ($(window).width() - elem.width()) / 2 + 'px', // ïîëó÷àåì êîîðäèíàòó öåíòðà ïî øèðèíå
            top: ($(window).height() - elem.height()) / 2 + 'px' // ïîëó÷àåì êîîðäèíàòó öåíòðà ïî âûñîòå
        })
    }
})