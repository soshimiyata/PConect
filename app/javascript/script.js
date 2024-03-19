$(document).ready(function() {
   // スライドショーの設定を記述します
  $('.slider').slick({
    autoplay: true, // 自動再生を有効にする
    infinite: true, // スライドを無限ループさせる
    speed: 500, // スライドの切り替わる速度を0.5秒に指定（ミリ秒単位）
    slidesToShow: 3, // 一度に表示するスライドの数を3枚に指定
    slidesToScroll: 1, // 一度にスクロールするスライドの数を1枚に指定
    prevArrow: '<div class="slick-prev"></div>', // 前へボタンのHTMLコードを指定
    nextArrow: '<div class="slick-next"></div>', // 次へボタンのHTMLコードを指定
    centerMode: true, // センターモードを有効
    variableWidth: true, // 変数幅を有効
    dots: true, // ドット（ページネーション）を表示
  });
});