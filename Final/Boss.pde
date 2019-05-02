class Boss extends Entity {
	int angle = 0;
	float xVel, yVel = 0;
	Boss(float x, float y, PImage sprite) {
		super(x, y, sprite, 50);
	}

	void draw() {
		//calling super's draw b/c entity draw handles all sprite drawings
		super.draw();
		//draw health at top
		rectMode(CORNER);
		fill(255, 0, 0);
		//+10 to x because 1920 is not evenly divisible by 50
		if (health > 0) {
			rect((width%this.origHealth)/2, 0,
			     (width/this.origHealth) * this.health, 25);
		}
	}

	void update() {
		//set new random point to travel to
		if (frameCount%60 == 0) {
			float randX = random(width*.66, width - imgWidth/2);
			float randY = random(0 + imgHeight/2, height - imgHeight/2);

			xVel = (x - randX) * -.01;
			yVel = (y - randY) * -.01;
		}
		x += xVel; y += yVel;
	}
}
