class Platform{
    constructor(x, y, w, h, col){
        this.w = w; this.h = h;
        this.col = new MyColor(col);
        this.body = Bodies.rectangle(x, y, w, h, {isStatic : true});
        World.add(engine.world, this.body);
    }

    show(){
        //notice how I need only one field for all my info!
        var pos = this.body.position;
        var angle = this.body.angle;

        //draw the rectangle according to the body data
        push();
        translate(pos.x, pos.y);
        rotate(angle);
        rectMode(CENTER);
        fill(this.col.r, this.col.g, this.col.b);
        noStroke();
        rect(0, 0, this.w, this.h);
        pop();
    }
}