import controlP5.*;

PFont AdLibFont;
PFont TimesNewRoman;

int playButtonX, playButtonY, playButtonWidth, playButtonHeight;
int createButtonX, createButtonY, createButtonWidth, createButtonHeight;

ControlP5 cp5;
String url1, url2, url3, url4, url5, url6;


int state = 0;

String storyTitle, originalStory, finalStory;

String[] lines;
ArrayList<String> wordTypes = new ArrayList<String>();
ArrayList<String> newWords = new ArrayList<String>();

boolean isOverTextField = false;

int int_increment = 0;

void setup()
{  size(400, 700);
  
    lines = loadStrings("file3.txt");
    for(int i = 0; i < lines.length; i++)
    {
        int p1 = lines[i].indexOf("("); 
        while(p1 != -1)
        {
          wordTypes.add(lines[i].substring(p1 + 1, lines[i].indexOf(")", p1 + 1)));
          p1 = lines[i].indexOf("(", p1 + 1);
        }
    }
        
}


void draw()
{  background(255); 
  if(state == 0)
  {
    screen0(); //main screen
  }
  else if(state == 1)
  {
    screen1(); //data collection
  }
  else if(state == 2)
  {
    screen2(); //output
  }
}

void screen0()
{
  AdLibFont = createFont("ADLIB.TTF", 64);
  textFont(AdLibFont);
  textAlign(CENTER, CENTER);
  textSize(64);
  fill(0, 0, 0);
  textAlign(CENTER);
  text("MadLibs", 200, 100);
  
  playButtonWidth = 300;
  playButtonHeight = 100;
  playButtonX = width/2-playButtonWidth/2;
  playButtonY = height/2-playButtonHeight/20;

  rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  TimesNewRoman = createFont("Neuton-Regular.ttf", 45);
  textFont(TimesNewRoman);
  fill(255, 250, 250);
  text("Play", width/2, height/2 + 60);
}

void screen1()
{
  fill(0, 0, 0);
  textSize(20);
  textAlign(LEFT);
  text("Fill out the quiz below with your very own words. \n Then,  click 'Create' to discover your very own story!", 10, 50);
  line(100, 100, 300, 100);
  
   
  textAlign(LEFT);
  int j = wordTypes.size();
  for(int i = 0; i < j; i++)
  {
    text(wordTypes.get(i), 10, 200+60*i);
  }

  cp5 = new ControlP5(this);
  for(int i = 0; i < wordTypes.size(); i++)
  {
     cp5.addTextfield("textInput_" + i).setPosition(200, 175+60*i).setSize(150, 40).setAutoClear(false);
  }
 
  cp5.addBang("Submit").setPosition(240, 570).setSize(80, 40);    
   
 createButtonWidth = 300;
  createButtonHeight = 50;
  createButtonX = width/2-playButtonWidth/2;
  createButtonY = height-playButtonHeight+30;
  
  textAlign(CENTER);
  fill(0, 0, 0);
  rect(createButtonX, createButtonY, createButtonWidth, createButtonHeight);
  TimesNewRoman = createFont("Neuton-Regular.ttf", 30);
  textFont(TimesNewRoman);
  fill(255, 250, 250);
  text("Create", width/2, height-35);

}

void Submit() {
     print("the following text was submitted :");
  url1 = cp5.get(Textfield.class,"textInput_1").getText();
  url2 = cp5.get(Textfield.class,"textInput_2").getText();
  print(" textInput 1 = " + url1);
  print(" textInput 2 = " + url2);
  println();
}


void screen2()
{
  background(255);
  storyTitle = lines[0];
  textFont(AdLibFont);
  textAlign(CENTER);
  textSize(32);
  fill(0, 0, 0);
  textAlign(CENTER);
  text(storyTitle, 200, 70);

  
  textFont(TimesNewRoman);
  textAlign(CENTER);
  textSize(16);
  text("finalStory", 200, 100);
}

/*
void keyPressed()
{
    String editing = textFields.get(int_increment).getType();
    if (keyCode == BACKSPACE) 
    {
        editing = editing;
    }
    else if (keyCode == DELETE) 
    {
      editing = "";
    }   
    else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && keyCode != ENTER) 
    {
      editing = editing + key;
    }
  else if(keyCode == ENTER)
  {
    int_increment++;
  }
}
*/
void mousePressed()
{
  if(overField(playButtonX, playButtonY, playButtonWidth, playButtonHeight))
  {
    state = 1;
  }
  else if(overField(createButtonX, createButtonY, createButtonWidth, createButtonHeight))
  {
    state = 2;
  }
}

boolean overField(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
/*
class TextField
{
  String type;
  int fieldWidth, fieldHeight, fieldX, fieldY;
  
  TextField(String str, int a, int b, int c, int d)
  {
    type = str; fieldWidth = a; fieldHeight = b; fieldX = c; fieldY = d;
  }
  
  String getType()
  {
    return type;
  }
  
 int getWidth()
  {
    return fieldWidth;
  }
  
 int getHeight()
  {
    return fieldHeight;
  }
  
 int getX()
  {
    return fieldX;
  }
  
 int getY()
  {
    return fieldY;
  }
  
  String toString()
  {
    return type + ": " + this.getX() + ", " + this.getY() + ", " + this.getWidth() + ", " + this.getHeight();
  }
}
*/

