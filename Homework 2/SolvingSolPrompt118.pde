Circle[] circles = new Circle[50];

class Circle {
	float _x, _y;
	int[] _colors;
	Circle (float x, float y, int[] colors) {
		_x = x; _y = y;
		_colors = colors;
	}
}

void setup() {

	background(0, 0, 0);
	size(1440, 740);

	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 10; j++) {
			float x = random(140*j + 20, 140*(j+1));
			float y = random(140*i + 20, 140*(i+1));
			int[] colors = {(int)random(256), (int)random(256), (int)random(256)};
			circles[(i*10)+j] = new Circle(x, y, colors);
		}
	}


	for (int i = 0; i < 50; i++) {
		fill(0);
		stroke(circles[i]._colors[0], circles[i]._colors[1], circles[i]._colors[2]);
		strokeWeight(4);
		circle(circles[i]._x, circles[i]._y, 40);
		stroke(circles[i]._colors[0], circles[i]._colors[1], circles[i]._colors[2]);
		strokeWeight(2);
		if (i+3 < 50) {
			for (int j = i+1; j < i+4; j++) {
				line(circles[i]._x, circles[i]._y, circles[j]._x, circles[j]._y);
			}
		}

	}

}
