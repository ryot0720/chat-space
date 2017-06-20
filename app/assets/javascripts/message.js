$(function() {
  function new_message(message){

    var avatar = '';
    if (message.avatar.url) {
    avatar = `<img src="${message.avatar.url}">`};

    var new_message = $('<div class = "chatBoxBody__messageSender">' + message.user_name + '</div>' +
                        '<div class = "chatBoxBody__messageDatetime">' + message.time + '</div>' +
                        '<div class = "chatBoxBody__chatMessage">' + message.text + '</div>' +
                        '<div class = "chatBoxBody__chatAvatar">' + avatar + '</div>'
                        );

    return new_message;
  }

  $('.js-form').on('submit', function(e){
    e.preventDefault();

    var url = $(this)[0].action;
    var formdata = new FormData(this);

    $.ajax({
      url: url,
      type: 'POST',
      data: formdata,
      dataType: 'json',
      contentType: false,
      processData: false,
    })

    .done(function(message) {
      var html = new_message(message);
      $('.chatBoxBody').append(html);
      $('js-form__text-field').val('');
      $('.chatBoxFooter__sendMessageButton').prop('disabled', false);
      $('.chatBoxBody').animate({scrollTop: $('.chatBoxBody')[0].scrollHeight}, 'fast');
    })

    .fail(function(message) {
      alert('メッセージを入力してください');
    });
  });

  setInterval(function() {
      $.ajax({
        url: location.href,
        type: 'GET',
        dataType: 'json',
        processData: false,
        contentType: false,
      })
      .done(function(json) {
        $('.chatBoxBody').empty();
        json.messages.forEach(function(i, single){
          var html = new_message(single);
          $('.chatBoxBody').append(html);
        });
      })
    } , 5000);
});
