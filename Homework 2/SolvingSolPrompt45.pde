void setup() {

	size(1260, 630);
	background(0, 0, 0);

	stroke(255);
	strokeWeight(1);
	for (int j = 0; j < 5; j++) {
		if (j % 2 == 0) {
			for (int i = 0; i < 10; i++) {
				fill((int)random(256), (int)random(256), (int)random(256));
				rect(10 + (i*125), 60 + (j*125), 40, 10);
				rect(60 + (i*125), 10 + (j*125), 10, 40);
				rect(80 + (i*125), 60 + (j*125), 40, 10);
				rect(60 + (i*125), 80 + (j*125), 10, 40);
			}
		}
		else {
			for (int i = 0; i < 9; i++) {
				fill((int)random(256), (int)random(256), (int)random(256));
				rect(70 + (i*125), 60 + (j*125), 40, 10);
				rect(120 + (i*125), 10 + (j*125), 10, 40);
				rect(140 + (i*125), 60 + (j*125), 40, 10);
				rect(120 + (i*125), 80 + (j*125), 10, 40);
			}
		}
	}
}
