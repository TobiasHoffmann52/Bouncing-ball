float rad = 60;  // Radius af cirkel
float xpos, ypos;  // Start position  

float xspeed = 3;  // Hastighed på x-akse
float yspeed = 2.5;  // Hastighed på y-akse

int xdirection = 1;  // Venstre eller Højre
int ydirection = 1;  // Opad eller Nedad

float c = 250;  // Bredde af firkant 
float d = 250;  // Højde af firkant
int e = 0;  // Tal der symboliserer koordinaterne for venstre og øverste kant i firkanten


void setup() 
{
  size(500, 500);
  noStroke();  // Ingen kanter på figurer
  frameRate(30);
  ellipseMode(RADIUS);  // Firkanten bliver tegnet ud fra midten
  xpos = width/2;  // Starter cirklen i midten på x-aksen
  ypos = height/2;  // Starter cirklen i midten på y-aksen
}


void draw() 
{
  background(0);
  
  rectMode(RADIUS);
  fill(100);
  rect(250, 250, c, d);
  
  // Firkanten bliver mindre
  c = c - 1;
  d = d - 1;
  e = e + 1;
  
  // Radius af cirkel bliver mindre
  rad = rad - 0.25;
  
  // Opdater positionen af cirklen
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Tjekker om cirklen har ramt væggene
  if (xpos > c + 250 - rad) {
    xdirection *= -1;
    xpos = xpos - 2;
  }
  if (e > xpos-rad) {
    xdirection *= -1;
    xpos = xpos + 2;
  }
  if (ypos > d + 250 - rad) {
    ydirection *= -1;
    ypos = ypos - 2;
  }
  if (e > ypos-rad) {
    ydirection *= -1;
    ypos = ypos + 2;
  }
  
  // Starter forfra når firkanten er nået midten
  if (e >= 250) {
    c = 250;
    d = 250;
    e = 0;
    rad = 60;
  }

  // Tegner en hvid cirkel
  fill(255);
  ellipse(xpos, ypos, rad, rad);
}
