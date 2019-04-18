class PlayerBall {
    constructor(x, y, radius){
        this.radius = radius;
        this.body = Bodies.circle(x, y, radius);
        this.body.restitution = 1;
        World.add(engine.world, this.body);
    }

    show(){
        var pos = this.body.position;
        var angle = this.body.angle;

        push();
        translate(pos.x, pos.y);
        rotate(angle);
        fill(0, 255, 255);
        noStroke();
        circle(0, 0, this.radius * 2);
        pop();
    }

    outOfBounds() {
        var pos = this.body.position;
        if (pos.x > 1920/2 || pos.x < 0 || pos.y > 900) {
            return true;
        }
        return false;
    }

    platformCollision(bodyPos) {
        var pos = this.body.position;
        if (pos.y > bodyPos.y - 15 && pos.y < bodyPos.y + 15) {
            if (pos.x > bodyPos.x - 55 && pos.x < bodyPos.x + 55) {
                return true;
            }
        }
        return false;
    }
}