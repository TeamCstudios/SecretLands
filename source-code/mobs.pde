final int mobCap = 150;
Mob[] mobs = new Mob[mobCap];

public class Mob{
  private int mx;private int my;private int mz;private int mval;private int mh;private boolean isActive;
  public Mob(int xp,int yp,int zp,int val,int hp){
    mx=xp;
    my=yp;
    mz=zp;
    mval=val;
    mh=hp;
    isActive=true;
  }
  public Mob(boolean g){
    if(!g){
      mx=0;my=0;mz=0;mval=0;mh=0;isActive=false;
    }
  }
  void delete(){
    isActive=false;
    mx=0;my=0;mz=0;mh=0;mval=0;
  }
  boolean isActive(){
    return isActive;
  }
  int getX(){
    return mx;
  }
  int getY(){
    return my;
  }
  int getZ(){
    return mz;
  }
  int getVal(){
    return mval;
  }
  int getHealth(){
    return mh;
  }
  void setX(int xp){
    mx=xp;
  }
  void setY(int yp){
    my=yp;
  }
  void setZ(int zp){
    mz=zp;
  }
  void setVal(int val){
    mval=val;
  }
  void setHealth(int zh){
    mh=zh;
  }
  String returnMobDataAsString(){
    return mx + "," + my + "," + mz + "," + mval + "," + mh;
  }
  public Mob(String dataString){
    String[] data = dataString.split(",");
    mx = Integer.parseInt(data[0]);
    my = Integer.parseInt(data[1]);
    mz = Integer.parseInt(data[2]);
    mval = Integer.parseInt(data[3]);
    mh = Integer.parseInt(data[4]);
  }
}


void initializeMobs(){
  for(int o = 0; o < mobCap; o++){
    mobs[o] = new Mob(false);
  }
}

void drawMobs(){
  for(int o = 0; o < mobCap; o++){
    if(!(abs(mobs[o].getX() - xpos) > (width / (xFOV/2)) || abs(mobs[o].getY() - ypos) > (height / xFOV) || mobs[o].getZ() != zpos)){
      for(int i = 0; i < (width / xFOV); i++){for(int j = 0; j < (height / xFOV); j++){
        if(mobs[o].getX() == xpos+i && mobs[o].getY() == ypos+j){
          noStroke();
          ellipseMode(CORNER);
          if(mobs[o].getVal() == 1){
            fill(0,255,0);
          } else if(mobs[o].getVal() == 2){
            fill(0,155,255);
          } else if(mobs[o].getVal() == 3){
            fill(255,50,0);
          } else if(mobs[o].getVal() == 4){
            fill(200,25,255);
          } else if(mobs[o].getVal() == 5){
            if(mobs[o].getZ() < 3){
              fill(63,82,61);
            }else if(mobs[o].getZ() == 3){
              fill(83,112,81);
            }
          } else if(mobs[o].getVal() == 6){
            fill(117,96,28);
          } else if(mobs[o].getVal() == 7){
            fill(102,184,51);
          } else {
            noFill();
          }
          if(framecounter % 2 == 1 && attack && ((i == (width/xFOV/2) - 1 && j == (height/xFOV/2)) || (i == (width/xFOV/2) && j == (height/xFOV/2) - 1) || (i == (width/xFOV/2) + 1 && j == (height/xFOV/2)) || (i == (width/xFOV/2) && j == (height/xFOV/2) + 1))){
            stroke(255,0,0);
            mobs[o].setHealth(mobs[o].getHealth()-attackPower);
            if(mobs[o].getHealth() < 1){
              if(mobs[o].getVal() == 1){
                inventory[26]++;
              }else if(mobs[o].getVal() == 2){
                inventory[27]++;
              }else if(mobs[o].getVal() == 3){
                inventory[28]++;
              }else if(mobs[o].getVal() == 4){
                inventory[29]++;
              }else if(mobs[o].getVal() == 5){
                inventory[2]++;
              }else if(mobs[o].getVal() == 7){
                inventory[6]+=5;
                for(int b = 0;b < int(progress/3000) + 3;b++){
                  spawnMob();
                }
              }else if(mobs[o].getVal() == 6){
                caves();
                tState = 2;
                objects[objCap - 6] = new Object(tX + 10,tY + 1,1,-1);
                objects[objCap - 5] = new Object(tX + 10,tY + 1,1,-1);
                objects[objCap - 4] = new Object(tX + 10,tY + 1,1,-1);
                objects[objCap - 3] = new Object(tX + 10,tY + 1,1,-1);
                objects[objCap - 2] = new Object(tX + 10,tY + 1,1,-1);
                objects[objCap - 1] = new Object(tX + 10,tY + 1,1,-1);
              }
            }
          }else{
            stroke(0);
          }
          if(i == (width/xFOV/2) && j == (height/xFOV/2) && mobs[o].getVal() > 0){
            if(framecounter % 2 == 0){
              if(playerColor != 6){
                doDamage();
                if(random(1) > .5){
                  if(random(1) > .5){
                    mobs[o].setX(mobs[o].getX()+1);
                  }else{
                    mobs[o].setY(mobs[o].getY()+1);
                  }
                }else{
                  if(random(1) > .5){
                    mobs[o].setX(mobs[o].getX()-1);
                  }else{
                    mobs[o].setY(mobs[o].getY()-1);
                  }
                }
              }else{
                mobs[o].setHealth(mobs[o].getHealth()-1);
              }
            }
          } else {  
            if(mobs[o].getVal() < 5){
              ellipse(i * xFOV,j * xFOV,xFOV,xFOV/2);
            }else if(mobs[o].getVal() == 5){
              ellipse(i * xFOV+1,j * xFOV,xFOV-2,xFOV);
            }else if(mobs[o].getVal() == 6 || mobs[o].getVal() == 7){
              ellipse(i * xFOV-1,j * xFOV,xFOV+2,xFOV-2);
            }
          }
          if(mobs[o].getHealth() < 1){
            mobs[o].delete();
          }
        }
      }}
    }else if((abs(mobs[o].getX() - xpos) > (width / (xFOV/2)) * 2 || abs(mobs[o].getY() - ypos) > (height / xFOV) * 2 || mobs[o].getZ() != zpos) && mobs[o].getVal() != 6){
      mobs[o].delete();
    }
  }
  noStroke();
}

