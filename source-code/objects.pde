final int objCap = 1200;
int[] objectxpos = new int[objCap];
int[] objectypos = new int[objCap];
int[] objectvalue = new int[objCap];

void drawObjects(){
  for(int o = 0; o < objCap; o++){
    if(!(abs(objectxpos[o] - xpos) > (width / (xFOV/2)) || abs(objectypos[o] - ypos) > (height / xFOV))){
      for(int i = 0; i < (width / xFOV); i++){for(int j = 0; j < (height / xFOV); j++){
        if(objectxpos[o] == xpos+i && objectypos[o] == ypos+j){
          ellipseMode(CORNER);
          if(objectvalue[o] == 1){
            fill(50,50,200);
          } else if(objectvalue[o] == 2){
            fill(150,255,150);
          } else if(objectvalue[o] == 3){
            fill(50,100,50);
          } else if(objectvalue[o] == 4){
            fill(200,215,255);
          } else if(objectvalue[o] == 5){
            fill(0,255,255);
          } else if(objectvalue[o] == 6){
            fill(200,0,0);
          } else if(objectvalue[o] == 7){
            fill(0,150,0);
          } else if(objectvalue[o] == 8){
            fill(0);
          } else {
            noFill();
          }
          if(i == (width/xFOV/2) && j == (height/xFOV/2) && objectvalue[o] > 0){
            objectValue = objectvalue[o];
            currentObjectID = o;
          } else {  
            if(objectvalue[o] < 6){
              ellipse(i * xFOV,j * xFOV,xFOV,xFOV);
            }else if(objectvalue[o] == 6){
              rect(i * xFOV + 2,j * xFOV + 2,xFOV - 4,xFOV - 4);
            }else if(objectvalue[o] == 7){
              rect(i * xFOV + 1,j * xFOV + 1,xFOV - 2,xFOV - 2);
            }else if(objectvalue[o] == 8){
              rect(i * xFOV + objectxpos[o] % 6 + 1,j * xFOV + objectypos[o] % 5 + objectxpos[o] % 2,2,2);
              rect(i * xFOV + objectypos[o] % 5 + objectxpos[o] % 3,j * xFOV + objectxpos[o] % 6 + objectxpos[o] % 3,2,2);
              rect(i * xFOV + objectxpos[o] % 5 + objectypos[o] % 2,j * xFOV + objectypos[o] % 5 + 1,2,2);
              rect(i * xFOV + objectypos[o] % 5 + 3,j * xFOV + objectxpos[o] % 5 + 1,2,2);
              rect(i * xFOV + 2,j * xFOV + 2,2,2);
              rect(i * xFOV + xFOV - 2,j * xFOV + xFOV - 2,2,2);
            }
          }
        }
      }}
    }
  }
}

void createObjects(){
  for(int o = 0; o < objCap; o++){
    int loopEsc = 0;
    objectxpos[o] = int(random(mapSize - 50) + 25);
    objectypos[o] = int(random(mapSize - 50) + 25);
    loopEsc = 0;
    while(map[objectxpos[o]][objectypos[o]] == 1 || map[objectxpos[o]][objectypos[o]] == 17){
      objectxpos[o] = int(random(mapSize - 50) + 25);
      objectypos[o] = int(random(mapSize - 50) + 25);
      loopEsc++;
      if(loopEsc > 1000){
        objectvalue[o] = 0;
        break;
      }
    }
    objectvalue[o] = int(random(1,8.5));
    if(objectvalue[o] == 6){
      loopEsc = 0;
      while(!(map[objectxpos[o]][objectypos[o]] == 14)){
        objectxpos[o] = int(random(mapSize));
        objectypos[o] = int(random(mapSize));
        loopEsc++;
        if(loopEsc > 1000){
          objectvalue[o] = 0;
          break;
        }
      }
    }
    if(objectvalue[o] == 7){
      loopEsc = 0;
      while(!(map[objectxpos[o]][objectypos[o]] == 10)){
        objectxpos[o] = int(random(mapSize));
        objectypos[o] = int(random(mapSize));
        loopEsc++;
        if(loopEsc > 1000){
          objectvalue[o] = 0;
          break;
        }
      }
    }
    if(objectvalue[o] == 8){
      loopEsc = 0;
      while(!(map[objectxpos[o]][objectypos[o]] == 3 || map[objectxpos[o]][objectypos[o]] == 8 || map[objectxpos[o]][objectypos[o]] == 9)){
        objectxpos[o] = int(random(mapSize));
        objectypos[o] = int(random(mapSize));
        loopEsc++;
        if(loopEsc > 1000){
          objectvalue[o] = 0;
          break;
        }
      }
    }
    
    if(objectvalue[o] == 8){
      int szx = int(random(4,10.7));
      int szy = int(random(4,6.7));
      int tzt;
      if(map[objectxpos[o]][objectypos[o]] == 3){
        tzt = -2;
      }else{
        tzt = -1;
      }
      for(int i = 0; i < szx; i++){
        for(int j = 0; j < szy; j++){
          if(i == 0 || j == 0 || j == szy - 1 || i == szx - 1){
            map[(objectxpos[o] + i) % mapSize][(objectypos[o] + j) % mapSize] = tzt;
          }else{
            map[(objectxpos[o] + i) % mapSize][(objectypos[o] + j) % mapSize] = map[(objectxpos[o] + 1) % mapSize][(objectypos[o] + 1) % mapSize];
          }
        }
        
      }
      loopEsc = 0;
      while(!(map[objectxpos[o]][objectypos[o]] == 6)){
          objectxpos[o] = int(random(mapSize));
          objectypos[o] = int(random(mapSize));
          if(loopEsc > 1000){
            objectvalue[o] = 0;
            break;
          }
      }
    }
  }
}
