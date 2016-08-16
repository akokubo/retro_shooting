// キャノン・クラス
class Cannon extends Sprite {
  // コンストラクタ
  Cannon(PImage image, float x, float y) {
    super(image, x, y);
  }

  // 移動(オーバーライド)
  void move() {
    x = mouseX;
  }
}