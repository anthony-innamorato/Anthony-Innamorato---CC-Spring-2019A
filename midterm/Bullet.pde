class Bullet extends Entity{
	private int yDir;
	private int framesToWait;
	public Bullet(float x, float y, int yDir) {
		super(x, y);
		this.yDir = yDir;
		framesToWait = 0;
	}

	public Bullet(float x, float y, int yDir, int framesToWait) {
		super(x, y);
		this.yDir = yDir;
		this.framesToWait = framesToWait;
	}

	public void draw() {
		fill(0);
		rect(x, y, 5, 20);
	}

	public void draw(MyColor curr) {
		fill(curr.r, curr.g, curr.b);
		rect(x, y, 5, 20);
	}

	public void update() {
		if (framesToWait != 0) {
			framesToWait--;
			return;
		}
		y += 10 * yDir;
	}
}
