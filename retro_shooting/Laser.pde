// レーザー・クラス
class Laser extends Sprite {
  float speed; // 速度

  // コンストラクタ
  Laser(PImage image, float x, float y) {
    super(image);

    // 座標の設定
    this.x = x;
    this.y = y;

    // 速度の指定
    speed = 4;
  }

  // 移動(オーバーライド)
  void move() {
    y -= speed;
  }
}