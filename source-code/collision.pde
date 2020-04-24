void collision(){
  lastxpos = xpos;
  lastypos = ypos;
  if(xm > 0){
    xpos++;
    if(tileValue != 18 || (random(1) > .2)){
       xm--;
    }
  }else if(xm < 0){
    xpos--;
    if(tileValue != 18 || (random(1) > .2)){
       xm++;
    }
  }
  if(ym > 0){
    ypos++;
    if(tileValue != 18 || (random(1) > .2)){
       ym--;
    }
  }else if(ym < 0){
    ypos--;
    if(tileValue != 18 || (random(1) > .2)){
       ym++;
    }
  }
  if(playerColor == 5 && tileValue == 16){
    map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)][zpos] = 18;
    if(map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2)][zpos] == 16){
      map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2)][zpos] = 18;
    }
    if(map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2) + 1][zpos] == 16){
      map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2)+ 1][zpos] = 18;
    }
    if(map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2) + 1][zpos] == 16){
      map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)+ 1][zpos] = 18;
    }
    if(map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2)][zpos] == 16){
      map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2)][zpos] = 18;
    }
    if(map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2) - 1][zpos] == 16){
      map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2)- 1][zpos] = 18;
    }
    if(map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2) - 1][zpos] == 16){
      map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)- 1][zpos] = 18;
    }
    if(map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2) + 1][zpos] == 16){
      map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2)+ 1][zpos] = 18;
    }
    if(map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2) - 1][zpos] == 16){
      map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2)- 1][zpos] = 18;
    }
  }
  drawTerrain();
  if((playerColor == 1 || playerColor == 4) && (tileValue <= 6 || (tileValue >= 16 && tileValue < 18)) || (playerColor == 2 || playerColor == 5) && (tileValue <= 6 || tileValue == 17) || playerColor == 3 && (tileValue < 2 || (tileValue >= 16 && tileValue < 18))){
    xpos = lastxpos;
    ypos = lastypos;
    if(tileValue == 1){
      health--;
    }
    drawTerrain();
    if((playerColor == 1 || playerColor == 4) && (tileValue <= 6 || (tileValue >= 16 && tileValue < 18)) || (playerColor == 2 || playerColor == 5) && (tileValue <= 6 || tileValue == 17) || playerColor == 3 && (tileValue < 2 || (tileValue >= 16 && tileValue < 18))){
      if(framecounter == 0 && frameruleCounter % 2 == 0){
        health--;
      }  
    }
    
  }
  if(objectValue == 1){
    inventory[21]++;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 3){
    inventory[22]++;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 4){
    inventory[20]++;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 2){
    inventory[23]++;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 5){
    inventory[24]++;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 6){
    inventory[3]++;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 7){
    if(framecounter == 0 || framecounter == 3){
        health--;
    }
  } else if(objectValue == 11){
    if(framecounter == 0){
      if(zpos == 0){
        zpos++;
      }else{
        zpos--;
      }
      xm += 3;
      ym += 3;
    }
  }
  objectValue = 0;
}
