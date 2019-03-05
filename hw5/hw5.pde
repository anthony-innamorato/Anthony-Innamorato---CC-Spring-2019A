Rick rick;

void setup() {
	background(255);
	size(768, 432);
	fill(255);
	strokeWeight(2);

	rick = new Rick();
}

void draw() {
	background(255);
	rick.draw();
}
