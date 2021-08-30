int rad = 60;        // Bredde
float xpos, ypos;    // Start position  

float xspeed = 2.8;  // Hastighed på x-akse
float yspeed = 2.2;  // Hastighed på y-akse

int xdirection = 1;  // Venstre eller Højre
int ydirection = 1;  // Toppen eller Bunden

int c = 500;
int d = 500;


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
  
  rectMode(CENTER);
  fill(100);
  rect(250, 250, c, d);
  
  c = c - 1;
  d = d - 1;
  
  // Opdater positionen af cirklen
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Tjekker om cirklen har ramt væggene
  // If it does, reverse its direction by multiplying by -1
  if (xpos > c-rad || c < rad) {
    xdirection *= -1;
  }
  if (ypos > d-rad || d < rad) {
    ydirection *= -1;
  }

  // Draw the shape
  fill(255);
  ellipse(xpos, ypos, rad, rad);
}
