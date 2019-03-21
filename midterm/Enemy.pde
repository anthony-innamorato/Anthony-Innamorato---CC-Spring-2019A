class Enemy extends Entity {
	public Enemy(float x, float y, int fill) {
		super(x, y, fill);
	}

	public void draw() {
		if (colorInd == 0) fill(255, 0, 0);
		else if (colorInd == 1) fill(0, 255, 0);
		else fill(0, 0, 255);
		rect(x, y, 200, 200);
	}

	public void update() {
		if (frameCount%120 == 0) y += 10;
	}
}
