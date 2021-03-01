$(function() {
  $(function() {
    setInterval(update, 10000);
    //10000ミリ秒ごとにupdateという関数を実行する
  });

  function update() { //この関数では以下のことを行う
    var message_id = $('.messages:last').data('id'); //一番最後にある'messages'というクラスの'id'というデータ属性を取得し、'message_id'という変数に代入
    $.ajax({ //ajax通信で以下のことを行う
      url: location.href, //urlは現在のページを指定
      type: 'GET', //メソッドを指定
      data: { //railsに引き渡すデータは
        message: { id: message_id } //このような形(paramsの形をしています)で、'id'には'message_id'を入れる
      },
      dataType: 'json' //データはjson形式
    })
  }
});
