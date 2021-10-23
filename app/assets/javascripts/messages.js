$(function() {
  $(function() {
    setInterval(update, 10000);
  });

  function update() {
    var message_id = $('.messages:last').data('id');
    $.ajax({
      url: location.href,
      type: 'GET',
      data: { 
        message: { id: message_id }
      },
      dataType: 'json'
    })
  }
});
