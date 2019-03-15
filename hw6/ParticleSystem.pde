class ParticleSystem {
	public float x, y;
	ArrayList<Particle> particles;
	public ParticleSystem(float x, float y) {
		this.x = x; this.y = y;
		particles = new ArrayList<Particle>();
	}

	public void add(int ind) {
		float currX = x - 20;
		currX += 5 * ind;
		particles.add(new Particle(currX, y, 0));
	}

	public void run() {
		for (Particle p : particles) {
			p.update();
			p.draw();
		}
	}
}
