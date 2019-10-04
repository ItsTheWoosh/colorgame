int mode = 0;
int menu = 0;
int instr = 1;
int game = 2;
int gameOver = 3;
color red = #DF151A;
color orange = #FD8603;
color yellow = #F4F328;
color green = #00DA3C;
color blue = #00CBE7;
color black = #000000;
color white = #FFFFFF;
int rand = (int)(random (0, 2));
int randomWords = (int)random(0, 5);
int randomColors = (int)random(0, 5);
int score = 0;
int frames = 0;
double seconds = 0.0;

void setup() {
  size(600, 800);
  background(100);
  frameRate(60);
}

void draw() {
  if (mode == menu) {
    background(100);
    fill(white);
    textSize(75);
    text("COLOR GAME", 60, 300);
    textSize(20);
    text("CLICK ANYWHERE TO START", 300, 500);    
  } else if (mode == instr) {
    score = 0;
    seconds = 0;
    frames = 0;
      background(255);
      fill(black);
      textSize(60);
      text("INSTRUCTIONS", 90, 100);
      textSize(20);
      text("THE OBJECTIVE OF THIS GAME IS VERY SIMPLE", 75, 300);
      text("IF THE COLOR OF THE WORD MATCHES THE WORD", 50, 330);
      text("THEN CLICK ON THE RIGHT SIDE", 140, 360);
      text("IF IT DOESN'T CLICK ON THE LEFT", 130, 390);
      text("YOU WILL HAVE 3 SECONDS TO COMPLETE EACH ROUND", 25, 420);
      text("THE TIMER WILL RESET EVERY ROUND TO 3 SECONDS", 50, 450);
      text("GETTING ONE RIGHT WILL NET YOU ONE POINT", 80, 480);
      text("GETTING ONE WRONG WILL LOSE YOU 25 POINTS", 70, 510);
      text("IF YOU RUN OUT OF POINTS YOU LOSE", 125, 540);
      text("IF YOU RUN OUT OF TIME YOU LOSE", 135, 570);
      text("GOOD LUCK! :)", 225, 600);
      text("CLICK ANYWHERE TO START", 50, 750);
  } else if (mode == game) {
      background(255);
      fill(white);
      rect(0, 0, 300, 800);
      fill(black);
      rect(300, 0, 600, 800);
      textSize(75);
      if (rand == 0) {
        randomColors = randomWords;
      }
      if (randomColors == 0) {
      fill(red);
    } else if (randomColors == 1) {
      fill(orange);
    } else if (randomColors == 2) {
      fill(yellow);
    } else if (randomColors == 3) {
      fill(green);
    } else if (randomColors == 4) {
      fill(blue);
    }
    if (randomWords == 0) {
      text("RED", 252, 350);
    } else if (randomWords == 1) {
      text("ORANGE", 195, 350);
    } else if (randomWords == 2) {
      text("YELLOW", 210, 350);
    } else if (randomWords == 3) {
      text("GREEN", 217, 350);
    } else if (randomWords == 4) {
      text("BLUE", 244, 350);
    }
    textSize(20);
    stroke(black);
    fill(white);
    rect (50, 725, 200, 775);
    fill(black);
    text("Your Score: " + score, 75, 750);
    fill(white);
    frames = frames + 1;
    if (frames == 30 || frames == 60 || frames == 90 || frames == 120 || frames == 150) {
      seconds = seconds + 0.5;
    } else if (frames == 180) {
      if (score > 25) {
        score = score - 25;
      } else if (score <= 25) {
        mode++;
      }
    } 
    if (seconds == 0) {
        fill (white);
        rect(580, 0, 600, 800);
    } else if (seconds == 0.5) {
        fill(black);
        rect(580, 0, 600, 800);
        fill(white);
        rect(580, (int)((seconds * 10) * 26), 600, 800);
    } else if (seconds == 1) {
        fill(black);
        rect(580, 0, 600, 800);
        fill(white);
        rect(580, (int)((seconds * 10) * 26), 600, 800);
    } else if (seconds == 1.5) {
        fill(black);
        rect(580, 0, 600, 800);
        fill(white);
        rect(580, (int)((seconds * 10) * 26), 600, 800);
    } else if (seconds == 2) {
        fill(black);
        rect(580, 0, 600, 800);
        fill(white);
        rect(580, (int)((seconds * 10) * 26), 600, 800);
    } else if (seconds == 2.5) {
        fill(black);
        rect(580, 0, 600, 800);
        fill(white);
        rect(580, (int)((seconds * 10) * 26), 600, 800);
    } else if (seconds > 3) {
      if (score > 25) {
        score = score - 25;
      } else if (score <= 25) {
        mode++;
      }
    } 
  } else if (mode == gameOver) {
    background(red);
    fill(black);
    textSize(20);
    text("GAME OVER!", 250, 400);
    text("YOUR SCORE WAS " + score, 225, 450);
    text("CLICK ANYWHERE TO GO BACK TO MENU", 50, 750);
  }
}

void mouseReleased() {
  if (mode == menu) {
    mode++;
  } else if (mode == instr) {
    mode++;
  } else if (mode == game) {
    
    if (mouseX < 300) {
      if (randomColors == randomWords) {
        score++;
        randomWords = (int) random(0, 5);
        randomColors = (int) random(0, 5);
        rand = (int) random(0, 2);
        seconds = 0;
      } else if (randomColors != randomWords) {
        if (score > 25) {
          score -=25;
          randomWords = (int) random(0, 5);
          randomColors = (int) random(0, 5);
          rand = (int) random(0, 2);
          seconds = 0;
        } else if (score <= 25) {
          mode = gameOver;
        }
      }
    } else if (mouseX > 300) {
      if (randomColors == randomWords) {
        if (score > 25) {
          score -= 25;
          randomWords = (int) random(0, 5);
          randomColors = (int) random(0, 5);
          rand = (int) random(0, 2);
          seconds = 0;
        } else if (score <= 25) {
          mode = gameOver;
        }
      } else if (randomColors != randomWords) {
        score++;
        randomWords = (int) random(0, 5);
        randomColors = (int) random(0, 5);
        rand = (int) random(0, 5);
        seconds = 0;
      }
    }
  } else if (mode == gameOver) {
    mode = menu;
  }
}

/*


PROGRAMMING IS DONE


*/
