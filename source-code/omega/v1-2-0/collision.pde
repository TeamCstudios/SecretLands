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
    map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)] = 18;
    if(map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2)] == 16){
      map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2)] = 18;
    }
    if(map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2) + 1] == 16){
      map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2)+ 1] = 18;
    }
    if(map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2) + 1] == 16){
      map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)+ 1] = 18;
    }
    if(map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2)] == 16){
      map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2)] = 18;
    }
    if(map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2) - 1] == 16){
      map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2)- 1] = 18;
    }
    if(map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2) - 1] == 16){
      map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)- 1] = 18;
    }
    if(map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2) + 1] == 16){
      map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2)+ 1] = 18;
    }
    if(map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2) - 1] == 16){
      map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2)- 1] = 18;
    }
  }
  drawTerrain();
  if((playerColor == 1 || playerColor == 4) && (tileValue <= 6 || (tileValue >= 16 && tileValue < 18)) || (playerColor == 2 || playerColor == 5) && (tileValue <= 6 || tileValue == 17) || playerColor == 3 && (tileValue < 2 || (tileValue >= 16 && tileValue < 18))){
    xpos = lastxpos;
    ypos = lastypos;
    drawTerrain();
    if((playerColor == 1 || playerColor == 4) && (tileValue <= 6 || (tileValue >= 16 && tileValue < 18)) || (playerColor == 2 || playerColor == 5) && (tileValue <= 6 || tileValue == 17) || playerColor == 3 && (tileValue < 2 || (tileValue >= 16 && tileValue < 18))){
      scene = 0;
    }
  }
  if(objectValue == 1){
    countdown = 2000;
    playerColor = 2;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 3){
    countdown = 2000;
    playerColor = 3;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 4){
    countdown = -1;
    playerColor = 1;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 2){
    countdown = 150;
    playerColor = 4;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 5){
    countdown = 1000;
    playerColor = 5;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  }
  objectValue = 0;
}
