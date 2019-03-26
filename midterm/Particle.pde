class Particle {
	float x, y, velY, velX;
	float timeLeft;
	public Particle (float x, float y, float velX) {
		this.x = x; this.y = y; velY = 0;
		this.velX = velX;
		timeLeft = 255.0;
	}
	public void update() {
		x += velX;
		timeLeft -= 20;
		velY += 9.81/60;
		y += velY;
	}

	public void draw() {
		fill(0, 0, 0, timeLeft);
		ellipse(x, y, 10, 10);
	}
}
