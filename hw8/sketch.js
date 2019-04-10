var circles = [];

function setup() {
	createCanvas(1440, 740);
	background(0, 0, 0);

	for (let i = 0; i < 5; i++) {
		for (let j = 0; j < 10; j++) {
			let x = random(140*j + 20, 140*(j+1));
			let y = random(140*i + 20, 140*(i+1));
			let colors = [int(random(256)), int(random(256)), int(random(256))];
			circles[(i*10)+j] = new Circle(x, y, colors);
		}
	}


	for (let i = 0; i < 50; i++) {
		fill(0);
		stroke(circles[i].colors[0], circles[i].colors[1], circles[i].colors[2]);
		strokeWeight(4);
		circle(circles[i].x, circles[i].y, 40);
		stroke(circles[i].colors[0], circles[i].colors[1], circles[i].colors[2]);
		strokeWeight(2);
		if (i+3 < 50) {
			for (let j = i+1; j < i+4; j++) {
				line(circles[i].x, circles[i].y, circles[j].x, circles[j].y);
			}
		}

	}

}
