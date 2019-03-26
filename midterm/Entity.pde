class Entity {
	protected float x, y;
	protected boolean alive;
	public ParticleSystem partSys;
	public Entity(float x, float y) {
		this.x = x; this.y = y;
		alive = true;
	}

	public void draw() {}
	public void update() {}
}
