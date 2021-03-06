// キャノン・クラス
class Cannon extends Sprite {
  float speed; // 速度
  int life; // ライフ

  // コンストラクタ
  Cannon(PImage image, float x, float y) {
    super(image, x, y);

    // 速度の指定
    speed = 2;

    // ライフの初期値
    life = 3;
  }

  // 移動(オーバーライド)
  void move() {
    // マウスの方向にspeed分移動する
    if (x < mouseX && x < stage.image.width - this.image.width / 2) {      
      x += speed;
    } else if (x > mouseX && x > this.image.width /2) {
      x -= speed;
    }
  }

  // キャノンの破壊
  void destroy() {
    life--;
  }
}