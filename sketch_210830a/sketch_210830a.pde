float rad = 60;        // Bredde
float xpos, ypos;    // Start position  

float xspeed = 3;  // Hastighed på x-akse
float yspeed = 2.5;  // Hastighed på y-akse

int xdirection = 1;  // Venstre eller Højre
int ydirection = 1;  // Toppen eller Bunden

int c = 250;
int d = 250;
int e = 0;


void setup() 
{
  size(500, 500);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(0);
  
  rectMode(RADIUS);
  fill(100);
  rect(250, 250, c, d);
  
  c = c - 1;
  d = d - 1;
  e = e + 1;
  
  // Radius af cirkel bliver mindre
  rad = rad - 0.25;
  
  // Opdater positionen af cirklen
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Tjekker om cirklen har ramt væggene
  if (xpos > c + 250 - rad || e > xpos-rad) {
    xdirection *= -1;
  }
  if (ypos > d + 250 - rad || e > ypos-rad) {
    ydirection *= -1;
  }
  
  if (e >= 250) {
    c = 250;
    d = 250;
    e = 0;
    rad = 60;
  }

println(e);
  // Tegner en hvid cirkel
  fill(255);
  ellipse(xpos, ypos, rad, rad);
}
