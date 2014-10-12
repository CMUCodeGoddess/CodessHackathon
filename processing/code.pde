/* @pjs preload="data/capacitor_green.jpg"; */
/* @pjs preload="data/game_bg2.jpg"; */
/* @pjs preload="data/led_green.jpg"; */
/* @pjs preload="data/led_green_left.jpg"; */
/* @pjs preload="data/led_green_right.jpg"; */
/* @pjs preload="data/power_green.jpg"; */
/* @pjs preload="data/resistor_green.jpg"; */
/* @pjs preload="data/boy_right.png"; */
/* @pjs preload="data/boy_left.png"; */
/* @pjs preload="data/boy_right_red.png"; */
/* @pjs preload="data/boy_left_red.png"; */
/* @pjs preload="data/Banner_GameOver.png"; */
/* @pjs preload="data/Banner_Great.png"; */
/* @pjs preload="data/Banner_LetsStart.png"; */

      

PImage img_capacitor;
PImage img_bg;
PImage img_led;
PImage img_led_l;
PImage img_led_r;
PImage img_power;
PImage img_resistor;
PImage img_boy;
PImage img_boy_l;
PImage img_boy_red;
PImage img_boy_l_red;
PImage img_banneer_great;


void setup()
{
    img_capacitor = loadImage("data/capacitor_green.jpg");
    img_bg = loadImage("data/game_bg2.jpg");
    img_led = loadImage("data/led_green.jpg");
    img_led_l = loadImage("data/led_green_left.jpg");
    img_led_r = loadImage("data/led_green_right.jpg");
    img_power = loadImage("data/power_green.jpg");
    img_resistor = loadImage("data/resistor_green.jpg");
    img_boy = loadImage("data/boy_right.png");
    img_boy_l = loadImage("data/boy_left.png");
    img_boy_red = loadImage("data/boy_right_red.png");
    img_boy_l_red = loadImage("data/boy_left_red.png");
    img_banneer_great = loadImage("data/Banner_Great.png");

    boy_right = true;

    player_turn= 1; // which player takes the next turn. Player number starts from 1 to 2, 3, etc.
    player_score = 0;
    player_steps = 3;
    ellipse_x = ellipse_y = 0;
    GRID_X = 70;
    GRID_Y = 70;

    COL_NUM = 8;
    ROW_NUM = 8;

    MARGIN_X = 70; // margin of grid
    MARGIN_Y = 50; // margin of grid

    ELLIPSE_SIZE_X = 50;
    ELLIPSE_SIZE_Y = 50;

    size(600,600);
    background(125);
    fill(255);
    rectMode(CENTER);
 
    PFont fontA = loadFont("courier");
    textFont(fontA, 27);

    bover = false;
    locked = false;
    done = false;

    LED = [[1,3], [2,4], [5,5], [2, 6], [4,1], [6,4]];
    register = [[1,3], [3,4], [6,6]];
    capacitor = [[2,2], [4,3], [5,2]];


    path_left = [];
    path_right = [];
    //prevPosition = currentPosition = point(0,0);
    prevPosition_x=0;
    prevPosition_y=0;
    currentPosition_x=0;
    currentPosition_y=0;

}


