import java.util.Map;

PFont AdLibFont;
PFont TimesNewRoman;

int playButtonX, playButtonY, playButtonWidth, playButtonHeight;
int createButtonX, createButtonY, createButtonWidth, createButtonHeight;

ArrayList<TextField> textFields = new ArrayList<TextField>();

int state = 0;

String storyTitle, originalStory, finalStory;

String[] lines;
ArrayList<String> wordTypes = new ArrayList<String>();

String answers = "text here";
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
  text("Fill out the quiz below with your very own words. \n Then,  click 'Create' to discover your very own story!", width/2, 50);
  line(100, 100, 300, 100);
  
   
  textAlign(LEFT);
  for(int i = 0; i < wordTypes.size(); i++)
  {
    fill(0, 0, 0);
    TextField tf = new TextField(wordTypes.get(i) + ": ", 400, 50, 10, height/2-200+45*i);
    if(overField(tf.getX(), tf.getY(), tf.getWidth(), tf.getHeight()))
     {
       fill(255, 0, 0);
     }  
    String str = tf.getType();
    text(str, tf.getX(), tf.getY(), tf.getWidth(), tf.getHeight());
    textFields.add(tf);
  }

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

void mousePressed()
{
  if(overField(playButtonX, playButtonY, playButtonWidth, playButtonHeight))
  {
    state = 1;
  }
  else if(overField(createButtonX, createButtonY, createButtonWidth, createButtonHeight))
  {
    state = 2;
    int_increment = 0;
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
