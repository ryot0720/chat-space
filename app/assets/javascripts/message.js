$(function() {
  function new_message(message){
    var new_message = $('<div class = "chatBoxBody__messageSender">' + message.user_name + '</div>' +
                        '<div class = "chatBoxBody__messageDatetime">' + message.time + '</div>' +
                        '<div class = "chatBoxBody__chatMessage">' + message.text + '</div>' +
                        '<div class = "chatBoxBody__chatAvatar">' + message.avatar + '</div>'
                        // if(message.avatar) {
                        //                   var image_tag = '<img src = "' + message.avatar + '">';
                        //                   var image = '<div class = "chatBoxBody__chatAvatar">' + image_url +'</div>';
                        // } else {
                        //                   var image = '<div class = "chatBoxBody__chatAvatar">''</div>';
                        // };
                        );
    return new_message;
  }
  // フォーム送信時に非同期通信を始めるというコールバックの定義
  $('.js-form').on('submit', function(e){
    e.preventDefault();
    // フォームに入力された値を取得する
    var url = $(this)[0].action;
    var formdata = new FormData(this);
    // 非同期通信に必要なオプションの設定
    $.ajax({
      // リクエスト送信先のURL
      url: url,
      // HTTP通信の種類
      type: 'POST',
      // サーバに送る値の各種設定
      data: formdata,
      dataType: 'json',
      contentType: false,
      processData: false,
      // サーバから帰ってくるデータの方の設定
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
});
