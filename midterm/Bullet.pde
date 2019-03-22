class Bullet extends Entity{
	public Bullet(float x, float y) {
		super(x, y);
	}

	public void draw() {
		fill(255);
		rect(x, y, 5, 20);
	}

	public void update() {
		y-=10;
	}
}
