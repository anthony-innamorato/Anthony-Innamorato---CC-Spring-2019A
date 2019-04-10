var entities;
var g;
var pS;

function setup() {
	createCanvas(1280, 780);
	background(0);
	entities = [];

	//init player
	let initX = width/2;
	let initY = .75 * height - 30;
	entities.push(new Player(initX, initY, 0));
	//init ground
	g = new Ground(width/2, .75 * height);
	pS = new ParticleSystem(initX, initY);

	fill(255);
	rectMode(CENTER);
}


function draw() {
	background(0);
	g.draw();
	for (let i = 0; i < entities.length; i++) {
		entities[i].update();
		entities[i].draw();
	}
	pS.run();
	pS.x = entities[0].x;
	pS.y = entities[0].y;
	groundCollision();
	input();
}

function groundCollision() {
	if (entities[0].y > g.y - 30) {
		entities[0].y -= .2;
		entities[0].velY = 0;
	}
}

function input() {
	let p1 = entities[0];
	if (keyIsPressed && key == 'w') {
		p1.velY = -5;
		for (let i = 0; i < 9; i++) {
			pS.add(i);
		}
	}
	if (keyIsPressed) {
		if (key == 'a') p1.x -= 10;
		if (key == 'd') p1.x += 10;
	}
}
