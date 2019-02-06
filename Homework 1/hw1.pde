void setup() {
  
  size(550, 850);
  background(231, 230, 226);
  noStroke();
  
  //shape a
  fill(54, 40, 66);
  quad(250, 20, 430, 50, 330, 250, 150, 220);
  
  //shape b
  fill(193, 149, 2);
  quad(250, 500, 370, 505, 330, 652, 260, 650);
  
  //shape c
  fill(43, 41, 138);
  quad(80, 600, 430, 630, 430, 650, 80, 620);
  
  //shape d
  fill(20, 20, 20);
  rect(110, 570, 100, 100);
  
  //shape e
  quad(172, 720, 250, 670, 274, 710, 195, 760);
  
  //shape f
  fill(198, 31, 23);
  quad(250, 735, 300, 730, 302, 751, 252, 756);
  
  //shape g
  quad(285, 760, 350, 762, 351, 770, 285, 767);
  
  //shape h
  fill(46, 134, 86);
  circle(310, 782, 23);
  
  //setup the grainy texture to give more natural appearance
  PImage img = loadImage("grain.jpg");
  tint(255, 50);
  image(img, 0, 0);
}
