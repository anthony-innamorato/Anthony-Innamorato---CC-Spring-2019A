class Bullet extends Entity{
	private float yVel;
	private int framesToWait;
	private boolean isPlayerBull = false;
	public Bullet(float x, float y, boolean isPlayerBull) {
		super(x, y);
		framesToWait = 0;
		this.isPlayerBull = isPlayerBull;
	}

	public Bullet(float x, float y, int framesToWait) {
		super(x, y);
		this.framesToWait = framesToWait;
		this.yVel = 0;
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
		//TODO CHANGE YVEL
		if (isPlayerBull) y -= 10;
		else {
			yVel += 9.81/60;
			y += yVel;
		}
	}
}
