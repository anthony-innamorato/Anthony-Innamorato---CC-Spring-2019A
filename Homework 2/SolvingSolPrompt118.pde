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
	size(1400, 700);

	for (int i = 0; i < 5; i++) {
		for (int j = 0; j < 10; j++) {
			float x = random(140*j, 140*(j+1));
			float y = random(140*i, 140*(i+1));
			int[] colors = {(int)random(256), (int)random(256), (int)random(256)};
			circles[(i*10)+j] = new Circle(x, y, colors);
		}
	}


	for (int i = 0; i < 50; i++) {
		fill(circles[i]._colors[0], circles[i]._colors[1], circles[i]._colors[2]);
		stroke(255);
		strokeWeight(2);
		circle(circles[i]._x, circles[i]._y, 40);
		stroke(circles[i]._colors[0], circles[i]._colors[1], circles[i]._colors[2]);
		for (int j = i+1; j < 50; j++) {
			strokeWeight(2);
			line(circles[i]._x, circles[i]._y, circles[j]._x, circles[j]._y);
		}
	}

}
