class ParticleSystem {
	public float x, y;
	ArrayList<Particle> particles;
	public ParticleSystem(float x, float y) {
		this.x = x; this.y = y;
		particles = new ArrayList<Particle>();
		for (int i = 0; i < 5; i++) {
			add(-2 + i);
		}
	}

	public void add(float velX) {
		particles.add(new Particle(x, y, velX));
	}

	public void run() {
		for (Particle p : particles) {
			p.update();
			p.draw();
		}
	}
}
