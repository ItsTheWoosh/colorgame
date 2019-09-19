import java.util.Arrays;

color red = #DF151A;
color orange = #FD8603;
color yellow = #F4F328;
color green = #00DA3C;
color blue = #00CBE7;
color black = #000000;
color white = #FFFFFF;
int mode;
int randomWords = int(random(0, 5));
int randomColors = int(random(0, 5));
int score = 0;
final int menu = 0;
final int gameip = 1;
final int gameover = 2;

color[] colours = {red, orange, yellow, green, blue, black, white};
String[] colors = {"#DF151A", "#FD8603", "#F4F328", "#00DA3C", "#00CBE7", "#000000", "#FFFFFF"};

void setup() {
  size(600, 800);
  mode = menu;
}

void draw() {
  if (mode == menu) {
    Menu();
  }else if (mode == gameip) {
    GameIP();
  } else if (mode == gameover) {
    GameOver();
  } else println("Mode error. Mode was " + mode);
}

void mouseReleased() {
  if (mode == menu) {
    mode = gameip;
  } else if (mode == gameip) {
    score = 0;

    if (randomWords == randomColors) {
        if (mouseX > 300) {
          score++;
          randomWords = int(random(0,5));
          randomColors = int(random(0,5));
        } else if (mouseX < 300) {
            mode = gameover;
        }
    } else if (randomWords != randomColors) {
        if (mouseX > 300) {
          mode = gameover;
      } else if (mouseX < 300) {
          score++;
          randomWords = int(random(0,5));
          randomColors = int(random(0,5));
      }
    }
  } else if (mode == gameover) {
    mode = menu;
  }
}
