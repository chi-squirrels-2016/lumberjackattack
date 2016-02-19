$(document).ready(function() {

  $("#new_comment_button").on("click", function( event ) {
    event.preventDefault();
    var url = $("#new_comment_button").find("a").attr("href");
    $.ajax ({
      type: "get",
      url: url
    }).done( function (response) {
      $(response).appendTo("#question");
      $('#new_comment_button').hide();
    });
  });

    $("#question").on("submit", "#new_comment", function (event){
      event.preventDefault();
      var clickedButton = $("#new_comment").find("#button");
      var url = $(this).attr("action");
      var type = $(this).attr("method");
      var comment = $(this).find("textarea").val();
      $.ajax ({
        type: type,
        url: url,
        data: {content: comment}
      }).done( function (response) {
        $(response).appendTo("#comments");

        $('#question').find("#new_comment").remove();
        // $("#new_answer_button").append("#question");
        $('#question').find("#new_comment_button").show();

      });
     });



  $("#weird").on("submit", ".answer_form", function(event){
    event.preventDefault();
    var url = $(this).attr("target");
    var data = $(this).serialize();
    var request = $.ajax({
      method: 'POST',
      url: url,
      data: data
    });

    request.done(function(response){
      console.log(response);
      $("#answer-block").replaceWith(response);
      $(".answer_form").slideToggle();

    });
  });

  $("#answer_button").on("click", function(event){
    event.preventDefault();
    $(".answer_form").slideToggle();
  });
  // $("#best_answer").on("click", function (event) {
  //   event.preventDefault();
  //   var url = $(this).attr("action");
  //   var type = $(this).attr("method");
  //   $.ajax({
  //     type: type,
  //     url: url
  //   }).done( function(response) {


  //   })




  // })

});


