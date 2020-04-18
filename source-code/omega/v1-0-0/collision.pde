void collision(){
  lastxpos = xpos;
  lastypos = ypos;
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
  }else
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
  if(tileValue <= 6 || tileValue >= 16){
    xpos = lastxpos;
    ypos = lastypos;
    drawTerrain();
  }
  if(sprint){
    sprint = false;
  }
}
