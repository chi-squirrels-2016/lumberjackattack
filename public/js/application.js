$(document).ready(function() {

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
