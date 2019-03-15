class Particle {
	float x, y, velY;
	float timeLeft;
	public Particle (float x, float y, float velY) {
		this.x = x; this.y = y; this.velY = velY;
		timeLeft = 255.0;
	}
	public void update() {
		timeLeft -= 20;
		velY += 9.81/60;
		y += velY;
	}

	public void draw() {
		fill(100, 230, 255, timeLeft);
		ellipse(x, y, 10, 10);
	}
}
