class EnemyBullet {
	float x, y;
	float xVel;
	EnemyBullet(float x, float y) {
		this.x = x; this.y = y;
		this.xVel = -15;
	}

	void draw() {
		rectMode(CENTER);
		fill(0, 255, 255);
		circle(x, y, 10);
	}

	boolean update() {
		x += xVel;
		if (x < 0 || x > width) {
			return true;
		}
		return false;
	}
}
