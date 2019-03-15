class Ground {
	public float x, y;
	public Ground(float x, float y) {
		this.x = x; this.y = y;
	}

	public void draw() {
		fill(255);
		rect(x, y, width, 10);
	}
}
