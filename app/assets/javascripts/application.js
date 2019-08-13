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
//= require jquery3
//= require rails-ujs
//= require popper
//= require bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .



function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
            $('#attachments')
              .append(` 
              <div class='col'>
                  <img src='`+ e.target.result +`' alt='your image' class='left img-preview mx-auto d-block img-thumbnail'/>
              </div>`)
             
          };

          reader.readAsDataURL(input.files[0]);
        }
}

function send(data, url){     
        $.ajax({
                url: url,
                type: "POST",
                data: {value: data},
                dataType: 'json' 
        })
        .done(function(response){
            console.log(response);
        })        
}

function append(){
  $('#user_picture').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 5) {
      alert('Maximum file size is 5MB. Please choose a smaller file.');
    }
  });
}

$('.carousel').carousel('pause');
