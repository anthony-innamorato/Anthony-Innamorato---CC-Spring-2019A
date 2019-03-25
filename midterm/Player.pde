class Player extends Entity {
	public Player(float x, float y) {
		super(x, y);
	}

	public void draw() {
		fill(0);
		rect(x, y, 30, 30);
	}
}
