SetOfFour[] entities = new SetOfFour[48];


class MyColor {
	int r; int g; int b;
	MyColor(int initR, int initG, int initB) {
		r = initR; g = initG; b = initB;
	}

	void refreshColor() {
	    if (r == 255 && g < 255 && b == 0) { g++; }
	    if (g == 255 && r > 0 && b == 0) { r--; }
	    if (g == 255 && b < 255 && r == 0) { b++; }
	    if (b == 255 && g > 0 && r == 0) { g--; }
	    if (b == 255 && r < 255 && g == 0) { r++; }
	    if (r == 255 && b > 0 && g == 0) { b--; }
	 }
}

class Rectangle {
	MyColor rectColor;
	float x; float y;
	int rectWidth; int rectHeight;
	Rectangle(float initX, float initY, int initWidth, int initHeight, int pos) {
		x = initX; y = initY;
		rectWidth = initWidth; rectHeight = initHeight;
		rectColor = new MyColor(255, 0, 0);
		for (int i = 0; i < pos * 100; i++) {rectColor.refreshColor();}
	}

	void draw() {
		fill(rectColor.r, rectColor.g, rectColor.b);
		rect(x, y, rectWidth, rectHeight);
		rectColor.refreshColor();
	}
}

class SetOfFour {
	Rectangle[] rects = new Rectangle[4];
	SetOfFour(int index) {
		float[] offsets = new float[2];
		int colNum;
		if ((index >= 10 && index <=  18) ||
		    (index >= 29 && index <= 37)) {
			//shifted row
			if (index <= 18) {colNum = index%10;}
			else {colNum = index%29;}
			offsets[0] = 72.5 + (colNum*125);
			if (index <= 18) {offsets[1] = 60 + 125;}
			else {offsets[1] = 60 + 375;}

			for (int i = 0; i < 4; i++) {
				rects[i] = oneRect(colNum, i, offsets);
			}

		}
		else {
			if (index < 10) {colNum = index;}
			else if (index < 29) {colNum = index%19;}
			else {colNum = index%38;}
			offsets[0] = 10 + (colNum*125);
			if (index < 10) {offsets[1] = 60;}
			else if (index < 29) { offsets[1] = 60 + 250;}
			else {offsets[1] = 60 + 500;}

			for (int i = 0; i < 4; i++) {
				rects[i] = oneRect(colNum, i, offsets);
			}
		}

	}

	void draw() {
		for (int i = 0; i < 4; i++) { rects[i].draw(); }
	}

	private Rectangle oneRect(int pos, int index, float[] offsets) {
		float x = offsets[0];
		float y = offsets[1];
		int initWidth, initHeight;
		if (index % 2 == 1) {
			x += 50;
			initWidth = 10;
			initHeight = 40;
			if (index == 1) {y -= 50;}
			else {y += 20;}
		}
		else {
			initWidth = 40;
			initHeight = 10;
		}
		if (index == 2) {x += 70;}
		return new Rectangle(x, y, initWidth, initHeight, pos);
	}
}

void setup() {
	size(1260, 630);
	background(0, 0, 0);

	stroke(255);
	strokeWeight(1);
	frameRate(240);

	for (int i = 0; i < 48; i++) {
		entities[i] = new SetOfFour(i);
	}
}


void draw() {
	for (int i = 0; i < 48; i++) {entities[i].draw();}
}
