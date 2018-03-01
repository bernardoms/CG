//References
//https://processing.org/reference/strokeWeight_.html for line thicknes 
//Convert polar to carteasian
//https://processing.org/examples/polartocartesian.html

void setup(){
  size(400,400);
  //int CENTER = height/2;
 
  stroke(255);
  smooth();
  noFill();
}
void draw(){
  translate(width/2,height/2);
 
  strokeWeight(1);
  background(0);
  ellipse(0,0,400,400);//Creates de Watch circle
  
  //Draws clock numbers
  float rText = 180;
  textAlign(CENTER,CENTER);
  for(int i = 0; i < 12; i++){
      String texto = "" + i;
      if(i == 0){
           texto = "12";
      }
      float angulo = map(i,0,12,0,TWO_PI) - HALF_PI;
      text(texto,rText*cos(angulo),rText*sin(angulo));
  }
  
  //Draws the second hand
  float thetas = map(second(),0,60,0,TWO_PI) - HALF_PI;
  line(0,0,cos(thetas) * 150 , sin(thetas) * 150); // draw the line
  
  //Draws the minute hand
  strokeWeight(2);
  float thetam = map(minute(),0,60,0,TWO_PI) - HALF_PI;
  line(0,0,cos(thetam) * 150 , sin(thetam) * 150); // draw the line
  
  //Draws the hour hand
  strokeWeight(4);
  //the hour function returns the time in 23 format so we need to convert to 12 format
  float thetah = map((hour() + minute()/60.0) ,0,24,0,2 * TWO_PI ) - HALF_PI;
  line(0,0,cos(thetah) * 150 , sin(thetah) * 150); // draw the line
}
