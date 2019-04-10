class ParticleSystem {
	constructor(x, y) {
		this.x = x; this.y = y;
		this.particles = [];
	}

	add(ind) {
		let currX = this.x - 20;
		currX += 5 * ind;
		this.particles.push(new Particle(currX, this.y, 0));
	}

	run() {
		for (let i = 0; i < this.particles.length; i++) {
			this.particles[i].update();
			this.particles[i].draw();
		}
	}
}
