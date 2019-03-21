class Player extends Entity {
	public Player(float x, float y, int colorInd) {
		super(x, y, colorInd);
	}

	public void draw() {
		fill(255);
		rect(x, y, 30, 30);
	}
}
