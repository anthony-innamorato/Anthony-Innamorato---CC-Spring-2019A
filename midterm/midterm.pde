ArrayList<Entity> entities;

void setup() {
	size(1920, 1080);
	background(0);
	frameRate(60);
	rectMode(CENTER);


	entities = new ArrayList<Entity>();
	entities.add(new Player(width/2, height - 100, 0));

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
		curr.update();
		curr.draw();
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
		if (key == UP); //add bullet
	}
}


//bounds check
//gravity not applied to player
//a d SPACE keys for player
//player, bullet, enemy, shelter classes
//three zones of shelter: 1/5 3/5 5/5
//shelter low bound: height - 300, upp: height/2
//random spacing in zone
//three enemy models, represent w colors for now
