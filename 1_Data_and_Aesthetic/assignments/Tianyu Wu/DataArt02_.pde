/*
NYTimes Data
 tw981@nyu.edu
 02/03/2014
 
 -the CSV war.csv can be replaced with any int list
 */
/*

 String colStr = "FFFF0000";
 color c = unhex(colStr);
 fill(c);
 rect(0, 0, width, height);
 
 */

int[] numbers;
int[] compnumbers;

int intArray[][]=new int [60][8];
PFont f;

PImage img, img_1, img_1950, img_1950_;


String[] colorList = {
  "ffffffcc", 
  "ffffeda0", 
  "fffed976", 
  "fffeb24c", 
  "fffd8d3c", 
  "fffc4e2a", 
  "ffe31a1c", 
  "ffbd0026", 
  "ff800026"
};



color getColor(float f) {
  int i = floor(f * (colorList.length-1));
  color col = unhex(colorList[i]);
  return col;
  //return(col);
}

void setup() {
  size(1200, 720, P3D);
  smooth();
  f = createFont("Arial", 16, true);
  loadData("Workbook2.csv");
  comploadData("pollution.csv");
  for (int i=0; i<60; i++) {
    for (int j=0; j<8; j++) {
      intArray[i][j]=20*int(random(18));
      println(intArray[i][j]);
    }
  }
}

void draw() {
  textFont(f);
  fill(0);
  text("1950", 10, 360);
  img = loadImage("data/background.png");
  image(img, 0, 0);
  img_1= loadImage("data/background_1.png");
  image(img_1, 0, 360);
  //background(255);
  colorMode(HSB);
  noStroke();
  fill(255);
  rect(0, 360, 1200, 4);
  drawGrid(numbers, 10, 20, 0);
  compdrawGrid(compnumbers, 10, 20, 360);
}

void drawGrid(int[] nums, int cols, float s, float y) {
  float ypos = y;
  println(nums.length);
  for (int i = 0; i< nums.length; i++) {
    //Draw every block in the grid
    int n = nums[i]; 
    float x= i*s;

    color col = getColor(map(n, 0, max(nums), 0, 1));
    fill(col, 160);
    for (int m=0; m<8; m++) {
      rect(x, intArray[i][m], s, s);
    }
    //
  }
}

void compdrawGrid(int[] nums, int cols, float s, float y) {
  float ypos = y;
  for (int i = 0; i< nums.length; i++) {
    //Draw every block in the grid
    int n = nums[i]; 
    /// float x = (i % cols)*s; 
    //float y = floor(i / cols)*s;
    float x= i*s;

    //float c = map(n, 0, max(nums), 0, 255);
    //fill(c);
    //fill(255, c, 0); // you got 6 arrangements
    //fill(c, 255, 255);
    color col = getColor(map(n, 0, max(nums), 0, 1));
    fill(col, 160);
    //rect(x, ypos, s, s*18);

    for (int m=0; m<8; m++) {
      rect(x, 360+intArray[i][m], s, s);
    }
  }
}


void loadData(String fileName) {
  String[] rows = loadStrings(fileName);
  numbers = new int[rows.length];
  for (int i =0; i<rows.length; i++) numbers[i] = int(rows[i]);
}


void comploadData(String fileName) {
  String[] rows = loadStrings(fileName);
  compnumbers = new int[rows.length];
  for (int i =0; i<rows.length; i++) compnumbers[i] = int(rows[i]);
}


