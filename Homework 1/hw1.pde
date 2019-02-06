// this processing file will attempt to recreate the artwork:
// "Painterly Realism of a Football Player – Color Masses in the 4th Dimension"
// by Kazimir Malevich

// grain.jpg (present in repo) IS REQUIRED to be in same directory as .pde to work correctly
// quads predominately used b/c dimensions in original work are not exact

void setup() {
  
  size(550, 850);
  background(231, 230, 226);
  noStroke();
  
  //shape a (dark purple rhombus at top)
  fill(54, 40, 66);
  quad(250, 20, 430, 50, 330, 250, 150, 220);
  
  //shape b (dark yellow quad lower portion of page)
  fill(193, 149, 2);
  quad(250, 500, 370, 505, 330, 652, 260, 650);
  
  //shape c (blue rectangle spanning bottom third of page)
  fill(43, 41, 138);
  quad(80, 600, 430, 630, 430, 650, 80, 620);
  
  //shape d (black square in left bottom third)
  fill(20, 20, 20);
  rect(110, 570, 100, 100);
  
  //shape e (black sideways rectangle)
  quad(172, 720, 250, 670, 274, 710, 195, 760);
  
  //shape f (thicker red rect)
  fill(198, 31, 23);
  quad(250, 735, 300, 730, 302, 751, 252, 756);
  
  //shape g (thinner red rect)
  quad(285, 760, 350, 762, 351, 770, 285, 767);
  
  //shape h (green circle at bottom)
  fill(46, 134, 86);
  circle(310, 782, 23);
  
  //setup the grainy texture to give more natural appearance
  PImage img = loadImage("grain.jpg");
  tint(255, 50);
  image(img, 0, 0);
}
