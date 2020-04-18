void collision(){
  lastxpos = xpos;
  lastypos = ypos;
  if(cSpeed > 1){
    if(xm > 0 && ym > 0){
      xm--;
      ym--;
    }else if(xm < 0 && ym > 0){
      xm++;
      ym--;
    }else if(xm > 0 && ym < 0){
      xm--;
      ym++;
    }else if(xm < 0 && ym < 0){
      xm++;
      ym++;
    }
  }
  if(xm > 0){
    xpos++;
    xm--;
  }else if(xm < 0){
    xpos--;
    xm++;
  }
  if(ym > 0){
    ypos++;
    ym--;
  }else if(ym < 0){
    ypos--;
    ym++;
  }
  
  drawTerrain();
  if((playerColor == 1 || playerColor == 4) && (tileValue <= 6 || tileValue >= 16) || playerColor == 2 && (tileValue <= 6 || tileValue > 16) || playerColor == 3 && (tileValue < 2 || tileValue >= 16)){
    xpos = lastxpos;
    ypos = lastypos;
    drawTerrain();
    if((playerColor == 1 || playerColor == 4) && (tileValue <= 6 || tileValue >= 16) || playerColor == 2 && (tileValue <= 6 || tileValue > 16) || playerColor == 3 && (tileValue < 2 || tileValue >= 16)){
      scene = 0;
    }
  }
  if(objectValue == 1){
    playerColor = 2;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 3){
    playerColor = 3;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 4){
    playerColor = 1;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  } else if(objectValue == 2){
    playerColor = 4;
    objectxpos[currentObjectID] = 0;
    objectypos[currentObjectID] = 0;
    objectvalue[currentObjectID] = 0;
  }
}
