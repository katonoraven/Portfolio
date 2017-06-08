PFont AdLibFont;
PFont TimesNewRoman;

int playButtonX, playButtonY, playButtonWidth, playButtonHeight;
int createButtonX, createButtonY, createButtonWidth, createButtonHeight;
int textFieldX, textFieldY, textFieldWidth, textFieldHeight;

int state = 0;

String storyTitle, originalStory, finalStory;

String[] lines;
ArrayList<String> wordTypes = new ArrayList<String>();

String answers = "text here";
ArrayList<String> newWords = new ArrayList<String>();

String newWord;

boolean isOverTextField = false;

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
    textFieldWidth = 400;
    textFieldHeight = 50;
    textFieldX = 10;
    textFieldY = height/2-250+30*i;
    newWord = wordTypes.get(i) + ": "; 
    text(newWord, textFieldX, textFieldY, textFieldWidth, textFieldHeight);
    update(mouseX, mouseY, textFieldX, textFieldY, textFieldWidth, textFieldHeight);
    
    newWords.add(newWord);
  }

  createButtonWidth = 300;
  createButtonHeight = 50;
  createButtonX = width/2-playButtonWidth/2;
  createButtonY = height-playButtonHeight+30;
  
  textAlign(CENTER);
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
 
  finalStory = newWords.get(0);
  text(finalStory, 0, 100);
  
  textFont(TimesNewRoman);
  textAlign(CENTER);
  textSize(16);
  text("finalStory", 200, 100);
}

void update(int x, int y, int fieldX, int fieldY, int fieldWidth, int fieldHeight)
{
  if(overField(fieldX, fieldY, fieldWidth, fieldHeight))
  {
    isOverTextField = true;
  }
  else
  {
    isOverTextField = false;
  }
}

void keyPressed()
{
    if (keyCode == BACKSPACE) 
    {
      if (newWord.length() > 0) 
      {
        newWord = newWord.substring(0, answers.length()-1);
      }
    }
    else if (keyCode == DELETE) 
    {
      newWord = "";
    }   
    else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) 
    {
      newWord = newWord + key;
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
  }
  else if(isOverTextField)
  {
    print("clicked on text field!");
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