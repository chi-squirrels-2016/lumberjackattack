$(document).ready(function() {
  $("#new_comment_button").on("click", function( event ) {
    event.preventDefault();
    var url = $("#new_comment_button").find("a").attr("href");
    $.ajax ({
      type: "get",
      url: url
    }).done( function (response) {
      $(response).appendTo("#question");
      $("#new_answer_button").hide();
      $('#new_comment_button').hide();
    });

    $("#question").on("submit", "#new_comment", function (event){
      event.preventDefault();
      var clickedButton = $("#new_comment").find("#button");
      var url = $(this).attr("action");
      var type = $(this).attr("method");
      var comment = $(this).find("textarea").val();
      console.log(comment);

      $.ajax ({
        type: type,
        url: url,
        data: {content: comment}
      }).done( function (response) {
        $(response).appendTo("#comments");
        $("#new_comment").hide();
        $("#new_answer_button").show();
        $('#new_comment_button').show();
      });
     });

  $("#answer").on("click", function(event){
    event.preventDefault();
    $(".answer_form").toggle();
  });

  $(".answer_form").on("submit", function(event){
    event.preventDefault();
    var url = $(this).attr("target");
    var data = $(this).serialize();
    var request = $.ajax({
      method: 'POST',
      url: url,
      data: data
    });

    request.done(function(response){
      $("#answer-container").replaceWith(response);
    });
    request.fail(function(data){
      console.log(data);
    });
  });
  });
});