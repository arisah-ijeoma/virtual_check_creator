$(document).ready(function(){
  $('.datepicker').datepicker({
    container: 'body'
  });

  $('#cancel').on('click', function() {
    $('#modal1').css('display', 'none');
  })
});
