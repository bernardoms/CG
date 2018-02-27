//References
//https://processing.org/reference/strokeWeight_.html for line thicknes 
//Convert polar to carteasian
//https://processing.org/examples/polartocartesian.html

void setup(){
  size(530,530);
  int CENTER = height/2;
  stroke(255);
  smooth();
  noFill();
}
void draw(){
  strokeWeight(1);
  background(0);
  ellipse(265,265,525,525);//Creates de Watch circle
  //Draws the second hand
  float theta = TWO_PI * second() / 60.0; // Calculate the current seconds
  PVector endpoint = convertAndTranslate(theta,250.0); // make the convertion pollar to cartesian so we make the hand rotate inside the watch using the theta for seconds. 
  line(265,265,endpoint.x,endpoint.y); // draw the line
  //Draws the minute hand
  strokeWeight(2);
  theta = TWO_PI * minute() /60.0;
  endpoint = convertAndTranslate(theta,150.0); 
  line(265,265,endpoint.x,endpoint.y); // draw the line
  
  //Draws the hour hand
  strokeWeight(4);
  //the hour function returns the time in 23 format so we need to convert to 12 format
  theta = TWO_PI * ((hour() %12 + minute() /60.0)/12.0);
  endpoint = convertAndTranslate(theta,50.0); 
  line(265,265,endpoint.x,endpoint.y); // draw the line
}

//Convert polar to carteasian
PVector convertAndTranslate(float theta, float r){
  theta -= HALF_PI;
  return new PVector(r*cos(theta) * 265, r*sin(theta) * 265);
}