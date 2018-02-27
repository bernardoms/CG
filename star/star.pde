//Set the initial setup for draw images

void setup(){
  //Set the sketch size
  size(800,640);
}

void draw(){
  drawStar();
  endShape(CLOSE);
}
void drawStar(){
  float angle = TWO_PI / 5; // calculate the pieces for divide the circle based on the number of points recived, star have 5 points
  float halfAngle = angle/2.0; // For the shape of the stars we need to calculate the half of the angle for draw the other star part
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {// TWO_PI = all the circle
    float sx = width/2 + cos(a) * 30; //width/2 says to draw the star in the center
    float sy = height/2 + sin(a) * 30;//height/2 says to draw the star in the center
    vertex(sx, sy);
    vertex(sx, sy);
    vertex(sx, sy);
    vertex(sx, sy);
    vertex(sx, sy);
    //Draws the others "side" of the star
    //
    sx = width/2 + cos(a+halfAngle) * 50; 
    sy = height/2 + sin(a+halfAngle) * 50;
    vertex(sx, sy);
  }
}