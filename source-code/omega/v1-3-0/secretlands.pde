int xpos;int ypos;int xm = 0;int ym = 0;int lastxpos = 9999;int lastypos = 9999;int scene = 0;int tileValue;int tileSelectedValue;int selection;
int selDir = 1;int selX;int selY;int objectValue;int currentObjectID;int inputCodea;int inputCodeb;boolean sprint;int cSpeed = 1;int playerColor = 1;
int countdown = -1;int framecounter = 1;int frameruleCounter = 0;

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
    initialize();
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
    text("9: Europa",20,410);
    text("The Secret Lands belongs to Team CStudios Organization.",700,200);
    text("All programming created by MrJoCrafter (2020-)",700,210);
    text("Terrain algorithm by Yoctobyte and MrJoCrafter (2017-2019)",700,220);
    text("Controls",600,400);
    text("Arrow Keys / WASD: Move/Select",600,410);
    text("E: Mine",600,420);
    text("I: Open/Close Inventory",600,430);
    text("Z: Change placing direction",600,440);
    text("X: Change selected block",600,450);
    text("Shift: Place block",600,460);
    text("+: Screenshot",600,470);
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
    for(int rt = 0; rt < cSpeed; rt++){
      collision();
    }
    drawObjects();
    countdown();
    framecounter();
  }else if(scene == 4){
    background(86); 
    inventory();
  }
  textSize(10);
  fill(45);
  text("The Secret Lands, Version 1.3.0 Omega",800,690);
  if(scene == 3){
    text("{" + (xpos + (width/xFOV/2)) + "," + (ypos + (height/xFOV/2)) + "}",10,690);
    if(selection == 0){  
      text("Placing: None",470,690);
    }else if(selection == 1){  
      text("Placing: Wood",470,690);
    }else if(selection == 2){  
      text("Placing: Stone",470,690);
    }
  }  
  textSize(36);
}

void keyPressed(){
  if(scene == 3){
    if(keyCode == UP || key == 'w' || key == 'W'){
      ym -= cSpeed;
    } 
    if(keyCode == DOWN || key == 's' || key == 'S'){
      ym += cSpeed;
    } 
    if(keyCode == RIGHT || key == 'd' || key == 'D'){
      xm += cSpeed;
    } 
    if(keyCode == LEFT || key == 'a' || key == 'A'){
      xm -= cSpeed ;
    }  
    if(key == '[' || key == '{'){
      scene = 0;
      playerColor = 1;
    }
    if(key == 'i' || key == 'I'){
      scene = 4;
    }   
    if(key == 'x' || key == 'X'){
      if(selection == 0){
        if(inventory[1] > 19){
          selection++;
        }else if(inventory[2] > 19){
          selection = 2;
        }
      } else if(selection == 1){
        if(inventory[2] > 19){
          selection = 2;
        }else{
          selection = 0;
        }
      }else if(selection == 2){
        selection = 0;
      }
    }
    if(key == 'z' || key == 'Z'){
      if(selDir < 4){
        selDir++;
      }else if(selDir == 4){
        selDir = 1;
      }
    }
    if(key == '+' || key == '='){
      textSize(69);
      text("Taking Screenshot...",100,450);
      textSize(36);
      takeScreenshot();
    }
    if(keyCode == SHIFT){
      if(inventory[selection] > 19){
        if(tileSelectedValue < 2 || (tileSelectedValue >= 16 && tileSelectedValue < 18)){
          map[selX][selY] = selection * -1;
          inventory[selection] -= 20;
          if(inventory[selection] < 20){
            selection = 0;
          }
        }
      }
    }
    if(key == 'e' || key == 'E'){
      if(playerColor == 1 || playerColor == 4){
        if(tileValue == 15){
          inventory[1]++;
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)] = 8;
        }
        if(tileValue == 14){
          inventory[1]++;
          if(random(1) > .3){
            inventory[1]++; 
          }
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)] = 9;
        }
      } else if (playerColor == 3){
        if(tileValue == 2){
          inventory[2]++;
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)] = 3;
        }
        if(tileValue == 3){
          inventory[2]++;
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)] = 4;
        }
        if(tileValue == 4){
          inventory[2]++;
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)] = 5;
        }
        if(tileValue == 5){
          inventory[2]++;
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)] = 6;
        }
        if(tileValue == 6){
          inventory[2]++;
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)] = 7;
        }
      }
    }
  }else if(scene == 0){
    if(keyCode == RIGHT){
      if(preset < 9){
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
  }else if(scene == 4){
    if(key == 'i' || key == 'I'){
      scene = 3;
    }
    if(key == '1' || key == '!'){
      if(inventory[20] > 0){
        inventory[20]--;
        countdown = -1;
        playerColor = 1;
      }
    }
    if(key == '2' || key == '@'){
      if(inventory[21] > 0){
        inventory[21]--;
        countdown = 2144;
        playerColor = 2;
      }
    }
    if(key == '3' || key == '#'){
      if(inventory[22] > 0){
        inventory[22]--;
        countdown = 1926;
        playerColor = 3;
      }
    }
    if(key == '4' || key == '$'){
      if(inventory[23] > 0){
        inventory[23]--;
        countdown = 215;
        playerColor = 4;
      }
    }
    if(key == '5' || key == '%'){
      if(inventory[24] > 0){
        inventory[24]--;
        countdown = 412;
        playerColor = 5;
      }
    }
  }
}
