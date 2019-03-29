//updates since presentation:
// 1). added gravity to enemy bullets
// 2). added second level as condition for final win


ArrayList<Entity> entities;
Bullet pBull;
boolean playerLost = false;
boolean playerWon = false;
boolean titleScreen = true;
boolean level1 = true;
int titleBuffer;

void setup() {
	size(1920, 1080);
	frameRate(60);
	rectMode(CENTER);
	titleBuffer = 30;

	entities = new ArrayList<Entity>();
	entities.add(new Player(width/2, height - 100));

	//add enemies
	for (int i = 0; i < 3; i++) {
		int numEnemiesInRow = 1920/300;
		if (i == 1) numEnemiesInRow++;
		for (int j = 0; j < numEnemiesInRow; j++) {
			entities.add(new Enemy((300*j) + 210 - (150*(i%2)), (225*(i-1)) - 300, i, j));
		}
	}
}

void level2Setup() {
	//TODO INPLEMENT THIS
	entities.clear();
	pBull = null;
	level1 = false;
	playerLost = false;
	playerWon = false;
	titleBuffer = 30;

	entities.add(new Player(width/2, height - 100));
	//odd rows
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 1920/300; j++) {
			entities.add(new Enemy( (300*j) + 210, -1065 + (510*i), i, j));
		}
	}

	for (int i = 0; i < 2; i++) {
		for (int j = 0; j < (1920/300) + 1; j++) {
			entities.add(new Enemy( (300*j) + 60, -810 + (510*i), i, j));
		}
	}
}

void draw() {
	if (titleScreen) {
		titleScreen();
		return;
	}
	if (playerLost) {
		playerLostScreen();
		return;
	}
	if (playerWon) {
		playerWonScreen();
		return;
	}
	background(255);
	input();
	for (Entity curr : entities) {
		if (!curr.alive) {
			curr.partSys.run();
			continue;
		}
		curr.update();
		curr.draw();
	}
	if (pBull != null) {
		if (pBullCollision()) return;
		pBull.update();
		pBull.draw();
		if (pBull.y < 0) pBull = null;
	}
	checkWon();
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
	pBull = new Bullet(p1.x, p1.y - 30, true);
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
				curr.partSys = new ParticleSystem(curr.x, curr.y);
				return true;
			}
		}
	}
	return false;
}

void playerLostScreen() {
	background(255);
	textSize(100);
	fill(0);
	text("GAME OVER", width/2 - 275, height/2);
	if (keyPressed && key == ENTER) reset();
}

void playerWonScreen() {
	background(255);
	textSize(100);
	fill(0);
	text("YOU WON", width/2 - 275, height/2);
	if (keyPressed && key == ENTER) reset();
}

void checkWon() {
	for (int i = 1; i < entities.size(); i++) {
		Entity curr = entities.get(i);
		if (curr.alive) return;
	}
	if (level1) {
		level2Setup();
		return;
	}
	playerWon = true;
}

void titleScreen() {
	titleBuffer--;
	background(0);
	textSize(100);
	fill(255);
	text("ANTI-RGB", width/2 - 275, height/2);
	if (playerStartedGame() && titleBuffer < 0) titleScreen = false;
}

boolean playerStartedGame() {
	if (keyPressed) {
		if (key == ENTER) return true;
	}
	return false;
}

void reset() {
	entities.clear();
	pBull = null;
	playerLost = false;
	playerWon = false;
	titleScreen = true;

	setup();
}