void draw() {  
    
    image(img_bg, 0, 0, 600, 600);
    

    fill(0, 102, 153);
    text("Player:" + player_turn, 30, 30);
    text("Steps:"  + player_steps, 190, 30);
    text("Score:"  + player_score, 350, 30);
 

/*
    for (column_count = 1; column_count < COL_NUM; column_count++) { 
	line(MARGIN_X, GRID_X*column_count, GRID_X*11, GRID_X*column_count);
    }

    for (row_count = 0; row_count < ROW_NUM; row_count++) { 
	line(MARGIN_X + GRID_Y*row_count, GRID_Y, MARGIN_X + GRID_Y*row_count, 400);
    }
*/

    // draw electric parts here
    image(img_power, 45, 1*GRID_Y, 60, 60);
    

    fill(255);
    for (var i = 0; i < LED.length; i++) {
	base_x = (LED[i][0] + 1.5)*GRID_X;
	base_y = (LED[i][1] + 1)*GRID_Y;
	if (i%2 == 0) {
	    triangle(base_x, base_y, base_x-10, base_y+10, base_x-10, base_y-10);
	    image(img_led_l, (LED[i][0] + 1.2)*GRID_X, (LED[i][1] + 0.6)*GRID_Y, 50, 50);
	}
	else {
	    triangle(base_x, base_y, base_x+10, base_y-10, base_x+10, base_y+10);
	    image(img_led_r, (LED[i][0] + 1.2)*GRID_X, (LED[i][1] + 0.7)*GRID_Y, 50, 50);
	}
    }

    for (var i = 0; i < register.length; i++) {
	rect((register[i][0] + 1.5)*GRID_X, (register[i][1] + 1)*GRID_Y, 20, 20);
	image(img_resistor, (register[i][0] + 1.2)*GRID_X, (register[i][1] + 0.6)*GRID_Y, 50, 50);
    }

    for (var i = 0; i < capacitor.length; i++) {
	ellipse((capacitor[i][0] + 1.5)*GRID_X, (capacitor[i][1] + 1)*GRID_Y, 20, 20);
	image(img_capacitor, (capacitor[i][0] + 1.2)*GRID_X, (capacitor[i][1] + 0.6)*GRID_Y, 50, 50);
    }

    fill(0, 123, 123);
    //ellipse(MARGIN_X + ellipse_x, MARGIN_Y + ellipse_y , ELLIPSE_SIZE_X , ELLIPSE_SIZE_Y);
    if (boy_right) {
	if (player_turn == 1)
	    image(img_boy, MARGIN_X + ellipse_x, MARGIN_Y + ellipse_y - 50, 40, 60);
	else
	    image(img_boy_red, MARGIN_X + ellipse_x, MARGIN_Y + ellipse_y - 50, 40, 60);
    }
    else {
	if (player_turn == 1)
	    image(img_boy_l, MARGIN_X + ellipse_x, MARGIN_Y + ellipse_y - 50, 40, 60);
	else
	     image(img_boy_l_red, MARGIN_X + ellipse_x, MARGIN_Y + ellipse_y - 50, 40, 60);
    }

    if (done)
	image(img_banneer_great, -50, 0);
	


    stroke(0);
    strokeWeight(5);

    if(path_left != null){
        for(i =0; i<path_left.length; i++){
            line(MARGIN_X+path_left[i][0], MARGIN_Y+path_left[i][1]+ 15,MARGIN_X+path_right[i][0], MARGIN_Y+path_right[i][1]+15);
           
        }
    }
}



void keyPressed() {

    if (keyCode ==UP) {
	nextMove(0, -1);
	player_steps--;
    }else if (keyCode == DOWN){
	nextMove(0, 1);
	player_steps--;
    }else if (keyCode == LEFT){
	nextMove(-1, 0);
	boy_right = false;
	player_steps--;
    }else if (keyCode == RIGHT){
	nextMove(1, 0);
	boy_right = true;
	player_steps--;
    } else if (key == '1') {
	player_score++;
    } else if (key == '2') {
	player_steps = player_steps + 3;
    } 
    else if (key == '3') {
	player_steps = 0;
    } 
    else if (key == '4') {
	done = true;
    } 


    if (player_steps < 1) {
	player_steps = 3;

	if (player_turn == 1)
	    player_turn = 2;
	else
	    player_turn = 1;
    }

}

void nextMove(int x, int y){



    if((MARGIN_X + ellipse_x + x * GRID_X) >= MARGIN_X){
    if((MARGIN_X + ellipse_x + x * GRID_X) <= (MARGIN_X+ GRID_X * (COL_NUM-1))){
        if(checkPath(x, y)){
           ellipse_x = ellipse_x + x * GRID_X;
    }
       
    }
    }

    if((MARGIN_Y+ ellipse_y + y* GRID_Y) >= MARGIN_Y ){
    if((MARGIN_Y+ ellipse_y + y* GRID_Y) <= (MARGIN_Y+GRID_Y * (ROW_NUM-1)) ){
         if(checkPath(x, y)){
           ellipse_y = ellipse_y + y * GRID_Y;
        }
    }
    }

    // step_count = step_count+ 1;
}


boolean checkPath(x, y){
 
    path_left.push([currentPosition_x,currentPosition_y]);
    path_right.push([ellipse_x,ellipse_y]);
    currentPosition_x=ellipse_x;
    currentPosition_y=ellipse_y

//    }
    return true;

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