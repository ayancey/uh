float xspeed = 1;
float yspeed = 1;

PVector location = new PVector(100,100);

boolean left;
boolean old;

boolean down;
boolean olddown;

boolean done;

float accelx = 1.01;
float accely = 1.01;

void setup() {
  size(1920, 1080);
  stroke(255,255,255);
  background(0);
  frameRate(60);
  textSize(32);
  ellipseMode(RADIUS);
}
void draw(){
  // Clears screen to black
  background(0);
  // Draws framerate
  textAlign(CENTER);
  text(mouseX + " - " + mouseY,200,25);
  text(location.x + " - " + location.y,800,25);
  text((mouseX - location.x) + " - " + (mouseY - location.y),1200,25);
  text(floor(((xspeed * 60) / 1920) * 100) + "%",1850,25);
  ellipse(location.x,location.y,10,10);
  
  //checkedge();
  if (done == true) {
   
  } else {
    checkmouse();
  }
  //checkmouse();
}

void checkmouse(){
  xspeed = xspeed * 1.01;
  accelx = accelx / 1.00001;
  stroke(0,0,255);
  line(location.x, location.y, location.x += floor(xspeed), location.y += floor(yspeed));
  noStroke();
  
  if (location.x < mouseX) {
     location.x += floor(xspeed);
  } else {
     location.x += (floor(xspeed) * -1);
  }

  yspeed = yspeed * 1.01;
  accely = accely / 1.00001;
  if (location.y < mouseY) {
     location.y += floor(yspeed);
  } else {
     location.y += (floor(yspeed) * -1);
  }
 
  
  if ((mouseX - location.x) < 10 && (mouseX - location.x) > -10) {
    if ((mouseY - location.y) < 10 && (mouseY - location.y) > -10) {
      done = true;
    }
  }
}

void checkedge(){
  if (location.x >= 1920) {
    xspeed = xspeed * -1.01;
  }
  if (location.x <= 0) {
    xspeed = xspeed * -1.01;
  }
  if (location.y >= 1080) {
    yspeed = yspeed * -1.01;
  }
  if (location.y <= 0) {
    yspeed = yspeed * -1.01;
  }
}
