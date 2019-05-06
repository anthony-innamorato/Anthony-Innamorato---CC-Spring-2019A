class EnemyBullet {
	float x, y;
	float xVel, yVel;
	EnemyBullet(float x, float y) {
		this.x = x; this.y = y;
		this.xVel = -15; this.yVel = 0;
	}

	void draw() {
		rectMode(CENTER);
		fill(0, 255, 255);
		circle(x, y, 10);
	}

	boolean update() {
		x += xVel; y += yVel;
		if (x < 0 || x > width) {
			return true;
		}
		return false;
	}
}
