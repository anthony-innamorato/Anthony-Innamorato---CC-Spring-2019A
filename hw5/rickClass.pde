//I used GIMP to get these measurements right

class Rick {
	private int x, xVel;
	private PImage lowerBrow, irregular;
	Rick() {
		x = 0; xVel = 1;
		lowerBrow = loadImage("lowerBrow.png");
		irregular = loadImage("irregular.png");
	}

	void draw() {
		x += xVel;
		if (boundsCheck()) xVel *= -1;
		drawHair();
		drawFace();
		drawEyes();
		drawEyebrows();
		drawEyeBags();
		drawNose();
		drawMouthLines();
		drawIrregularMouthShape();
	}

	boolean boundsCheck() {
		if (x + 525 > 768 || x + 250 < 0) return true;
		return false;
	}

	private void drawHair() {
		fill(164, 218, 246);
		beginShape();
			vertex(335+x, 333);
			vertex(315+x, 340);
			vertex(317+x, 323);
			vertex(279+x, 326);
			vertex(297+x, 287);
			vertex(252+x, 271);
			vertex(294+x, 247);
			vertex(236+x, 209);
			vertex(289+x, 190);
			vertex(243+x, 118);
			vertex(318+x, 127);
			vertex(304+x, 48);
			vertex(381+x, 94);
			vertex(444+x, 31);
			vertex(446+x, 119);
			vertex(531+x, 103);
			vertex(475+x, 180);
			vertex(522+x, 204);
			vertex(469+x, 232);
			vertex(500+x, 262);
			vertex(458+x, 279);
			vertex(481+x, 323);
			vertex(441+x, 318);
			vertex(446+x, 338);
			vertex(420+x, 330);
		endShape(CLOSE);
	}

	private void drawFace() {
		fill(219, 210, 201);
		ellipseMode(CENTER);
		ellipse(381+x, 224, 154, 239);
	}

	private void drawEyes() {
		fill(255);
		//left eye drawn first
		//outer eye
		circle(346+x, 203, 50);
		//eyelid
		line(322+x, 197, 370+x, 198);
		//pupil
		fill(0);
		circle(341+x, 200, 6);
		fill(255);

		//other eye
		circle(420+x, 206, 50);
		line(397+x, 198, 443+x, 200);
		fill(0);
		circle(421+x, 202, 6);
		fill(255);

		//remove some portions of circle
		fill(219, 210, 201);
		noStroke();
		rect(327+x, 170, 40, 15);

		rect(407+x, 172, 32, 15);
		stroke(0);

	}

	private void drawEyebrows() {
		//upper brows
		curve(352+x, 144, 364+x, 146, 394+x, 143, 409+x, 138);
		curve(341+x, 152, 351+x, 155, 379+x, 154, 402+x, 147);
		curve(364+x, 161, 379+x, 154, 405+x, 151, 428+x, 154);

		//lower brow
		image(lowerBrow, 314+x, 160);
	}

	private void drawEyeBags() {
		curve(311+x, 204, 316+x, 232, 363+x, 236, 381+x, 201);
		curve(382+x, 208, 396+x, 238, 441+x, 237, 459+x, 207);
	}

	private void drawNose() {
		beginShape();
			curveVertex(371+x, 210);
			curveVertex(370+x, 229);
			curveVertex(369+x, 250);
			curveVertex(377+x, 257);
			curveVertex(389+x, 250);
			curveVertex(389+x, 230);
			curveVertex(389+x, 209);
		endShape();
	}

	private void drawMouthLines() {
		curve(350+x, 259, 329+x, 281, 335+x, 299, 370+x, 304);
		curve(391+x, 301, 427+x, 299, 436+x, 285, 430+x, 263);

		//mouth
		beginShape();
			curveVertex(313+x, 308);
			curveVertex(339+x, 289);
			curveVertex(358+x, 283);
			curveVertex(385+x, 279);
			curveVertex(405+x, 282);
			curveVertex(422+x, 289);
			curveVertex(449+x, 311);
		endShape();
	}

	private void drawIrregularMouthShape() {
		image(irregular, 355+x, 278);
	}
}
