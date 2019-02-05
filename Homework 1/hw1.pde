//this processing file will attempt to recreate "Painterly Realism of a Football Player – Color Masses in the 4th Dimension" by Kazimir Malevich

void setup() {
  
  size(550, 850);
  background(#EAEAEA);
  noStroke();
  
  //shape a
  fill(46, 7, 39);
  quad(250, 20, 430, 50, 330, 250, 150, 220);
  
  //shape b
  fill(255, 243, 0);
  quad(250, 500, 370, 505, 330, 652, 260, 650);
  
  //shape c
  fill(21, 0, 116);
  quad(80, 600, 430, 630, 430, 650, 80, 620);
  
  //shape d
  fill(20, 20, 20);
  rect(110, 570, 100, 100);
  
  //shape e
  quad(172, 720, 250, 670, 274, 710, 195, 760);
  
  //shape f
  fill(255, 0, 0);
  quad(250, 735, 300, 730, 302, 751, 252, 756);
  
  //shape g
  quad(285, 760, 350, 762, 351, 770, 285, 767);
  
  //shape h
  fill(17, 139, 75);
  circle(310, 786, 25);
}