void moveMobs(){
  int newx; int newy;
  for(int o = 0; o < mobCap; o++){
    newx = mobs[o].getX();
    newy = mobs[o].getY();
    if(mobs[o].getVal() != 0){
      float randa = random(1);
      float randb = random(1);
      if(mobs[o].getVal() < 5){
        if(randa > .3){
          if(xpos + (width/xFOV/2) < newx){
            newx--;
          }else if(xpos + (width/xFOV/2) > newx){
            newx++;
          }else if(ypos + (height/xFOV/2) < newy){
            newy--;
          }else if(ypos + (height/xFOV/2) > newy){
            newy++;
          }
        }else if(randa > .15){
          if(ypos + (height/xFOV/2) < newy){
            newy--;
          }else if(ypos + (height/xFOV/2) > newy){
            newy++;
          }else if(xpos + (width/xFOV/2) < newx){
            newx--;
          }else if(xpos + (width/xFOV/2) > newx){
            newx++;
          }
        }
      }else if(mobs[o].getVal() == 7){
        if(random(1) > .5){
          if(xpos + (width/xFOV/2) < newx){
            newx--;
          }else if(xpos + (width/xFOV/2) > newx){
            newx++;
          }else if(ypos + (height/xFOV/2) < newy){
            newy--;
          }else if(ypos + (height/xFOV/2) > newy){
            newy++;
          }
        }
        if(random(1) > .5){
          if(ypos + (height/xFOV/2) < newy){
            newy--;
          }else if(ypos + (height/xFOV/2) > newy){
            newy++;
          }else if(xpos + (width/xFOV/2) < newx){
            newx--;
          }else if(xpos + (width/xFOV/2) > newx){
            newx++;
          }
        }
      }else if(mobs[o].getVal() == 5){
        if(randa > .2){
          if(xpos + (width/xFOV/2) < newx){
            newx--;
          }else if(xpos + (width/xFOV/2) > newx){
            newx++;
          }
          if(ypos + (height/xFOV/2) < newy){
            newy--;
          }else if(ypos + (height/xFOV/2) > newy){
            newy++;
          }
        }else{
          if(xpos + (width/xFOV/2) < newx){
            newx++;
          }else if(xpos + (width/xFOV/2) > newx){
            newy--;
          }
          if(ypos + (height/xFOV/2) < newy){
            newx++;
          }else if(ypos + (height/xFOV/2) > newy){
            newy++;
          }
        }
        if(mobs[o].getZ() == 3){
          if(randa > .2){
            if(xpos + (width/xFOV/2) < newx){
              newx--;
            }else if(xpos + (width/xFOV/2) > newx){
              newx++;
            }
            if(ypos + (height/xFOV/2) < newy){
              newy--;
            }else if(ypos + (height/xFOV/2) > newy){
              newy++;
            }
          }else{
            if(xpos + (width/xFOV/2) < newx){
              newx++;
            }else if(xpos + (width/xFOV/2) > newx){
              newy--;
            }
            if(ypos + (height/xFOV/2) < newy){
              newx++;
            }else if(ypos + (height/xFOV/2) > newy){
              newy++;
            }
          }
        }
      }else if(mobs[o].getVal() == 6){
        if(!(abs(mobs[o].getX() - xpos) > (width / (xFOV/2)) || abs(mobs[o].getY() - ypos) > (height / xFOV) || mobs[o].getZ() != zpos)){
          if(randa > .6){
            if(xpos + (width/xFOV/2) < newx){
              newx--;
            }else if(xpos + (width/xFOV/2) > newx){
              newx++;
            }
            if(ypos + (height/xFOV/2) < newy){
              newy--;
            }else if(ypos + (height/xFOV/2) > newy){
              newy++;
            }
          }else if(randa > .4){
            if(randb > .75){
              newx = tX + 3;
              newy = tY + 10;
            }else if(randb > .5){
              newx = tX + 17;
              newy = tY + 10;
            }else if(randb > .25){
              newx = tX + 10;
              newy = tY + 3;
            }else{
              newx = tX + 10;
              newy = tY + 17;
            }
          }else if(randa > .35){
            objects[objCap - 6] = new Object(tX + int(random(1,20)),tY + int(random(1,20)),1,7);
            objects[objCap - 5] = new Object(tX + int(random(1,20)),tY + int(random(1,20)),1,7);
            objects[objCap - 4] = new Object(tX + int(random(1,20)),tY + int(random(1,20)),1,7);
            objects[objCap - 3] = new Object(tX + int(random(1,20)),tY + int(random(1,20)),1,7);
            objects[objCap - 2] = new Object(tX + int(random(1,20)),tY + int(random(1,20)),1,7);
            objects[objCap - 1] = new Object(tX + int(random(1,20)),tY + int(random(1,20)),1,7);
          }
        }
      }
      if(mobs[o].getVal() == 1){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] <= 6 || (map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] >= 16 && map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] < 18))){
          mobs[o].setX(newx);
          mobs[o].setY(newy);
        }else if(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] == -9){
          mobs[o].setHealth(mobs[o].getHealth()-5);
        }
      }else if(mobs[o].getVal() == 2){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] <= 6 || (map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] > 16 && map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] < 18))){
          mobs[o].setX(newx);
          mobs[o].setY(newy);
        }else if(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] == -9){
          mobs[o].setHealth(mobs[o].getHealth()-5);
        }
      }else if(mobs[o].getVal() == 3){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] <= 6 || (map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] >= 16 && map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] < 18))){
          mobs[o].setX(newx);
          mobs[o].setY(newy);
        }else if(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] == -9){
          mobs[o].setHealth(mobs[o].getHealth()-5);
        }
      }else if(mobs[o].getVal() == 4){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] <= 1)){
          mobs[o].setX(newx);
          mobs[o].setY(newy);
        }else if(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] == -9){
          mobs[o].setHealth(mobs[o].getHealth()-5);
        }
      }else if(mobs[o].getVal() == 5){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] < 0)){
          mobs[o].setX(newx);
          mobs[o].setY(newy);
        }else if(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] == -9){
          mobs[o].setHealth(mobs[o].getHealth()-5);
        }
      }else if(mobs[o].getVal() == 6){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] < 0)){
          mobs[o].setX(newx);
          mobs[o].setY(newy);
        }else if(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] == -9){
          mobs[o].setHealth(mobs[o].getHealth()-5);
        }
      }else if(mobs[o].getVal() == 7){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] <= 6 || (map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] >= 16 && map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] < 18))){
          mobs[o].setX(newx);
          mobs[o].setY(newy);
        }else if(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] == -9){
          mobs[o].setHealth(mobs[o].getHealth()-5);
        }else if(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] == -9){
          map[newx][newy][mobs[o].getZ()] = map[mobs[o].getX()][mobs[o].getY()][mobs[o].getZ()];
          mobs[o].delete();
        }else if(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] < 0 && map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] > -9){
          if(random(1) > .65 + 0.03*(-1*map[newx][newy][mobs[o].getZ()])){
            map[newx][newy][mobs[o].getZ()] = map[mobs[o].getX()][mobs[o].getY()][mobs[o].getZ()];
          }
        }
      }
    }
  }
}

