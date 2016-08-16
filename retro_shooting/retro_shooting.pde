// オブジェクト
Stage stage;
Cannon cannon;
Laser laser;

void setup() {
  // ディスプレイ・ウィンドウのサイズを640x360に
  size(640, 360);

  // 画像を中心に表示するモード
  imageMode(CENTER);

  // オブジェクトの生成
  stage = new Stage(loadImage("stage.png"));
  cannon = new Cannon(loadImage("cannon.png"), 
    stage.image.width / 2, stage.image.height - 38);
}

void draw() {
  // 残像を消す
  background(204);

  // キャノンの移動
  cannon.move();

  // レーザーの発射
  if (laser == null) {
    // レーザーがないときにマウスをクリックしたら
    if (mousePressed) {
      // レーザーをキャノンの位置に生成
      laser = new Laser(loadImage("laser.png"), cannon.x, cannon.y - 8);
    }
  } else {
    // レーザーがあるときは、移動させる
    laser.move();
    // レーザーが画面外に出たら
    if (laser.isOver()) {
      // レーザーを消す
      laser = null;
    }
  }

  // 表示
  stage.display();
  cannon.display();
  if (laser != null) {
    // レーザーが存在するとき、表示させる
    laser.display();
  }
}