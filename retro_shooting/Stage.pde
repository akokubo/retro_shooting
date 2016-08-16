// ステージ・クラス
class Stage extends Sprite {
  PFont font; // フォント
  int score; // スコア

  // コンストラクタ
  Stage(PImage image) {
    super(image);

    // 画像の中心を座標として設定
    x = image.width / 2;
    y = image.height / 2;

    // フォントの生成
    font = createFont("MS Gothic", 20);

    // スコアの初期化
    score = 0;
  }

  // 表示(オーバーライド)
  void display() {
    // 親クラスのメソッドをそのまま呼ぶ
    super.display();

    // フォントと色の設定
    textFont(font);
    fill(0);

    // スコアの表示
    text("SCORE: " + score, this.image.width + 20, 20);

    // ライフの表示
    text("LIFE: " + cannon.life, this.image.width + 20, 40);
  }

  // スコアアップ
  void scoreUp(int value) {
    score += value;
  }
}