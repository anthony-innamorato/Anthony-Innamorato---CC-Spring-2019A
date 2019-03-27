class Particle {
	float x, y, velY, velX;
	float timeLeft;
	public Particle (float x, float y, float velX) {
		this.x = x; this.y = y; velY = 0;
		this.velX = velX;
		timeLeft = 255.0;
	}
	public void update() {
		Entity p1 = entities.get(0);
		if (dist(x, y, p1.x, p1.y) < 20) playerLost = true;
		x += velX;
		timeLeft -= .5;
		velY += 9.81/60;
		y += velY;
	}

	public void draw() {
		fill(0, timeLeft);
		ellipse(x, y, 10, 10);
	}
}
