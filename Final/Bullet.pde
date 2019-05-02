class Bullet {
	float x, y;
	float xVel, yVel;
	Bullet(float x, float y, float xVel, float yVel) {
		this.x = x; this.y = y;
		this.xVel = xVel; this.yVel = yVel;
	}

	void draw() {
		rectMode(CENTER);
		fill(0, 255, 255);
		rect(x, y, 20, 5);
	}

	boolean update() {
		x += xVel;
		y += yVel;
		if (y > height || y < 0
			|| x < 0 || x > width) {
			return true;
		}
		return false;
	}
}
