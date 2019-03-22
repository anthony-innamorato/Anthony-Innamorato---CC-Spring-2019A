ArrayList<Entity> entities;
Bullet pBull;

void setup() {
	size(1920, 1080);
	background(0);
	frameRate(60);
	rectMode(CENTER);


	entities = new ArrayList<Entity>();
	entities.add(new Player(width/2, height - 100));

	//add enemies
	for (int i = 0; i < 3; i++) {
		int numEnemiesInRow = 1920/300;
		if (i == 1) numEnemiesInRow++;
		for (int j = 0; j < numEnemiesInRow; j++) {
			entities.add(new Enemy((300*j) + 210 - (150*(i%2)), (225*(i-1)), i));
		}
	}
}

void draw() {
	background(0);
	input();
	for (Entity curr : entities) {
		if (!curr.alive) continue;
		curr.update();
		curr.draw();
	}
	if (pBull != null) {
		if (pBullCollision()) return;
		pBull.update();
		pBull.draw();
		if (pBull.y < 0) pBull = null;
	}
}

void input() {
	if (keyPressed) {
		Entity p1 = entities.get(0);
		if (key == 'a') {
			if (p1.x > 30) p1.x -= 10;
		}
		if (key == 'd') {
			if (p1.x < width - 30) p1.x += 10;
		}
		//TODO
		if (key == ' ') {
			if (pBull == null) createBullet();
		}
	}
}

void createBullet() {
	Entity p1 = entities.get(0);
	pBull = new Bullet(p1.x, p1.y - 30);
}

boolean pBullCollision() {
	for (int i = 1; i < entities.size(); i++) {
		Entity curr = entities.get(i);
		if (!curr.alive) continue;
		if (pBull.x > curr.x - 100 && pBull.x < curr.x + 100) {
			//its 120 instead of 100 to account for
			//the player bullet being in rectMode(CENTER)
			if (pBull.y < curr.y + 120) {
				pBull = null;
				curr.alive = false;
				return true;
			}
		}
	}
	return false;
}


//bounds check
//gravity not applied to player
//a d SPACE keys for player
//player, bullet, enemy, shelter classes
//three zones of shelter: 1/5 3/5 5/5
//shelter low bound: height - 300, upp: height/2
//random spacing in zone
//three enemy models, represent w colors for now
