class Ground {
	constructor(x, y) {
		this.x = x; this.y = y;
	}

	draw() {
		fill(255);
		rect(this.x, this.y, width, 10);
	}
}
