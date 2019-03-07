Rick rick;
PImage background;

void setup() {
	background(255);
	size(768, 432);
	fill(255);
	strokeWeight(2);

	rick = new Rick();
	background = loadImage("background.jpg");
	background.resize(768, 432);
}

void draw() {
	image(background, 0, 0);
	rick.draw();
}
