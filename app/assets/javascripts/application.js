// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs 
//= require turbolinks
//= require semantic-ui
//= require the_comments

//= require_tree .


var showEmailModel = function() {
	$('.ui.basic.modal').modal('show');
};


var showMessage = function(status) {
  $('.ui.message').removeClass("red green black");


  if (status === "success" ) {
    $('.ui.message').closest('.message').addClass('green'); 
    $('.ui.message > .header').replaceWith("<div class=\"header centered\"> Thanks for signing up! <div>");
  }
  else if(status === "request")
  {
    $('.ui.message').closest('.message').addClass('blue'); 
    $('.ui.message > .header').replaceWith("<div class=\"header centered\"><a class=\"item\" onclick=\"showEmailModel();\">Like what you see ?  Click here to sign up for curated emails! </a></div>")
  }
  else {
    $('.ui.message').closest('.message').addClass('red'); 
    $('.ui.message > .header').replaceWith("<div class=\"header centered\"><a class=\"item\" onclick=\"showEmailModel();\">Oops! Click here to try Again</a></div>")
  }

  // show message
  if ($('.ui.message').hasClass('hidden')) {
     $('.message .close').closest('.message').transition('slide down');  
  }
      
if (status === "success") {
 $('.message .close').closest('.message').delay(5000).queue(function() {
       $(this).transition('slide up').dequeue(); 
    });
  }
else {}


};



document.addEventListener('turbolinks:load', function(event) {
  if (typeof ga === 'function') {
    ga('set', 'location', event.data.url);
    ga('send', 'pageview');
  }
});




  $(document)
    .ready(function() {
      // fix main menu to page on passing
      $('.main.menu').visibility({
        type: 'fixed'
      });
      $('.overlay').visibility({
        type: 'fixed',
        offset: 80
      });
      // lazy load images
      $('.image').visibility({
        type: 'image',
        transition: 'vertical flip in',
        duration: 500
      });
      // show dropdown on hover
      $('.main.menu  .ui.dropdown').dropdown({
        on: 'hover'
      });

      $('.main.menu').visibility({
        type: 'fixed'
      });

      //$(".userpic > img").css({"float": "left","color":"white", "height": "40px", "width": "40px"});

      //$('.userpic')
       //$('.userbar').css({"font-weight": "bold"});

          // for closing messages
     $('.message .close').on('click', function() { $(this).closest('.message').transition('fade');});


     $('.message .close').closest('.message').delay(30000).queue(function() {
        showMessage("request");
      });


});





