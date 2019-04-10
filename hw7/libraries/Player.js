class Player {
	constructor(x, y, velY) {
		this.x = x; this.y = y;
		this.velY = velY;
	}

	draw() {
		fill(255);
		rect(this.x, this.y, 50, 50);
	}

	update() {
		this.velY += 9.81/60;
		this.y += this.velY;
	}
}
