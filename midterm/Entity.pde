class Entity {
	protected float x, y;
	protected int colorInd;
	public Entity(float x, float y, int colorInd) {
		this.x = x; this.y = y;
		this.colorInd = colorInd;

	}

	public void draw() {}
	public void update() {}
}
