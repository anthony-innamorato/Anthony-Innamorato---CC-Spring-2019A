var Engine = Matter.Engine;
var World = Matter.World;
var Bodies = Matter.Bodies;

var engine = Engine.create();
var world = engine.world;
var platforms = [];
var portals = [];
var dowels = [];
var balls = [];
var img;




function setup() {
	createCanvas(1920/2, 900);
	img = loadImage("assets/aperture.jpg");

	//create platforms
	for (let i = 0; i < 3; i++) {
		let color = [0, 0, 0];
		color[i] = 255;
		platforms.push(new Platform(320 * i + 160, 850, 100, 20, color));
	}

	//create portals
	for (let i = 0; i < 3; i+=2) {
		let color = [0, 0, 0];
		color[i] = 255;
		portals.push(new Platform(860 * (i/2) + 50, 100, 20, 100, color))
		//forgive me for this lmao
		if (i === 0) {
			color = [0, 255, 0];
			portals.push(new Platform(1920/4, 20, 100, 20, color))
		}
	}


	//handling first and third rows
	for (let i = 0; i < 2; i++) {
		for (let j = 0; j < 5; j++) {
			dowels.push(new Dowel(182 * j + 110, 300 * i + 200, 35));
		}
	}
	//handling the second and fourth rows
	for (let i = 0; i < 2; i++) {
		for (let j = 0; j < 4; j++) {
			dowels.push(new Dowel(182 * j + 200, 300 * i + 350, 35));
		}
	}


	Engine.run(engine);
}

function draw() {
	image(img, -240, 0);
	for (let i = 0; i < platforms.length; i++) {
		platforms[i].show();
	}
	for (let i = 0; i < portals.length; i++) {
		portals[i].show();
	}
	for (let i = 0; i < dowels.length; i++) {
		dowels[i].show();
	}
	for (let i = 0; i < balls.length; i++) {
		balls[i].show();
		if (balls[i].outOfBounds()) {
			World.remove(world, balls[i].body);
			balls.splice(i, 1);
			continue;
		}
		for (let j = 0; j < platforms.length; j++) {
			if (balls[i].platformCollision(platforms[j].body.position)) {
				//collision with either red or blue platform
				//invert velocity vector and translate to corresponding portal
				if (j != 1) {
					let prevVel = balls[i].body.velocity;
					let newVel = Matter.Vector.create(prevVel.y * -1, prevVel.x);
					Matter.Body.setVelocity(balls[i].body, newVel);
				}

				let portalPos = portals[j].body.position;
				let xOffset = 15;
				if (j === 2) xOffset = -15;
				let yOffset = 0;
				if (j === 1) {
					xOffset = 0; yOffset = 15;
				}
				console.log(yOffset);
				let newPos = Matter.Vector.create(portalPos.x + xOffset, portalPos.y + yOffset);
				Matter.Body.setPosition(balls[i].body, newPos);
				//console.log(newPos.x, newPos.y);
			}
		}

	}
}

function mouseDragged() {
	balls.push(new PlayerBall(mouseX, mouseY, 5));
}
