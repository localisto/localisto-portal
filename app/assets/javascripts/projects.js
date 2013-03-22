



$(document).ready(function() {
 $("#surveyclose").AnyTime_picker(
   { format: "%d-%m-%Y %h:%i %p"} );

    $("#meetingstarts").AnyTime_picker(
      { format: "%d-%m-%Y %h:%i %p"} );
});


//$(document).ready(function() {
 
//$("input#meetingstarts").change(function(){
 //   timefrombox = $("input#meetingstarts").val();
  //  value = dateFormat("dddd, mmmm dS, yyyy, h:MM:ss TT")
   //var now = new Date();
 // $(".msl").html(now);
//});

//});

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

