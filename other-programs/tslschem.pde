int lx = 20; int ly = 20;
int[][] tiles = new int[lx][ly];
int xSel = 0; int ySel = 0; int brush = 8;
boolean flash = false;

void setup(){
  size(800,600);
  background(50);
  for(int i = 0; i < lx;i++){for(int j = 0; j < ly;j++){
      tiles[i][j] = 0;
  }}
}

void draw(){
  background(50);
  fill(50);
  stroke(0);
  rect(5,0,190,45);
  textSize(36);
  fill(155);
  text("Brush: " + brush,7,35);
  for(int i = 0; i < lx;i++){
    for(int j = 0; j < ly;j++){
      noStroke();
      if(tiles[i][j] == 0){if(flash){fill(130);}else{fill(150);}}
      else if(tiles[i][j] == 1){fill(250,10,10);}
      else if(tiles[i][j] == 2){fill(60);}
      else if(tiles[i][j] == 3){fill(70);}
      else if(tiles[i][j] == 4){fill(80);}
      else if(tiles[i][j] == 5){fill(95);}
      else if(tiles[i][j] == 6){fill(110);}
      else if(tiles[i][j] == 7){fill(155);}
      else if(tiles[i][j] == 8){fill(0,255,0);}
      else if(tiles[i][j] == 9){fill(0,245,0);}
      else if(tiles[i][j] == 10){fill(255,255,80);}
      else if(tiles[i][j] == 11){fill(240,240,100);}
      else if(tiles[i][j] == 12){fill(255);}
      else if(tiles[i][j] == 13){fill(225,235,245);}
      else if(tiles[i][j] == 14){fill(0,180 - 20 * (i % 2) - 20 * (j % 2),0);}
      else if(tiles[i][j] == 15){fill(0,220 - 20 * (j % 2) - 20 * (i % 2),0);}
      else if(tiles[i][j] == 16){fill(0,0,255);}
      else if(tiles[i][j] == 17){fill(0,0,240);}
      else if(tiles[i][j] == 18){fill(0,255,255);}
      else if(tiles[i][j] == -1){fill(145,99,7);}
      else if(tiles[i][j] == -2){fill(160);}
      else if(tiles[i][j] == -5){fill(245,149,98);}
      else if(tiles[i][j] == -6){fill(209,194,182);}
      else if(tiles[i][j] == -7){fill(111,125,113);}
      else if(tiles[i][j] == -8){fill(84,109,133);}
      else if(tiles[i][j] == -9){fill(86,199,30);}
      else if(tiles[i][j] == -10){fill(237,195,43);}
      else if(tiles[i][j] == -31){fill(117,96,28);}
      if(tiles[i][j] < 0){stroke(0);}
      if(i == xSel && j == ySel){
        if(flash){
          noStroke();
          fill(255);
          flash = false;
        }else{
          flash = true;
        }
      }
      rect(200+i*(600/lx),j*(600/ly),(600/lx),(600/ly));
    }
  }
}

void keyPressed(){
  if(keyCode == LEFT){
    if(xSel > 0){xSel--;}
  }
  if(keyCode == RIGHT){
    if(xSel < lx-1){xSel++;}
  }
  if(keyCode == UP){
    if(ySel > 0){ySel--;}
  }
  if(keyCode == DOWN){
    if(ySel < ly-1){ySel++;}
  }
  if(key == 'z' || key == 'Z'){
    if(brush == -31){
      brush = -10;
    }else if(brush > -11 && brush < -5){
      brush++;
    }else if(brush == -5){
      brush = -2;
    }else if(brush > -5 && brush < 18){
      brush++;
    }else if(brush == 18){
      brush = -31;
    }
  }
  if(key == ' '){
    tiles[xSel][ySel] = brush;
  }
  if(key == '<' || key == ','){
    String[] data = new String[lx*ly + 2];
    data[0] = lx + "";
    data[1] = ly + "";
    for(int i = 0; i < lx; i++){for(int j = 0; j < ly; j++){
      data[i*lx+j+2] = tiles[i][j] + "";
    }}
    saveStrings(int(1000 * random(1)) + "schematic.slschem",data);
  }
}
