$(function() {

  function list_group_member(user) {

    var list_group_member = '<div class = "chat-group-user clearfix">' +
                            '<p class = "chat-group-user__name">' + user.name + '</p>' +
                            '<a class = "user-search-add chat-group-user__btn chat-group-user__btn--add"                            data-user-id = " '+ user.id + '" data-user-name = " '+ user.name + '">追加</a>' +
                            '</div>';

    return list_group_member;
  }

  function add_group_member(id, name){
   var add_group_member =   '<div class="chat-group-user clearfix js-chat-member" id="' + id + '">' +
                            '<p class = "chat-group-user__name">' + name + '</p>' +
                            '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn">削除</a>' +
                            '</div>';

    return add_group_member;
  }

  $('#user-search-field').on('keyup', function(e){
    e.preventDefault();
    var text = $.trim($(this).val());
    input = text.match("^[0-9a-zA-Z]+$")
    $.ajax({
      type: 'GET',
      url: '/users',
      data: ('keyword=' + input),
      dataType: 'json',
      processData: false,
      contentType: false
    })
    // インクリメンタルサーチによるメンバーのリスト表示
    .done(function(user){
      $('#user-search-result').find('li').remove();
      $(user).each (function(i, user){
        $('#user-search-result').append('<li>' + list_group_member(user) + '</li>')
      });
    })

    .fail(function(user) {
      alert('ユーザー検索に失敗しました');
    });
  });
      // メンバーの追加
  $(document).on("click", ".chat-group-user__btn--add", function(){
    var id = $(this).attr("data-user-id");
    var name = $(this).attr("data-user-name");
    $('#chat-group-users').append('<li>' + add_group_member(id, name) + '</li>')
    $(this).parent().remove();
  });
  // メンバーの削除
  $("#chat-group-users").on("click", ".chat-group-user__btn--remove", function(){
    $(this).parent().remove();
    })
});
