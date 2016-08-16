// オブジェクト
Stage stage;
Cannon cannon;

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

  // 表示
  stage.display();
  cannon.display();
}