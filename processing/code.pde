void setup()
{
  size(600,400);
  background(125);
  fill(255);
  noLoop();
  PFont fontA = loadFont("courier");
  textFont(fontA, 14);  
}

void draw(){  
  text("Hello Web!",20,20);

  for (i = 1; i < 10; i++) { 
      line(100, 50*i, 550, 50*i);
  }

  for (i = 0; i < 10; i++) { 
      line(100 + 50*i, 50, 100 + 50*i, 400);
  }
  ellipse(56, 46, 55, 55);
  println("Hello ErrorLog!");
}


void keyPressed() {
    println("BACKSPACE", keyCode);

  if (keyCode == A) {

    println("BACKSPACE");

  }

}