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
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery.minicolors
//= require cable
//= require dashboard
//= require_tree .

//load color picker
$(document).on('ready',function(){
  $(".colors").minicolors({
    position: 'top right',
    inline: true
  });
})

//tiles on select add/remove class
function toggleClass(e){
  if ($(e).hasClass("selected")){
    $(e).removeClass("selected");
  }
  else{
    $(e).addClass("selected");
  }
}

//Update colors on selecting of Tiles
function updateTileColors(){
  if ($(".selected").size() == 0){
    alert("Please select a square!")
  }
  else{
    selectedColor = $(".colors").val();
    selectedTiles = []
    $(".selected").map(function() {
      $(this).css("background-color",selectedColor);
      selectedTiles.push($( this ).attr("id"))
    });
    user_id = $('.tiles-list').data('userId');
    App.global_chat.send_message({tiles: selectedTiles.join(","),color_code: selectedColor,user_id})

  }
}


