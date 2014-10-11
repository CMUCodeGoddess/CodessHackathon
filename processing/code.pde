void setup()
{
    player_turn= 1; // which player takes the next turn. Player number starts from 1 to 2, 3, etc.
    GRID_X = 50;
    GRID_Y= 50;
    playerOne_x = playTwo_x = playerOne_y = playerTwo_y = 0;

    size(600,400);
    background(125);
    fill(255);
 
    PFont fontA = loadFont("courier");
    textFont(fontA, 14);

    bover = false;
    locked = false;
}

void draw() {  

    rect(0, 0, 130, 30);
    fill(0, 102, 153);
    text("Take Turns!" + player_turn, 20, 20);
    fill(255);
     
    for (column_count = 1; column_count < 10; column_count++) { 
	line(100, GRID_X*column_count, GRID_X*11, GRID_X*column_count);
    }

    for (row_count = 0; row_count < 10; row_count++) { 
	line(100 + GRID_Y*row_count, GRID_Y, 100 + GRID_Y*row_count, 400);
    }

    ellipse(56, 46, 55, 55);
    println("Hello ErrorLog!");
}


void keyPressed() {
    //println("BACKSPACE", keyCode);

  if (keyCode ==UP) {
    nextMove(0, 1);
  }else if (keyCode == DOWN){
      nextMove(0, -1);
  }else if (keyCode == LEFT){
      nextMove(-1, 0);
  }else if (keyCode == RIGHT){
      nextMove(1, 0);
  }

}

void nextMove(int x, int y){
  switch (player_turn){
    case 1:

    case 2: 
  }
}

void mousePressed() {

    if (mouseX > 0 && mouseX < 130 && mouseY > 0 && mouseY < 30) {
	bover = true; 
    }
    else {
	bover = false;
    } 

    if(bover) { 
	if (player_turn == 1) {
	    player_turn = 2;
	} else {
	    player_turn = 1;
	}
	println(player_turn);
    }
}