int[] currRGB = new int[3];
Pentagon[] set = new Pentagon[4];

class Pentagon {
	float x, y, radius;
	float currAngle = 0;
	float currScale = 1;
	float scaleStep = .005;
	Pentagon(int initX, int initY, int initRad) {
		x = initX; y = initY; radius = initRad;
	}
	void draw() {
		pushMatrix();
		currAngle += 2; currAngle %= 360;
		currScale += scaleStep;
		if (currScale > 1.5) scaleStep *= -1;
		else if (currScale < .1) scaleStep *= -1;
		translate(x, y);
		rotate(radians(currAngle));
		scale(currScale);
		float angle = radians(360/5);
		beginShape();
		for (float a = 0; a < TWO_PI; a += angle) {
			float sx = cos(a) * radius;
			float sy = sin(a) * radius;
			vertex(sx, sy);
		}
		endShape(CLOSE);
		popMatrix();
	}
}

void setup() {
	background(0);
	size(1280, 720);
	frameRate(120);
	for (int i = 0; i < 4; i++) {
		if (i%2 == 0) {
			set[i] = new Pentagon((width/4) + (width/2) * (i/2), height/2, 100);
		}
		else {
			int y = 150;
			if (i == 3) y = height - 150;
			set[i] = new Pentagon(width/2, y, 100);
		}
	}
	currRGB[0] = 255;
	currRGB[1] = 0;
	currRGB[2] = 0;
}

void draw() {
	background(comp(currRGB[0]), comp(currRGB[1]), comp(currRGB[2]));
	refreshColor();
	fill(currRGB[0], currRGB[1], currRGB[2]);
	for (int i = 0; i < 4; i++) {
		set[i].draw();
	}
}


void refreshColor() {
    if (currRGB[0] == 255 && currRGB[1] < 255 && currRGB[2] == 0) { currRGB[1]++; }
    if (currRGB[1] == 255 && currRGB[0] > 0 && currRGB[2] == 0) { currRGB[0]--; }
    if (currRGB[1] == 255 && currRGB[2] < 255 && currRGB[0] == 0) { currRGB[2]++; }
    if (currRGB[2] == 255 && currRGB[1] > 0 && currRGB[0] == 0) { currRGB[1]--; }
    if (currRGB[2] == 255 && currRGB[0] < 255 && currRGB[1] == 0) { currRGB[0]++; }
    if (currRGB[0] == 255 && currRGB[2] > 0 && currRGB[1] == 0) { currRGB[2]--; }
 }

int comp(int currColor) {
	int r, g, b;
	r = currRGB[0];
	g = currRGB[1];
	b = currRGB[2];
	return max(r, g, b) + min(r, g, b) - currColor;
}
