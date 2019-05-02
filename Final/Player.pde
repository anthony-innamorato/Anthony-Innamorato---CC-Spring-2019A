class Player extends Entity {
	Player(float x, float y, PImage sprite) {
		super(x, y, sprite, 5);
	}


	void draw() {
		//calling super's draw b/c entity draw handles all sprite drawings
		super.draw();
		//draw health at top
		rectMode(CORNER);
		fill(0, 255, 0);
		//+10 to x because 1920 is not evenly divisible by 50
		rect((width%origHealth)/2, height-50, (width/origHealth) * health, 25);
	}
}
