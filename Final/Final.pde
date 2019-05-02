Entity[] entities = new Entity[2];
//in format w, a, s, d
boolean[] movingDirs = new boolean[4];
Bullet pBull;
ArrayList<EnemyBullet> enemyBulls;

void setup() {
	size(1920, 1080);
	background(0);
	imageMode(CENTER);
	rectMode(CENTER);
	enemyBulls = new ArrayList<EnemyBullet>();

	//add player
	entities[0] = new Player(100, height/2, loadImage("assets/player.png"));
	//add boss
	entities[1] = new Boss(width-200, height/2, loadImage("assets/boss1.png"));
}

void draw() {
	background(0);

	for (int i = 0; i < enemyBulls.size(); i++) {
		EnemyBullet curr = enemyBulls.get(i);
		if (curr.update()) {
			enemyBulls.remove(i);
			i--;
			continue;
		}
		curr.draw();
	}

	for (Entity curr : entities) {
		curr.draw();
		curr.update();
	}

	input();
	pBullUpdate();
	if (frameCount%10 == 0 && (frameCount/30)%2 == 0)createEnemyBull();
}

void input() {
	if (movingDirs[0] && entities[0].y > 100) entities[0].y -= 10;
	if (movingDirs[1] && entities[0].x > 100) entities[0].x -= 10;
	if (movingDirs[2] && entities[0].y < height - 100) entities[0].y += 10;
	if (movingDirs[3] && entities[0].x < width - 100) entities[0].x += 10;
}

void keyPressed() {
	if (key == 'w') movingDirs[0] = true;
	else if (key == 'a') movingDirs[1] = true;
	else if (key == 's') movingDirs[2] = true;
	else if (key == 'd') movingDirs[3] = true;
	if (key == ' ' && pBull == null) createBullet();
}

void keyReleased() {
	if (key == 'w') movingDirs[0] = false;
	else if (key == 'a') movingDirs[1] = false;
	else if (key == 's') movingDirs[2] = false;
	else if (key == 'd') movingDirs[3] = false;
}

void createBullet() {
	pBull = new Bullet(entities[0].x + 20, entities[0].y, 20, 0);
}

void pBullUpdate() {
	if (pBull != null) {
		pBull.draw();
		if (bossCollision()) return;
		if (pBull.update()) pBull = null;
	}
}

boolean bossCollision() {
	Entity enemy = entities[1];
	float halfWidth = enemy.imgWidth/2;
	float halfHeight = enemy.imgHeight/2;
	if (pBull.x > enemy.x - halfWidth && pBull.x < enemy.x + halfWidth &&
		pBull.y > enemy.y - halfHeight && pBull.y < enemy.y + halfWidth) {
			enemy.health--;
			pBull = null;
			return true;
	}
	return false;
}

void createEnemyBull() {
	for (int i = 0; i < 3; i++) {
		enemyBulls.add(new EnemyBullet(entities[1].x, entities[1].y + (20*i)));
	}
}