void spawnMob(){
  boolean test = false;
  int loopEsc = 0;
  for(int o = 0; o < mobCap; o++){
    test = false;
    if(!mobs[o].isActive() && zpos == 0 && progress > 1000 && random(1) > .5){
      mobs[o] = new Mob(xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2),ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2),1,7,int(65 * (difficulty/.5)) + int(progress/255));
      test = true;
      if(mobs[o].getVal() == 7){
        while(map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] <= 6 || (map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] >= 16 && map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] < 18)){
          mobs[o].setX(xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2));
          mobs[o].setY(ypos + (-1 * o % 2) * int(random(20,40)) + (-1 * o % 2) * (height/xFOV/2));
          loopEsc++;
          if(loopEsc > 1000){
            mobs[o].delete();
            break;
          }
        }
      }
    }else if(mobs[o].getVal() == 0 && zpos == 0){
      mobs[o] = new Mob(xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2),ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2),zpos,int(random(1,4.3)),1);
      test = true;
      if(mobs[o].getVal() == 1){
        mobs[o].setHealth(int(12 * (difficulty/.5)));
        while(map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] <= 6 || (map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] >= 16 && map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] < 18)){
          mobs[o].setX(xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2));
          mobs[o].setY(ypos + (-1 * o % 2) * int(random(20,40)) + (-1 * o % 2) * (height/xFOV/2));
          loopEsc++;
          if(loopEsc > 1000){
            mobs[o].delete();
            break;
          }
        }
      }else if(mobs[o].getVal() == 2){
        mobs[o].setHealth(int(10 * (difficulty/.5)));
        while(map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] <= 6 || (map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] > 16 && map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] < 18)){
          mobs[o].setX(xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2));
          mobs[o].setY(ypos + (-1 * o % 2) * int(random(20,40)) + (-1 * o % 2) * (height/xFOV/2));
          loopEsc++;
          if(loopEsc > 1000){
            mobs[o].delete();
            break;
          }
        }
      }else if(mobs[o].getVal() == 3){
        mobs[o].setHealth(int(15 * (difficulty/.5)));
        while(map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] <= 6 || (map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] >= 16 && map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] < 18)){
          mobs[o].setX(xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2));
          mobs[o].setY(ypos + (-1 * o % 2) * int(random(20,40)) + (-1 * o % 2) * (height/xFOV/2)); 
          loopEsc++;
          if(loopEsc > 1000){
            mobs[o].delete();
            break;
          }
        }
      }else if(mobs[o].getVal() == 4){
        mobs[o].setHealth(int(20 * (difficulty/.5)));
        while(map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] <= 1){
          mobs[o].setX(xpos + (-1 * framecounter % 2) * int(random(1,20)) + (-1 * framecounter % 2) * (width/xFOV/2));
          mobs[o].setY(ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2));
          loopEsc++;
          if(loopEsc > 1000){
            mobs[o].delete();
            break;
          }
        }
      }
    }else if(mobs[o].getVal() == 0 && zpos == 1){
      mobs[o] = new Mob(xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2),ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2),zpos,5,int(30 * (difficulty/.5)));
      test = true;
      if(mobs[o].getVal() == 5){
        while(map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] < 0){
          mobs[o].setX(xpos + (-1 * framecounter % 2) * int(random(1,20)) + (-1 * framecounter % 2) * (width/xFOV/2));
          mobs[o].setY(ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2));
          loopEsc++;
          if(loopEsc > 1000){
            mobs[o].delete();
            break;
          }
        }
      }
    }else if(mobs[o].getVal() == 0 && zpos == 2){
      mobs[o] = new Mob(xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2),ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2),zpos,5,int(70 * (difficulty/.5)));
      test = true;
      if(mobs[o].getVal() == 5){
        while(map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] < 0){
          mobs[o].setX(xpos + (-1 * framecounter % 2) * int(random(1,20)) + (-1 * framecounter % 2) * (width/xFOV/2));
          mobs[o].setY(ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2));
          loopEsc++;
          if(loopEsc > 1000){
            mobs[o].delete();
            break;
          }
        }
      }
    }else if(mobs[o].getVal() == 0 && zpos == 3){
      mobs[o] = new Mob(xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2),ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2),zpos,5,int(80 * (difficulty/.5)));
      test = true;
      if(mobs[o].getVal() == 5){
        while(map[abs(mobs[o].getX() % mapSize)][abs(mobs[o].getY() % mapSize)][zpos] < 0){
          mobs[o].setX(xpos + (-1 * framecounter % 2) * int(random(1,20)) + (-1 * framecounter % 2) * (width/xFOV/2));
          mobs[o].setY(ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2));
          loopEsc++;
          if(loopEsc > 1000){
            mobs[o].delete();
            break;
          }
        }
      }
    }
    if(mobs[o].getVal() != 0 && test){
      mobs[o].setZ(zpos);
      break;
    }
  }
}

void spawnSpecificMob(int x,int y,int z,int id){
  for(int o = 0; o < mobCap; o++){
    if(mobs[o].isActive()){
      mobs[o] = new Mob(x,y,z,id,1);
    }
  }
}
