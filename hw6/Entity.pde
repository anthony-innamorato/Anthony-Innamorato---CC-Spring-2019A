class Entity {
	protected float x, y;
	protected float velY;

	public Entity(float x, float y, float velY) {
		this.x = x; this.y = y;
		this.velY = velY;
	}
	public void draw() {}
 	public void update() {
		velY += 9.81/60;
		y += velY;
	}
}
