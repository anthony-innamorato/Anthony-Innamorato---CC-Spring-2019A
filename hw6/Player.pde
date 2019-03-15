class Player extends Entity {
	public Player(float x, float y, float velY) {
		super(x, y, velY);
	}

	public void draw() {
		fill(255);
		rect(x, y, 50, 50);
	}
}
