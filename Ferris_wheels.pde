PImage img;
PImage img01;
PImage img02;
PImage img03;
PImage img04;
float r;
int value;
int  showwheel2=1;
String s="Click the button";
void setup() {
  size(800, 700);
  smooth();
  img=loadImage("cloud.png");
  img01=loadImage("cloud01.png");
  img02=loadImage("star01.png");
  img03=loadImage("star02.png");
  img04=loadImage("button.png");
}
void draw() {
  wheel1(width/2, height/2, 1);
  //if click the button, show ferris wheel No.2
  if (showwheel2==-1) {
    wheel2(width/2, height/2, 1);
  }
}

void wheel1(float triangleX, float triangleY, float r)
{
  frameRate(5);
  background(108, 224, 224);
  // text"Click the button"
  textSize(20);
  textAlign(CENTER);
  //set the location of the text
  text(s, 700, 50);
  image(img, 30, 100);
  image(img, 700, 250);
  image(img01, 120, 150);
  //the bulb button
  image(img04, 700, 50);
  //translate the whole ferris wheel
  pushMatrix();
  translate(triangleX, triangleY);
  stroke(70, 137, 102);
  strokeWeight(3);
  fill(202, 252, 216);
  //draw the base of the ferris wheel
  triangle(0, 0, -20, 345, 20, 345);
  noFill();
  ellipse(0, 0, 350, 350);
  ellipse(0, 0, 250, 250);
  ellipse(0, 0, 150, 150);
  ellipse(0, 0, 120, 120);
  ellipse(0, 0, 50, 50);
  //the whole rotation angle
  rotate(frameCount*PI*r/100);
  for (int i=1;i<=12;i=i+1) {
    // one line's rotation angle
    rotate(radians(30));
    line(0, 0, 250, 0);
    //2 kinds of colors
    if ( i%2==0 ) {
      fill(237, 233, 0);
    }
    else {
      fill(253, 116, 0);
    }
    ellipse(250, 0, 60, 60);
    ellipse(250, -32, 4, 4);
    rectMode(CENTER);
    fill(202, 252, 216);
    rect(235, -5, 10, 20);
    rect(250, -5, 15, 20);
    rect(265, -5, 10, 20);
  }
  popMatrix();
}
//similar to wheel1,except for its random color
void wheel2(float triangleX, float triangleY, float r)
{
  background(2, 62, 115);  
  image(img02, 30, 100);
  image(img03, 80, 120);
  image(img04, 700, 50);
  textSize(20);
  textAlign(CENTER);
  //set the location of the text
  text(s, 700, 50);
  pushMatrix();
  strokeWeight(3);
  stroke(random(255), random(255), 255);
  translate(triangleX, triangleY);
  triangle(0, 0, -20, 345, 20, 345);
  rotate(frameCount*PI*r/100);
  noFill();
  ellipse(0, 0, 350, 350);
  ellipse(0, 0, 250, 250);
  ellipse(0, 0, 150, 150);
  ellipse(0, 0, 120, 120);
  ellipse(0, 0, 50, 50);
  for (int i=1;i<=12;i=i+1) {
    frameRate(5);
    rotate(radians(30));
    stroke(255, 255, 120);
    line(0, 0, 250, 0);
    fill (random(100, 255), random(100, 255), random(100));
    stroke(random(255), random(255), 255);
    ellipse(250, 0, 60, 60);
    ellipse(250, -32, 4, 4);
    rectMode(CENTER);
    fill(255, 255, 120);
    rect(235, -5, 10, 20);
    rect(250, -5, 15, 20);
    rect(265, -5, 10, 20);
  }
  popMatrix();
}
// set the input action 
void mouseClicked() {
  if ((value==0 )&& (mouseX<700+img04.width)&&(mouseY>50) &&( mouseY<50+img04.height)&&(mouseX>700)) {
    showwheel2*=-1;
  }
}

