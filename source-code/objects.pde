final int objCap = 3420;
Object[] objects = new Object[objCap];

/* 
Object IDs

1: 
*/
public class Object{
  private int ox;private int oy;private int oz;private int oval;private boolean isActive;
  public Object(int xp,int yp,int zp,int val){
    ox=xp;
    oy=yp;
    oz=zp;
    oval=val;
    isActive=true;
  }
  public Object(boolean g){
    if(!g){
      ox=0;oy=0;oz=0;oval=0;isActive=false;
    }
  }
  void delete(){
    isActive=false;
    ox=0;oy=0;oz=0;oval=0;
  }
  boolean isActive(){
    return isActive;
  }
  int getX(){
    return ox;
  }
  int getY(){
    return oy;
  }
  int getZ(){
    return oz;
  }
  int getVal(){
    return oval;
  }
  void setX(int xp){
    ox=xp;
  }
  void setY(int yp){
    oy=yp;
  }
  void setZ(int zp){
    oz=zp;
  }
  void setVal(int val){
    oval=val;
  }
  String returnObjectDataAsString(){
    return ox + "," + oy + "," + oz + "," + oval;
  }
  public Object(String dataString){
    String[] data = dataString.split(",");
    ox = Integer.parseInt(data[0]);
    oy = Integer.parseInt(data[1]);
    oz = Integer.parseInt(data[2]);
    oval = Integer.parseInt(data[3]);
  }
}

void initializeObjects(){
  for(int o = 0; o < objCap; o++){
    objects[o] = new Object(false);
  }
}

void drawObjects(){
  for(int o = 0; o < objCap; o++){
    if(!(abs(objects[o].getX() - xpos) > (width / (xFOV/2)) || abs(objects[o].getY() - ypos) > (height / xFOV) || objects[o].getZ() != zpos) || objects[o].getVal() == 11 && abs(objects[o].getZ() - zpos) <= 1){
      for(int i = 0; i < (width / xFOV); i++){for(int j = 0; j < (height / xFOV); j++){
        if(objects[o].getX() == xpos+i && objects[o].getY() == ypos+j){
          ellipseMode(CORNER);
          if(objects[o].getVal() == 1){
            fill(50,50,200);
          } else if(objects[o].getVal() == 2){
            fill(150,255,150);
          } else if(objects[o].getVal() == -1){
            fill(117,16,163);
          } else if(objects[o].getVal() == 3){
            fill(50,100,50);
          } else if(objects[o].getVal() == 4){
            fill(200,215,255);
          } else if(objects[o].getVal() == 5){
            fill(0,255,255);
          } else if(objects[o].getVal() == 6){
            fill(200,0,0);
          } else if(objects[o].getVal() == 7){
            fill(0,150,0);
          } else if(objects[o].getVal() == 8){
            fill(0);
          } else if(objects[o].getVal() == 9){
            fill(232,142,81);
          } else if(objects[o].getVal() == 10){
            fill(171,138,116);
          } else if(objects[o].getVal() == 11){
            fill(60);
          } else if(objects[o].getVal() == 13){
            fill(155,185,145);
          } else if(objects[o].getVal() == 14){
            fill(58,80,120);
          } else if(objects[o].getVal() == 15){
            fill(117,255,48);
          } else if(objects[o].getVal() == 16){
            fill(237,237,40);
          } else {
            noFill();
          }
          if(i == (width/xFOV/2) && j == (height/xFOV/2) && objects[o].getVal() != 0){
            objectValue = objects[o].getVal();
            currentObjectID = o;
          } else {  
            if(objects[o].getVal() < 6){
              ellipse(i * xFOV,j * xFOV,xFOV,xFOV);
            }else if(objects[o].getVal() == 6){
              rect(i * xFOV + 2,j * xFOV + 2,xFOV - 4,xFOV - 4);
            }else if(objects[o].getVal() == 7){
              rect(i * xFOV + 1,j * xFOV + 1,xFOV - 2,xFOV - 2);
            }else if((objects[o].getVal() > 7 && objects[o].getVal() < 11) || (objects[o].getVal() > 12 && objects[o].getVal() < 17)){
              rect(i * xFOV + objects[o].getX() % 6 + 1,j * xFOV + objects[o].getY() % 5 + objects[o].getX() % 2,2,2);
              rect(i * xFOV + objects[o].getY() % 5 + objects[o].getX() % 3,j * xFOV + objects[o].getX() % 6 + objects[o].getX() % 3,2,2);
              rect(i * xFOV + objects[o].getX() % 5 + objects[o].getY() % 2,j * xFOV + objects[o].getY() % 5 + 1,2,2);
              rect(i * xFOV + objects[o].getY() % 5 + 3,j * xFOV + objects[o].getX() % 5 + 1,2,2);
              rect(i * xFOV + 5,j * xFOV + 5,2,2);
              rect(i * xFOV + 1,j * xFOV + 1,2,2);
              rect(i * xFOV + xFOV - 2,j * xFOV + xFOV - 2,2,2);
            }else if(objects[o].getVal() == 11){
              stroke(0);
              rect(i * xFOV + 1,j * xFOV + 1,xFOV - 2,xFOV - 2);
              noStroke();
            }
          }
        }
      }}
    }
  }
}

