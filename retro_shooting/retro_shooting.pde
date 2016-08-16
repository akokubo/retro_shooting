// オブジェクト
Stage stage;
Cannon cannon;
Laser laser;
ArrayList<Alien> aliens;

void setup() {
  // ディスプレイ・ウィンドウのサイズを640x360に
  size(640, 360);

  // 画像を中心に表示するモード
  imageMode(CENTER);

  // オブジェクトの生成
  stage = new Stage(loadImage("stage.png"));
  cannon = new Cannon(loadImage("cannon.png"), 
    stage.image.width / 2, stage.image.height - 38);

  // エイリアン群の生成
  aliens = new ArrayList<Alien>();
  // 一つ一つのエイリアンを生成
  for (int y = 20; y <= 120; y += 20) {
    for (int x = 20; x <= 340; x+= 32) {
      // エイリアンを生成し
      Alien alien = new Alien(loadImage("alien.png"), x, y);
      // エイリアン群に追加
      aliens.add(alien);
    }
  }
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

  // エイリアン群の移動
  for (int i = 0; i < aliens.size(); i++) {
    // エイリアンを1つ取り出し
    Alien alien = aliens.get(i);
    // エイリアンを移動させる
    alien.move();
  }

  // レーザーとエイリアンの当たり判定
  for (int i = 0; i < aliens.size(); i++) {
    // エイリアンを一つ取り出し
    Alien alien = aliens.get(i);
    // レーザーが存在して、そのレーザーがエイリアンに当たったら
    if (laser != null && laser.isContactedWith(alien)) {
      // レーザーを消して
      laser = null;

      // エイリアンを消す
      aliens.remove(alien);

      // スコアをアップする
      stage.scoreUp(100);
    }
  }

  // 表示
  stage.display();
  cannon.display();
  if (laser != null) {
    // レーザーが存在するとき、表示させる
    laser.display();
  }
  for (int i = 0; i < aliens.size(); i++) {
    // エイリアンを一つ取り出し
    Alien alien = aliens.get(i);
    // エイリアンを表示する
    alien.display();
  }
}