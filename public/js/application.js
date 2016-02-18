$(document).ready(function() {
  $('#new_comment_button').on("click", function( event ) {
    event.preventDefault();
    $("#new_answer_button").hide();
    $('<form id="new_comment" name="new_comment" action="#" method="post"></form>').appendTo('#question');
    $('<textarea placeholder="Your Comment" cols="30" rows="5"></textarea>').appendTo('#new_comment');
    $("<button id='button' type='submit'>Add Comment!</button>").appendTo('#new_comment');

    var id = $(this).attr('href');
    console.log(id);

    $('#new_comment_button').hide();
     var comment = $('textarea').val();

     $.ajax ({
      type: "post",
      url: "/questions/"+ id +"/comment",
      dataType: "json",
      data: {content: comment}
     }).done( function ( response ){
      console.log(response);

     });

   });
});








//     $('#comment_area').on('click', '#button', function( event ) {
//       event.preventDefault();
//       var comment = $('textarea').val();
//       var author = $('input[name="authorName"]').val();
//       if (comment.length <= 0) {
//         $('#new_comment').remove();
//         $('#new_comment_button').show();
//       } else {
//         $('#new_comment').remove();
//         $('<li>'+comment+'<span class="author">'+author+'</span></li>').appendTo("#comment_list");
//         $('#new_comment_button').show();
//       }

//   });
// });
