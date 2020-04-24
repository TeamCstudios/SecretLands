import processing.net.*;
import processing.sound.*;

int lastxpos = 9999;int lastypos = 9999;int scene = 0;int tileValue;int tileSelectedValue;int selection;int selDir = 1;int selX;int selY;int objectValue;int currentObjectID;boolean sprint;int framecounter = 1;int frameruleCounter = 0; int framerate; int frameStorage = 0; int timeStorage = 0;
int xpos;int ypos;int zpos;int xm = 0;int ym = 0;int health;int cSpeed = 1;int playerColor = 1;int countdown = -1; 
final String verCode = "o170"; String worldName; String textEntry = ""; String test; boolean isLatestRelease;

// CHANGE TO TRUE IF USING A MAC MACHINE
final boolean isOSX = false;
// CHANGE TO TRUE IF USING A MAC MACHINE

void settings(){
  size(1000,700); 
}
void setup(){
  frameRate(60);
  background(105,55,155);
  textSize(36);
  fill(0);
  text("Loading files from the cloud...",10,450);
  loadMusic();
  versionz();
}

void draw(){
  if(!(scene == 3 || scene == 4)){
    stopmusic();
  }
  if(scene == 0){
    initialize();
    background(100);
    fill(255);
    textSize(50);
    text("The Secret Lands",300,50);
    textSize(36);
    text("World Generation: <-" + preset + "->",20,300);
    text("Press SHIFT for New Game, Press CONTROL to continue.",20,660);
    textSize(16);
    if(isLatestRelease){
      text("You are on the latest version.",300,75);
    }else{
      text("You are not on the latest version, " + test,300,75);
    }
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
    text("10: Customized (choose your own settings)",20,420);
    text("The Secret Lands belongs to Team CStudios Organization.",700,200);
    text("All programming created by MrJoCrafter (2020-)",700,210);
    text("Terrain algorithm by Yoctobyte and MrJoCrafter (2017-2019)",700,220);
    text("Soundtrack by Takijana and MrJoCrafter(2020-)",700,230);
    text("Controls",600,400);
    text("Arrow Keys / WASD: Move/Select",600,410);
    text("E: Mine",600,420);
    text("I: Open/Close Inventory",600,430);
    text("Z: Change placing direction",600,440);
    text("X: Change selected block",600,450);
    text("Shift: Place block",600,460);
    text("+: Screenshot",600,470);
    text("]: Save",600,480);
  }else if(scene == 1){
    background(100);
    fill(255);
    text("Generating World... This may take a moment.",150,300);
    scene = 2;
  }else if(scene == 2){
    background(100);
    terrainGenSetup();
    terrainGenDraw();
    terrainGenDrawCaves();
    nameWorld();
    worldnames();
    createObjects();
    drawTerrain();
    while(tileValue < 7 || tileValue >= 16){
      xpos = int(random(mapSize));
      ypos = int(random(mapSize));
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
    drawHealth();
    checkDeath();
    if(!(music1.isPlaying()) && !(music2.isPlaying()) && !(music3.isPlaying()) && zpos == 0){
      if(random(1) > .98){
        wandering();
      }
    }
    if(!(music4.isPlaying()) && zpos == 1){
      if(random(1) > .98){
        caves();
      }
    }
  }else if(scene == 4){
    background(86); 
    inventory();
  }else if(scene == 5){
    background(86); 
    fill(255,0,0);
    text("YOU DIED... PRESS SHIFT TO RESPAWN.",100,500);
  }else if(scene == 6){
    fill(255,0,0);
    text("Respawning...",150,300);
    initialize();
    drawTerrain();
    while(tileValue <= 7 || tileValue >= 16){
      xpos = int(random(mapSize));
      ypos = int(random(1000));
      drawTerrain();
    }
    scene = 3;
  }else if (scene == 7){
    saveWorld();
    scene = 3;
  }else if (scene == 8){
    background(100);
    textSize(13);
    String[] xc;
    if(isOSX){
      xc = loadStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "profile/worldnames.sldat");
    }else{
      xc = loadStrings("profile/worldnames.sldat");
    }
    String xcx = "[";
    for(int i = 0; i < xc.length; i++){
      xcx = xcx + xc[i] + ",";
    }
    xcx = xcx + "]";
    text(xcx,10,20);
    textSize(26);
    text("Enter the name of your world, without the -" + verCode + " to load your save.",10,250);
    text("If you forgot the name of your world, look in /saves.",10,280);
    text("Press SHIFT to load world and ALT to clear selection.",10,470);
    textSize(36);
    text(textEntry,100,370);
  }else if (scene == 10){
    customMenu();
    fill(255);
    textSize(36);
    text("Press CONTROL to continue.",20,660);
  }
  textSize(10);
  fill(45);
  text("The Secret Lands, Version 1.7.0 Omega",800,690);
  if(scene == 3){
    text("{" + (xpos + (width/xFOV/2)) + "," + (ypos + (height/xFOV/2)) + "," + zpos + "}",10,690);
    if(selection == 0){  
      text("Placing: None",470,690);
    }else if(selection == 1){  
      text("Placing: Wood",470,690);
    }else if(selection == 2){  
      text("Placing: Stone",470,690);
    }else if(selection == 5){  
      text("Placing: Copper",470,690);
    }else if(selection == 6){  
      text("Placing: Iron",470,690);
    }
    textSize(25);
    text(framerate + "FPS",910,25);
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
    if(key == 'l' || key == 'L'){
      if(zpos == 0){
        zpos++;
      }else{
        zpos--;
      }
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
        if(inventory[5] > 19){
          selection = 5;
        }else{
          selection = 0;
        }
      }else if(selection == 5){
        if(inventory[6] > 19){
          selection = 6;
        }else{
          selection = 0;
        }
      }else if(selection == 6){
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
    if(key == '}' || key == ']'){
      textSize(30);
      text("Saving to file " + "saves/" + worldName + "-" + verCode + "......",20,150);
      scene = 7;
    }
    if(keyCode == SHIFT){
      if(inventory[selection] > 19){
        if(!(tileSelectedValue < 2 || (tileSelectedValue >= 16 && tileSelectedValue < 18))){
          map[selX][selY][zpos] = selection * -1;
          inventory[selection] -= 20;
          if(inventory[selection] < 20){
            selection = 0;
          }
        }
      }
    }
    if(key == 'e' || key == 'E'){
      if(tileSelectedValue < 0 && selection != 0){
        map[selX][selY][zpos] = tileValue;
        inventory[-1 * tileSelectedValue] += 20;
      }else if(playerColor == 1 || playerColor == 4){
        if(tileValue == 15){
          inventory[1]++;
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)][zpos] = 8;
        }
        if(tileValue == 14){
          inventory[1]++;
          if(random(1) > .3){
            inventory[1]++; 
          }
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)][zpos] = 9;
        }
      } else if (playerColor == 3){
        if(tileValue == 2){
          inventory[2]++;
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)][zpos] = 3;
        }
        if(tileValue == 3){
          inventory[2]++;
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)][zpos] = 4;
        }
        if(tileValue == 4){
          inventory[2]++;
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)][zpos] = 5;
        }
        if(tileValue == 5){
          inventory[2]++;
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)][zpos] = 6;
        }
        if(tileValue == 6){
          inventory[2]++;
          map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)][zpos] = 7;
          if(objectValue == 8){
            inventory[4]++;
            objectxpos[currentObjectID] = 0;
            objectypos[currentObjectID] = 0;
            objectvalue[currentObjectID] = 0;
          }
          if(objectValue == 9){
            inventory[5]++;
            objectxpos[currentObjectID] = 0;
            objectypos[currentObjectID] = 0;
            objectvalue[currentObjectID] = 0;
          }
          if(objectValue == 10){
            inventory[6]++;
            objectxpos[currentObjectID] = 0;
            objectypos[currentObjectID] = 0;
            objectvalue[currentObjectID] = 0;
          }
        }
      }
    }
  }else if(scene == 0){
    if(keyCode == RIGHT){
      if(preset < 10){
        preset++;
      }
    } 
    if(keyCode == LEFT){
      if(preset > 0){
        preset--;
      }
    }
    if(keyCode == SHIFT){
      if(preset == 10){
        scene = 10;
      }else{
        scene = 1;
      }
    }
    if(keyCode == CONTROL){
      scene = 8;
    }
  }else if(scene == 10){
    if(keyCode == DOWN){
      if(leSelection < 5){
        leSelection++;
      }
    } 
    if(keyCode == UP){
      if(leSelection > 1){
        leSelection--;
      }
    }
    if(leSelection == 1){
      if(keyCode == RIGHT){
        if(x1 < 1.0){
          x1 += 0.1;
        }
      }
      if(keyCode == LEFT){
        if(x1 > 0.1){
          x1 -= 0.1;
        }
      }
    }else if(leSelection == 2){
      if(keyCode == RIGHT){
        if(x2 < 1.0){
          x2 += 0.1;
        }
      }
      if(keyCode == LEFT){
        if(x2 > 0.1){
          x2 -= 0.1;
        }
      }
    }else if(leSelection == 3){
      if(keyCode == RIGHT){
        if(x3 < 1.0){
          x3 += 0.1;
        }
      }
      if(keyCode == LEFT){
        if(x3 > 0.1){
          x3 -= 0.1;
        }
      }
    }else if(leSelection == 4){
      if(keyCode == RIGHT){
        if(x4 < 1.0){
          x4 += 0.1;
        }
      }
      if(keyCode == LEFT){
        if(x4 > 0.1){
          x4 -= 0.1;
        }
      }
    }else if(leSelection == 5){
      if(keyCode == RIGHT){
        if(x5 < 1.0){
          x5 += 0.1;
        }
      }
      if(keyCode == LEFT){
        if(x5 > 0.1){
          x5 -= 0.1;
        }
      }
    }
    if(keyCode == CONTROL){
      scene = 1;
    }
  }else if(scene == 5){
    if(keyCode == SHIFT){
      scene = 6;
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
    if(key == 'b' || key == 'B'){
      if(inventory[3] > 0){
        inventory[3]--;
        if(health < 16){
          health++;
        }
      }
    }
  }else if (scene == 8){
    if(keyCode == SHIFT){
      loadWorld();
    } else if(keyCode == ALT){
      textEntry = "";
    } else {
      textEntry = textEntry + key;
    }
  }
}
