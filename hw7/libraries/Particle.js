class Particle {
	constructor(x, y, velY) {
		this.x = x; this.y = y; this.velY = velY;
		this.timeLeft = 255.0;
	}
	update() {
		this.timeLeft -= 20;
		this.velY += 9.81/60;
		this.y += this.velY;
	}

	draw() {
		fill(100, 230, 255, this.timeLeft);
		ellipse(this.x, this.y, 10, 10);
	}
}
