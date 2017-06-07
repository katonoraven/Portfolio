PFont AdLibFont;
PFont TimesNewRoman;
int playButtonX, playButtonY, createButtonX, createButtonY;
int playButtonWidth, playButtonHeight, createButtonWidth, createButtonHeight;
boolean overButton = false;
String typed, lastInput = "";
int state = 0;

void setup()
{
  size(400, 700);
}

void draw()
{
  background(255);
  
  if(state == 0)
  {
    screen0(); //main screen
  }
  if(state == 1)
  {
    screen1(); //data collection
  }
  if(state == 2)
  {
    screen2(); //output
  }
}

void screen0()
{
  //TITLE
  AdLibFont = createFont("ADLIB.TTF", 64);
  textFont(AdLibFont);
  textAlign(CENTER, CENTER);
  textSize(64);
  fill(0, 0, 0);
  textAlign(CENTER);
  text("MadLibs", 200, 100);
  
  //BUTTON
  update(mouseX, mouseY);
 
  playButtonWidth = 300;
  playButtonHeight = 100;
  playButtonX = width/2-playButtonWidth/2;
  playButtonY = height/2-playButtonHeight/20;
  
  if (overButton) {
    fill(64, 64, 64);
  } else {
    fill(0, 0, 0);
  }
  
  rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  
  //play text on button
  TimesNewRoman = createFont("Neuton-Regular.ttf", 45);
  textFont(TimesNewRoman);
  fill(255, 250, 250);
  text("Play", width/2, height/2 + 60);
}

void screen1()
{
  fill(0, 0, 0);
  textSize(20);
  text("Fill out the quiz below with your very own words. \n Then,  click 'Next' to discover your very own story!", width/2, 50);
  fill(255, 0, 0);
  rect(0, 300, width, 30);
  fill(255);
  //text(typed, 0, 300, width, 30);
  
  update(mouseX, mouseY);
 
  createButtonWidth = 300;
  createButtonHeight = 100;
  createButtonX = width/2-playButtonWidth/2;
  createButtonY = height/2-playButtonHeight/20;
  
  if (overButton) {
    fill(64, 64, 64);
  } else {
    fill(0, 0, 0);
  }
  
  rect(createButtonX, createButtonY, createButtonWidth, createButtonHeight);
  
  //play text on button
  TimesNewRoman = createFont("Neuton-Regular.ttf", 45);
  textFont(TimesNewRoman);
  fill(255, 250, 250);
  text("Create", width/2, height/2 + 60);
}

void screen2()
{
  text("Screen 2", 50, 50);
}

void update(int x, int y)
{
  if ( overButton(playButtonX, playButtonY, playButtonWidth, playButtonHeight) ) {
    overButton = true;
  }
  else {
    overButton = false;
  }
}

void mousePressed()
{
  update(mouseX, mouseY);
  if(overButton(playButtonX, playButtonY, playButtonWidth, playButtonHeight))
  {
    state = 1;
  }
  else if(overButton(createButtonX, createButtonY, createButtonHeight, createButtonHeight))
  {
    state = 2;
  }
}

boolean overButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}