void collision(){
  if(inputEntryVert < -2 && inputEntryHorz > 2){
    xm += cSpeed;
    ym -= cSpeed;
    inputEntryVert++;
    inputEntryHorz--;
  }else if(inputEntryVert > 2 && inputEntryHorz > 2){
    xm += cSpeed;
    ym += cSpeed;
    inputEntryVert--;
    inputEntryHorz--;
  }else if(inputEntryVert < -2 && inputEntryHorz < -2){
    xm -= cSpeed;
    ym -= cSpeed;
    inputEntryVert++;
    inputEntryHorz++;
  }else if(inputEntryVert > 2 && inputEntryHorz < -2){
    xm -= cSpeed;
    ym += cSpeed;
    inputEntryVert--;
    inputEntryHorz++;
  }else{
    if(inputEntryVert < -4){
      ym -= cSpeed;
      inputEntryVert++;
    }else if(inputEntryVert < 0){
      inputEntryVert++;
    } 
    if(inputEntryVert > 4){
      ym += cSpeed;
      inputEntryVert--;
    }else if(inputEntryVert > 0){
      inputEntryVert--;
    } 
    if(inputEntryHorz > 4){
      xm += cSpeed;
      inputEntryHorz--;
    }else if(inputEntryHorz > 0){
      inputEntryHorz--;
    }
    if(inputEntryHorz < -4){
      xm -= cSpeed;
      inputEntryHorz++;
    }else if(inputEntryHorz < 0){
      inputEntryHorz++;
    }
  }
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
  if(playerColor == 6 && tileValue == 1){
    map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)][zpos] = 2;
    if(map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2)][zpos] == 1){
      map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2)][zpos] = 2;
    }
    if(map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2) + 1][zpos] == 1){
      map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2)+ 1][zpos] = 2;
    }
    if(map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2) + 1][zpos] == 1){
      map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)+ 1][zpos] = 2;
    }
    if(map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2)][zpos] == 1){
      map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2)][zpos] = 2;
    }
    if(map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2) - 1][zpos] == 1){
      map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2)- 1][zpos] = 2;
    }
    if(map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2) - 1][zpos] == 1){
      map[xpos + (width/xFOV/2)][ypos + (height/xFOV/2)- 1][zpos] = 2;
    }
    if(map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2) + 1][zpos] == 1){
      map[xpos + (width/xFOV/2) - 1][ypos + (height/xFOV/2)+ 1][zpos] = 2;
    }
    if(map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2) - 1][zpos] == 1){
      map[xpos + (width/xFOV/2) + 1][ypos + (height/xFOV/2)- 1][zpos] = 2;
    }
  }
  drawTerrain();
  if((playerColor == 1 || playerColor == 4) && (tileValue <= 6 || (tileValue >= 16 && tileValue < 18)) || (playerColor == 2 || playerColor == 5) && (tileValue <= 6 || tileValue == 17) || playerColor == 6 && (tileValue < 0) || playerColor == 3 && (tileValue < 2 || (tileValue >= 16 && tileValue < 18))){
    xpos = lastxpos;
    ypos = lastypos;
    if(tileValue == 1 || tileValue == -9){
      doDamage();
    }
    drawTerrain();
    if((playerColor == 1 || playerColor == 4) && (tileValue <= 6 || (tileValue >= 16 && tileValue < 18)) || (playerColor == 2 || playerColor == 5) && (tileValue <= 6 || tileValue == 17) || playerColor == 6 && (tileValue < 0) || playerColor == 3 && (tileValue < 2 || (tileValue >= 16 && tileValue < 18))){
      if(framecounter == 0 && frameruleCounter % 2 == 0){
        doDamage();
      }  
    }
    
  }
  if(objectValue == 1){
    inventory[21]++;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == -1){
    inventory[25]++;
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
      if(playerColor != 6){
        doDamage();
      }else{
        objectxpos[currentObjectID] = 0;
        objectypos[currentObjectID] = 0;
        objectvalue[currentObjectID] = 0;
      }
    }
  } else if(objectValue == 11){
    if(framecounter == 0){
      if(objectzpos[currentObjectID] <= 1){
        if(zpos == 0){
          zpos++;
        }else{
          zpos--;
        }
      }else if(objectzpos[currentObjectID] == 2){
        if(zpos == 1){
          zpos++;
        }else{
          zpos--;
        }
      }else if(objectzpos[currentObjectID] == 3){
        if(zpos == 2){
          zpos++;
        }else{
          zpos--;
        }
      }
      xm += 3;
      ym += 3;
    }
  }else if(objectValue == 12){
    if(tState == 0){
      tState = 1;
      whyDoIHearBossMusic();
      mobxpos[99] = tX + 10;
      mobypos[99] = tY + 10;
      mobzpos[99] = 1;
      mobvalue[99] = 6;
      mobhealth[99] = 100;
    }else if(tState == 1){
      whyDoIHearBossMusic();
    }
  }else if(objectValue == 15){
    if(framecounter == 0 || framecounter == 3){
      doDamage();
    }
  }
  objectValue = 0;
}
