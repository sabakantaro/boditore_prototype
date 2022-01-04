window.addEventListener("load", function () {
  let token = document.getElementsByName("csrf-token")[0].content; //セキュリティトークンの取得
  // 追加するDOMノード（HTMLデータ）を生成する関数
  function createHTML(comment) {
    let strHtml =
      '<div class="comment" id="comment' +
      comment.id +
      '">' +
      '<div class="pl-2">' +
      comment.user_name +
      "</div>" +
      '<div class="flex display-start items-center pt-2 px-4 pb-2"><p>' +
      comment.text +
      "</p></div>" +
      "</div>";
    let divElm = document.createElement("div"); // divタグを持つノードを作成
    divElm.innerHTML = strHtml; // 文字列（strHtml）をinnerHTMLとして代入する際にDOMノードに変換される
    return divElm.children[0]; // 子要素を返す（必要なDOMノードが戻り値となる）
  }

  // if (!comment_input) {
  //   return false;
  // }

  // メモ投稿(POSTメソッド)の処理
  document.getElementById("comment_input").addEventListener(
    "submit",
    function (e) {
      e.preventDefault(); // デフォルトのイベント（HTMLデータ送信など）を無効にする
      //送信データの生成
      let inputText =
        document.getElementsByClassName("comment_form-text")[0].value; // textareaの入力値を取得
      let url =
        document.getElementById("comment_input").getAttribute("action") +
        ".json"; // 末尾に[.json]を追加してレスポンスデータのフォーマットをjson形式に指定
      let hashData = {
        // 送信するデータをハッシュ形式で指定
        comment: { text: inputText }, // 入力テキストを送信
        // authenticity_token: token  // セキュリティトークンの送信（ここから送信することも可能）
      };
      let data = JSON.stringify(hashData); // 送信用のjson形式に変換
      // Ajax通信を実行
      let xmlHR = new XMLHttpRequest(); // XMLHttpRequestオブジェクトの作成
      xmlHR.open("POST", url, true); // open(HTTPメソッド, URL, 非同期通信[true:default]か同期通信[false]か）
      xmlHR.responseType = "json"; // レスポンスデータをjson形式と指定
      xmlHR.setRequestHeader("Content-Type", "application/json"); // リクエストヘッダーを追加(HTTP通信でJSONを送る際のルール)
      xmlHR.setRequestHeader("X-CSRF-Token", token); // リクエストヘッダーを追加（セキュリティトークンの追加）
      xmlHR.send(data); // sendメソッドでサーバに送信
      // 受信したデータの処理
      xmlHR.onreadystatechange = function () {
        if (xmlHR.readyState === 4) {
          // readyStateが4になればデータの読込み完了
          if (xmlHR.status === 200) {
            // statusが200の場合はリクエストが成功
            let comment = xmlHR.response; // 受信したjsonデータを変数commentに格納
            let html = createHTML(comment); // 受信データを元にHTMLを作成
            document.getElementsByClassName("comments")[0].appendChild(html); // 作成したHTMLをドキュメントに追加
            document.getElementsByClassName("comment_form-text")[0].value = ""; // テキストエリアを空白に戻す
          } else {
            // statusが200以外の場合はリクエストが適切でなかったとしてエラー表示
            alert("error");
          }
          document.getElementsByClassName(
            "comment_form-btn"
          )[0].disabled = false; // submitボタンのdisableを解除
          document
            .getElementsByClassName("comment_form-btn")[0]
            .removeAttribute("data-disable-with"); // submitボタンのdisableを解除(Rails5.0以降はこちらも必要)
        }
      };
    },
    false
  );
});
