class Enemy extends Entity {
	protected int ySpeedStep;
	public Bullet bull;
	private int row, col;
	private MyColor currColor;
	public Enemy(float x, float y, int row, int col) {
		super(x, y);
		ySpeedStep = 1;
		this.row = row; this.col = col;
		if (row != 0) bull = new Bullet(x, y + 102.5, 1, int(random(60)));
		currColor = new MyColor(255, 0, 0);
	}

	public void draw() {
		fill(currColor.r, currColor.g, currColor.b);
		rect(x, y, 200, 200);
		if (bull != null && bull.framesToWait == 0) bull.draw(currColor);
	}

	public void update() {
		if (frameCount%(60/ySpeedStep) == 0) y += 10;
		if (frameCount%500 == 0) ySpeedStep++;
		Entity p1 = entities.get(0);
		//if null
		if (bull == null) {
			//create bull
			if (row == 0) {
				if (!entities.get(13+col).alive) bull = new Bullet(x, y + 102.5, 1);
			}
			else bull = new Bullet(x, y + 102.5, 1);
		}
		//if oob or hit player
		else if (bull.y > height) bull = null;
		else if (bull.x > p1.x - 15 && bull.x < p1.x + 15) {
			if (bull.y > p1.y - 15 && bull.y < p1.y + 15) {
				playerLost = true;
			}
		}
		if (bull != null) bull.update();
		for (int i = 0; i < 50; i++) currColor.refreshColor();
	}
}
