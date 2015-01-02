$('input, select').keypress(
    function(event) { 
        return event.keyCode != 13; 
    });