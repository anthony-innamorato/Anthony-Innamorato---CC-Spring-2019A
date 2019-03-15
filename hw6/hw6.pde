ArrayList<Entity> entities;
Ground g;
ParticleSystem p;

void setup() {
	size(1920, 1080);
	background(0);
	entities = new ArrayList<Entity>();

	//init player
	float initX = width/2;
	float initY = .75 * height - 30;
	entities.add(new Player(initX, initY, 0));
	//init ground
	g = new Ground(width/2, .75 * height);
	p = new ParticleSystem(initX, initY);

	fill(255);
	rectMode(CENTER);
}


void draw() {
	background(0);
	g.draw();
	for (Entity e : entities) {
		e.update();
		e.draw();
	}
	p.run();
	p.x = entities.get(0).x;
	p.y = entities.get(0).y;
	groundCollision();
	input();
}

void groundCollision() {
	if (entities.get(0).y > g.y - 30) {
		entities.get(0).y -= .2;
		entities.get(0).velY = 0;
	}
}

void input() {
	if (keyPressed && key == 'w') {
		entities.get(0).velY = -10;
		for (int i = 0; i < 9; i++) {
			p.add(i);
		}
	}
}
