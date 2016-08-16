// オブジェクト
Stage stage;

void setup() {
  // ディスプレイ・ウィンドウのサイズを640x360に
  size(640, 360);

  // 画像を中心に表示するモード
  imageMode(CENTER);

  // オブジェクトの生成
  stage = new Stage(loadImage("stage.png"));
}

void draw() {
  // 残像を消す
  background(204);

  // 表示
  stage.display();
}