Balloon[] entities = new Balloon[5];
PImage background;
boolean lost = false;
int score = 0;
boolean paused = true;

class Balloon {
	PImage texture;
	float speed;
	float x, y;
	boolean toBeDeleted = false;
	Balloon(float initX) {
		texture = loadImage("balloons.png");
		texture.resize(86, 100);
		x = initX; y = height;
		speed = -2;
	}

	void update() {
		if (toBeDeleted) {return;}
		y += speed;
		if (y <= 0) { lost = true;}
	 }
	void draw() { image(texture, x, y); }
}

void mouseClicked() {
	for (int i = 0; i < 5; i++) {
		Balloon balloon = entities[i];
		if (mouseX >= balloon.x && mouseX <= balloon.x + 86 &&
		    mouseY <= balloon.y + 100 && mouseY >= balloon.y) {
			    entities[i].toBeDeleted = true;
			    score++;
		}
	}
}

void lostScreen() {
	background(255, 255, 255);
	textSize(100);
	text("GAME OVER SCORE: " + str(score), width/20, height/2);
}



void setup() {
	size(1280, 720);
	background = loadImage("landscape.jpg");

	for (int i = 0; i < 5; i++) {
		entities[i] = new Balloon(random(0, width - 86));
	}
	textSize(50);
	fill(0, 0, 0);
}

void draw() {
	if (paused) {if (keyPressed) {if (key == 'p') {paused = false;}} return;}
	if (lost) { lostScreen(); return; }
	image(background, 0, 0);
	text(score, width/2, height/4);

	for (int i = 0; i < 5; i++) {
		if (entities[i] == null) {
			entities[i] = new Balloon(random(0, width - 86));
		}
		if (entities[i].toBeDeleted) {entities[i] = null; continue;}
		entities[i].draw();
		entities[i].update();
	}
}
