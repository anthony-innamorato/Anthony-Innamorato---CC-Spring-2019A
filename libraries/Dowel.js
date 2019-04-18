class Dowel {
    constructor(x, y, radius){
        this.radius = radius;
        this.body = Bodies.circle(x, y, radius, {isStatic : true});
        World.add(engine.world, this.body);
    }

    show(){
        var pos = this.body.position;
        var angle = this.body.angle;

        push();
        translate(pos.x, pos.y);
        rotate(angle);
        fill(255);
        noStroke();
        circle(0, 0, this.radius * 2);
        pop();
    }
}