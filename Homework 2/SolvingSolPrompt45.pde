int[] currCol = {255, 0, 0};

void setup() {

	size(1260, 630);
	background(0, 0, 0);

	stroke(255);
	strokeWeight(1);
	frameRate(60);
}

void draw() {
	fill(currCol[0], currCol[1], currCol[2]);
	for (int j = 0; j < 5; j++) {
		if (j % 2 == 0) {
			for (int i = 0; i < 10; i++) {
				rect(10 + (i*125), 60 + (j*125), 40, 10);
				rect(60 + (i*125), 10 + (j*125), 10, 40);
				rect(80 + (i*125), 60 + (j*125), 40, 10);
				rect(60 + (i*125), 80 + (j*125), 10, 40);
			}
		}
		else {
			for (int i = 0; i < 9; i++) {
				rect(72.5 + (i*125), 60 + (j*125), 40, 10);
				rect(122.5 + (i*125), 10 + (j*125), 10, 40);
				rect(142.5 + (i*125), 60 + (j*125), 40, 10);
				rect(122.5 + (i*125), 80 + (j*125), 10, 40);
			}
		}
	}
	refreshColor();
}

void refreshColor() {
    if (currCol[0] == 255 && currCol[1] < 255 && currCol[2] == 0) { currCol[1]++; }
    if (currCol[1] == 255 && currCol[0] > 0 && currCol[2] == 0) { currCol[0]--; }
    if (currCol[1] == 255 && currCol[2] < 255 && currCol[0] == 0) { currCol[2]++; }
    if (currCol[2] == 255 && currCol[1] > 0 && currCol[0] == 0) { currCol[1]--; }
    if (currCol[2] == 255 && currCol[0] < 255 && currCol[1] == 0) { currCol[0]++; }
    if (currCol[0] == 255 && currCol[2] > 0 && currCol[1] == 0) { currCol[2]--; }
 }
