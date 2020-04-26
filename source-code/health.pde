void drawHealth(){
  if(health % 2 == 0 && health > 0){
    for(int i = 0; i < health / 2; i++){
      heart(20 + 50*i,10);
    }
  }else if(health % 2 == 1 && health > 0){
    int z = 0;
    for(int i = 0; i < health / 2; i++){
      heart(20 + 50*i,10);
      z = i;
    }
    halfheart(20 + 50*(z + 1),10);
  }
}

void heart(int x, int y){
  smooth();
  noStroke();
  fill(255,0,0);
  beginShape();
  vertex(x, y + 10);
  bezierVertex(x, y - 10, x + 40, y, x, y + 35);
  vertex(x, y + 10);
  bezierVertex(x, y - 10, x - 40, y, x, y + 35);
  endShape();
}

void halfheart(int x, int y){
  smooth();
  noStroke();
  fill(255,0,0);
  beginShape();
  vertex(x, y + 10);
  bezierVertex(x, y - 10, x - 40, y, x, y + 35);
  endShape();
}

void checkDeath(){
  if(health < 1){
    scene = 5;
    if(tState == 1){
      tState = 0;
    }
  }
}
