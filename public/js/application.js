
$(document).ready(function() {
  $('form#get_tweets').on('submit', function(e) {
    e.preventDefault();

    var num = Math.floor((Math.random()*3)+1)
    
    $('.tweet-display').html("<img src='ajax-loader.gif'>");
    $.post('/username', $(this).serialize()).done( function (response) {
      if (num === 3) {
        $('.tweet-display').html("Stop tweeting and go do your work!");
      }
      else {
        $('.tweet-display').html(response);
      }
    });
  });

  $('form#tweet_out').submit(function(e) {
    e.preventDefault();
    $('form').attr('disabled', 'disabled')
    $('.confirmation').html("<img src='ajax-loader.gif'>");

    var request = $.post('/tweet_me', $(this).serialize())

    request.done( function(response) {
      $('form').removeAttr('disabled');
      $('.confirmation').html("you've YAWPed!");
    });
    
    request.fail( function(response){
      $('form').removeAttr('disabled');
      $('.confirmation').html("Something went wrong.  YAWP again.");
    });
  });
});
