$(document).on("ready page:load", 
  function() {
$('input, select').keypress(
    function(event) { 
        return event.keyCode != 13; 
    })
});