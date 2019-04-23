Entity[] entities = new Entity[2];

void setup() {
	size(1920, 1080);
	background(155);
	imageMode(CENTER);


	//add player
	entities[0] = new Player(1920/2, 1080-100, loadImage("assets/player.png"));
	//add boss
	entities[1] = new Boss(1920/2, 1080*.25, loadImage("assets/boss1.png"));
}

void draw() {
	background(155);

	for (Entity curr : entities) {
		curr.draw();
	}

	input();
}

void input() {
	if (keyPressed) {
		if (key == 'a' && entities[0].x > 100) {
			entities[0].x -= 5;
		} else if (key == 'd' && entities[0].x < width - 100) {
			entities[0].x += 5;
		} else if (key == 'w' && entities[0].y > 100) {
			entities[0].y -= 5;
		} else if (key == 's' && entities[0].y < height - 100) {
			entities[0].y += 5;
		}
	}
}
