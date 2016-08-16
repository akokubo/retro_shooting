// エイリアン・クラス
class Alien extends Sprite {
  int direction; // 移動方向(左-1、右+1)
  float speed; // 速度
  float advance; // 前進速度

  // コンストラクタ
  Alien(PImage image, float x, float y) {
    super(image, x, y);

    // 移動方向と速度の設定
    direction = 1;
    speed = 0.5;
    advance = 8;
  }

  // 移動(オーバーライド)
  void move() {
    x += direction * speed;
    // 画面の端に着いたら
    if (atEnds()) {
      // ターンする
      turn();
    }
  }

  // 画面の端に着いた
  boolean atEnds() {
    boolean result = false;

    if (x < this.image.width / 2 || x > stage.image.width - this.image.width / 2) {
      result = true;
    }

    return result;
  }

  // ターンする
  void turn() {
    // 向きを変えて
    direction *= -1;
    // 下がる
    y += advance;
  }
}