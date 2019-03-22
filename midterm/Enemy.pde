class Enemy extends Entity {
	protected int health, colorInd;
	protected int ySpeedStep;
	public Enemy(float x, float y, int fill) {
		super(x, y);
		colorInd = fill;
		health = 0;
		ySpeedStep = 1;
	}

	public void draw() {
		if (colorInd == 0) fill(255 - health, 0, 0);
		else if (colorInd == 1) fill(0, 255 - health, 0);
		else fill(0, 0, 255 - health);
		rect(x, y, 200, 200);
	}

	public void update() {
		if (frameCount%(60/ySpeedStep) == 0) y += 10;
		if (frameCount%500 == 0) ySpeedStep++;
	}
}