void createSpecificObject(int x,int y,int z,int value){
  for(int i = 0; i < objCap; i++){
    if(!objects[i].isActive()){
      objects[i] = new Object(x,y,z,value);
      break;
    }
  }
}

void createObjects(){
  int loopEsc = 0;
  for(int o = 0; o < objCap - 20; o++){
    objects[o].setX(int(random(mapSize - 50) + 25));
    objects[o].setY(int(random(mapSize - 50) + 25));
    loopEsc = 0;
    while(map[objects[o].getX()][objects[o].getY()][0] == 1 || map[objects[o].getX()][objects[o].getY()][0] == 17){
      objects[o].setX(int(random(mapSize - 50) + 25));
      objects[o].setY(int(random(mapSize - 50) + 25));
      loopEsc++;
      if(loopEsc > 1000){
        objects[o].delete();
        break;
      }
    }
    objects[o].setVal(int(random(1,8.5)));
    float randa = random(1);
    float randb = random(1);
    if(randa > .7){
      if(randb < .1){
        objects[o].setVal(5);
      }else if(randb < .3){
        objects[o].setVal(1);
      }else if(randb < .6){
        objects[o].setVal(3);
      }else if(randb < .9){
        objects[o].setVal(2);
      }else{
        objects[o].setVal(4);
      }
    }else if (randa > .2){
      if(randb < .2){
        objects[o].setVal(6);
      }else if(randb < .4){
        objects[o].setVal(7);
      }else if(randb < .65){
        objects[o].setVal(8);
      }else if(randb < .85){
        objects[o].setVal(9);
      }else if(randb < .95){
        objects[o].setVal(10);
      }else{
        objects[o].setVal(11);
      }
    }else{
      if(randb < .3){
        objects[o].setVal(14);
      }else if(randb < .75){
        objects[o].setVal(13);
      }else if(randb < .85){
        objects[o].setVal(16);
      }else{
        objects[o].setVal(15);
      }
    }    
    if(objects[o].getVal() == 6){
      loopEsc = 0;
      while(!(map[objects[o].getX()][objects[o].getY()][0] == 14)){
        objects[o].setX(int(random(mapSize)));
        objects[o].setY(int(random(mapSize)));
        loopEsc++;
        if(loopEsc > 1000){
          objects[o].delete();
          break;
        }
      }
    }
    if(objects[o].getVal() == 7){
      loopEsc = 0;
      while(!(map[objects[o].getX()][objects[o].getY()][0] == 10)){
        objects[o].setX(int(random(mapSize)));
        objects[o].setY(int(random(mapSize)));
        loopEsc++;
        if(loopEsc > 1000){
          objects[o].delete();
          break;
        }
      }
    }
    if(objects[o].getVal() == 8){
      loopEsc = 0;
      while(!(map[objects[o].getX()][objects[o].getY()][0] == 6)){
        objects[o].setX(int(random(mapSize)));
        objects[o].setY(int(random(mapSize)));
        loopEsc++;
        if(loopEsc > 1000){
          objects[o].delete();
          break;
        }
      }
    }
    if(objects[o].getVal() > 8){
      while(!(map[objects[o].getX()][objects[o].getY()][1] == 6)){
          objects[o].setX(int(random(mapSize)));
          objects[o].setY(int(random(mapSize)));
          loopEsc++;
          if(loopEsc > 1000){
            objects[o].delete();
            break;
          }
      }
    }
    if(objects[o].getVal() > 12 && objects[o].getVal() < 15){
      while(!(map[objects[o].getX()][objects[o].getY()][2] == 6)){
          objects[o].setX(int(random(mapSize)));
          objects[o].setY(int(random(mapSize)));
          loopEsc++;
          if(loopEsc > 1000){
            objects[o].delete();
            break;
          }
      }
    }
    if(objects[o].getVal() == 15){
      while(!(map[objects[o].getX()][objects[o].getY()][3] == 6)){
          objects[o].setX(int(random(mapSize)));
          objects[o].setY(int(random(mapSize)));
          loopEsc++;
          if(loopEsc > 1000){
            objects[o].delete();
            break;
          }
      }
    }
    if(objects[o].getVal() == 16){
      while(!(map[objects[o].getX()][objects[o].getY()][objects[o].getZ()] == 6)){
          objects[o].setX(int(random(mapSize)));
          objects[o].setY(int(random(mapSize)));
          objects[o].setZ(int(random(0,3.7)));
          loopEsc++;
          if(loopEsc > 1000){
            objects[o].delete();
            break;
          }
      }
    }
    if(objects[o].getVal() == 11){
      while(!(map[objects[o].getX()][objects[o].getY()][1] == 7 && (map[objects[o].getX()][objects[o].getY()][0] == 6 || map[objects[o].getX()][objects[o].getY()][0] == 7))){
          objects[o].setX(int(random(mapSize)));
          objects[o].setY(int(random(mapSize)));
          loopEsc++;
          if(loopEsc > 1000){
            objects[o].delete();
            break;
          }
      }
    }
    if(objects[o].getVal() == 3){
      if(random(1) > .45){
        objects[o].setZ(0);
      }else{
        objects[o].setZ(1);
        while(!(map[objects[o].getX()][objects[o].getY()][1] == 7)){
          objects[o].setX(int(random(mapSize)));
          objects[o].setY(int(random(mapSize)));
          loopEsc++;
          if(loopEsc > 1000){
            objects[o].delete();
            break;
          }
        }
      }
    }else if(objects[o].getVal() < 8 || objects[o].getVal() == 11){
      objects[o].setZ(0);
    }else if(objects[o].getVal() == 8){
      if(random(1) > .55){
        objects[o].setZ(0);
      }else{
        objects[o].setZ(1);
        while(!(map[objects[o].getX()][objects[o].getY()][1] == 6)){
          objects[o].setX(int(random(mapSize)));
          objects[o].setY(int(random(mapSize)));
          loopEsc++;
          if(loopEsc > 1000){
            objects[o].delete();
            break;
          }
        }
      }
    }else if(objects[o].getVal() > 8 && objects[o].getVal() < 11){
      objects[o].setZ(1);
    }else if(objects[o].getVal() > 12 && objects[o].getVal() < 15){
      objects[o].setZ(2);
    }else if(objects[o].getVal() == 15){
      objects[o].setZ(3);
    }
  }
}

void killCacti(){
  for(int i = 0; i < objCap; i++){
    if(objects[i].getVal() == 7 && objects[i].getZ() == 0){
      if(evaluateSurroundings(-9,objects[i].getX(),objects[i].getY(),0) > 0.0){
        objects[i].delete();
      }
    }
  }
}
