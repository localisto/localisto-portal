



$(document).ready(function() {
 $("#surveyclose").AnyTime_picker(
   { format: "%m-%d-%Y %h:%i %p"} );

    $("#meetingstarts").AnyTime_picker(
      { format: "%m-%d-%Y %h:%i %p"} );
});

 $(document).ready(function(){

    var lines = 3;
    var linesUsed = $('#linesUsed');

    $('#countMe').keydown(function(e) {

        newLines = $(this).val().split("\n").length;
        linesUsed.text(newLines);

        if(e.keyCode == 13 && newLines >= lines) {
            linesUsed.css('color', 'red');
            return false;
        }
        else {
            linesUsed.css('color', '');
        }
    });
});

