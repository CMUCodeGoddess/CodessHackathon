void setup()
{
    player_turn= 1; // which player takes the next turn. Player number starts from 1 to 2, 3, etc.
    ellipse_x = ellipse_y = 0;
    GRID_X = 50;
    GRID_Y = 50;

    COL_NUM = 10;
    ROW_NUM = 10;

    MARGIN_X = 100; // margin of grid
    MARGIN_Y = 50; // margin of grid

    ELLIPSE_SIZE_X = 50;
    ELLIPSE_SIZE_Y = 50;

    size(600,400);
    background(125);
    fill(255);
    rectMode(CENTER);
 
    PFont fontA = loadFont("courier");
    textFont(fontA, 14);

    bover = false;
    locked = false;

    LED = [[1,3], [2,4], [5,5], [7, 9], [8,1], [7,4]];
    register = [[3,4], [6,6]];
    capacitor = [[4,3], [7,2]];
}

void draw() {  
    
    background(125);
    fill(255);
    rect(0, 0, 260, 60);
    fill(0, 102, 153);
    text("Player: " + player_turn, 20, 20);
    fill(255);
     
    for (column_count = 1; column_count < COL_NUM; column_count++) { 
	line(100, GRID_X*column_count, GRID_X*11, GRID_X*column_count);
    }

    for (row_count = 0; row_count < ROW_NUM; row_count++) { 
	line(100 + GRID_Y*row_count, GRID_Y, 100 + GRID_Y*row_count, 400);
    }
    fill(0, 123, 123);

    ellipse(MARGIN_X + ellipse_x, MARGIN_Y + ellipse_y , ELLIPSE_SIZE_X , ELLIPSE_SIZE_Y);

    // draw electric parts here
    fill(255);
    for (var i = 0; i < LED.length; i++) {
	base_x = (LED[i][0] + 1.5)*GRID_X;
	base_y = (LED[i][1] + 1)*GRID_Y;
	if (i%2 == 0)
	    triangle(base_x, base_y, base_x-10, base_y+10, base_x-10, base_y-10);
	else
	    triangle(base_x, base_y, base_x+10, base_y-10, base_x+10, base_y+10);
    }

    for (var i = 0; i < register.length; i++) {
	rect((register[i][0] + 1.5)*GRID_X, (register[i][1] + 1)*GRID_Y, 20, 20);
    }

    for (var i = 0; i < capacitor.length; i++) {
	ellipse((capacitor[i][0] + 1.5)*GRID_X, (capacitor[i][1] + 1)*GRID_Y, 20, 20);
    }
}


void keyPressed() {

    if (keyCode ==UP) {
	nextMove(0, -1);
    }else if (keyCode == DOWN){
	nextMove(0, 1);
    }else if (keyCode == LEFT){
	nextMove(-1, 0);
    }else if (keyCode == RIGHT){
	nextMove(1, 0);
    }
}

void nextMove(int x, int y){
    if((MARGIN_X + ellipse_x + x * GRID_X) >= MARGIN_X){
	if((MARGIN_X + ellipse_x + x * GRID_X) <= (MARGIN_X+ GRID_X * COL_NUM)){
	    ellipse_x = ellipse_x + x * GRID_X;
	}
    }

    if((MARGIN_Y+ ellipse_y + y* GRID_Y) >= MARGIN_Y ){
	if((MARGIN_Y+ ellipse_y + y* GRID_Y) <= (MARGIN_Y+GRID_Y * ROW_NUM) ){
	    ellipse_y = ellipse_y + y * GRID_Y;
	}
    }
    //ellipse_y = ellipse_y + y * GRID_Y;

    switch (player_turn){
    case 1:
	fill(123, 0, 123);
	break;

    case 2: 
	fill(0, 123, 123);
	break;
    }
}


/*
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
}*/