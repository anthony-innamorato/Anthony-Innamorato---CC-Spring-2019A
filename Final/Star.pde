class Star {
	float x, y;
	PImage sprite;
	Star(float x, float y, PImage sprite) {
		this.x = x; this.y = y;
		this.sprite = sprite;
	}

	void draw() {
		image(sprite, x, y);
	}

	void update() {
		x--;
		//if on left side of screen, reset to the right side
		if (x < -100) x = width + 100;
	}
}
