int xpos = 1000;
int ypos = 1000;
int xm = 0;
int ym = 0;
int lastxpos = 9999;
int lastypos = 9999;
int scene = 0;
int tileValue;
int objectValue;
int currentObjectID;
int inputCodea;
int inputCodeb;
boolean sprint;
int cSpeed = 1;
int playerColor = 1;

void settings(){
  size(1000,700); 
}
void setup(){
  frameRate(60);
  background(100);
  textSize(36);
}

void draw(){
  if(scene == 0){
    background(100);
    fill(255);
    textSize(50);
    text("The Secret Lands",300,50);
    textSize(36);
    text("World Generation: <-" + preset + "->",20,300);
    text("Press SHIFT to continue",20,680);
    textSize(10);
    text("0: Normal",20,320);
    text("1: Southwestern Europe",20,330);
    text("2: Mountain Barriers",20,340);
    text("3: Middle East",20,350);
    text("4: Indonesia",20,360);
    text("5: Desert Archipelago",20,370);
    text("6: Winter Wonderland",20,380);
    text("7: China",20,390);
    text("8: Random (unstable)",20,400);
    text("The Secret Lands belongs to Team CStudios Organization.",700,200);
    text("All programming created by MrJoCrafter (2020-)",700,210);
    text("Terrain algorithm by Yoctobyte and MrJoCrafter (2017-2019)",700,220);
  }else if(scene == 1){
    background(100);
    fill(255);
    text("Generating World... This may take a moment.",150,300);
    scene = 2;
  }else if(scene == 2){
    background(100);
    terrainGenSetup();
    terrainGenDraw();
    createObjects();
    drawTerrain();
    while(tileValue <= 7 || tileValue >= 16){
      xpos = int(random(200) + 200);
      ypos = int(random(200) + 200);
      drawTerrain();
    }
    scene = 3;
  }else if(scene == 3){
    background(0,0,240); 
    drawTerrain();
    collision();
    drawObjects();
  }
  textSize(10);
  fill(45);
  text("The Secret Lands, Version 1.1.0 Omega",800,690);
  if(scene == 3){
    text("{" + abs((xpos % 2000)) + "," + abs((ypos % 2001)) + "}",10,690);
  }  
  textSize(36);
}

void keyPressed(){
  if(scene == 3){
    if(keyCode == UP){
      ym -= cSpeed;
    } 
    if(keyCode == DOWN){
      ym += cSpeed;
    } 
    if(keyCode == RIGHT){
      xm += cSpeed;
    } 
    if(keyCode == LEFT){
      xm -= cSpeed;
    }  
    if(key == '['){
      scene = 0;
      playerColor = 1;
    }
  }else if(scene == 0){
    if(keyCode == RIGHT){
      if(preset < 8){
        preset++;
      }
    } 
    if(keyCode == LEFT){
      if(preset > 0){
        preset--;
      }
    }
    if(keyCode == SHIFT){
    scene = 1;
    }
  }
}
