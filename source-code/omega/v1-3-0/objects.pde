final int objCap = 1000;
int[] objectxpos = new int[objCap];
int[] objectypos = new int[objCap];
int[] objectvalue = new int[objCap];

void drawObjects(){
  for(int o = 0; o < objCap; o++){
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
        } else {
          noFill();
        }
        if(i == (width/xFOV/2) && j == (height/xFOV/2) && objectvalue[o] > 0){
          objectValue = objectvalue[o];
          currentObjectID = o;
        } else {  
          ellipse(i * xFOV,j * xFOV,xFOV,xFOV);
        }
      }
    }}
  }
}

void createObjects(){
  for(int o = 0; o < objCap; o++){
    objectxpos[o] = int(random(4000));
    objectypos[o] = int(random(990));
    if(o % 4 == 0){
      objectvalue[o] = 1;
    } else if(o % 5 == 1){
      objectvalue[o] = 2;
    } else if(o % 5 == 2){
      objectvalue[o] = 3;
    } else if(o % 5 == 3){
      objectvalue[o] = 4;
    } else if(o % 5 == 4){
      objectvalue[o] = 5;
    }
  }
}

void countdown(){
  if(countdown >= 0){
    countdown--;
  }
  if(countdown == 0){
    playerColor = 1;
  }
}
