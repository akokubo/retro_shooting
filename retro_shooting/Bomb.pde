// 爆弾クラス
class Bomb extends Sprite {
  float speed; // 速度

  // コンストラクタ
  Bomb(PImage image, float x, float y) {
    super(image, x, y);

    // 速度の指定
    speed = 1;
  }

  // 移動(オーバーライド)
  void move() {
    y += speed;
  }

  // 画面外に出たか
  boolean isOver() {
    boolean result = false;

    if (y >= stage.image.height) {
      result = true;
    }

    return result;
  }
}