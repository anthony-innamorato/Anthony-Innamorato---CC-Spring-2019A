class Entity {
	float x, y;
	float imgWidth, imgHeight;
	PImage sprite;
	int health, origHealth;
	Entity(float x, float y, PImage sprite, int health) {
		this.x = x; this.y = y;
		this.sprite = sprite;
		this.imgWidth = sprite.width;
		this.imgHeight = sprite.height;
		this.health = health; this.origHealth = health;
	}

	void draw() {
		image(sprite, x, y);
	}

	void update() {
		;
	}
}
