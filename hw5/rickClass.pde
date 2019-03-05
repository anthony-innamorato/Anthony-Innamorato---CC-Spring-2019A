class Rick {
	float angle, scale, scaleStep;
	Rick() {
		angle = 0; scale = 1;
		scaleStep = .005;
	}

	private void draw() {
		pushMatrix();
		angle += 2; angle %= 360;
		scale += scaleStep;
		if (scale > 1.5) scaleStep *= -1;
		else if (scale < .1) scaleStep *= -1;
		//translate(379, 212);
		//rotate(radians(angle));
		scale(scale);
		drawHair();
		drawFace();
		drawEyes();
		popMatrix();
	}

	private void drawHair() {
		beginShape();
			vertex(335, 333);
			vertex(315, 340);
			vertex(317, 323);
			vertex(279, 326);
			vertex(297, 287);
			vertex(252, 271);
			vertex(294, 247);
			vertex(236, 209);
			vertex(289, 190);
			vertex(243, 118);
			vertex(318, 127);
			vertex(304, 48);
			vertex(381, 94);
			vertex(444, 31);
			vertex(446, 119);
			vertex(531, 103);
			vertex(475, 180);
			vertex(522, 204);
			vertex(469, 232);
			vertex(500, 262);
			vertex(458, 279);
			vertex(481, 323);
			vertex(441, 318);
			vertex(446, 338);
			vertex(420, 330);
		endShape(CLOSE);
	}

	private void drawFace() {
		ellipseMode(CENTER);
		ellipse(381, 224, 154, 239);
	}

	private void drawEyes() {
		circle(346, 203, 50);
		circle(420, 206, 50);
	}
}
