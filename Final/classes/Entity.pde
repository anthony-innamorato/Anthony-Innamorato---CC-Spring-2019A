class Entity {
	float x, y;
	PImage sprite;
	Entity(float x, float y, PImage sprite) {
		this.x = x; this.y = y;
		this.sprite = sprite;
	}

	void draw() {
		image(sprite, x, y);
	}
}
