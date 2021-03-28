final int mobCap = 100;
int[] mobxpos = new int[mobCap];
int[] mobypos = new int[mobCap];
int[] mobzpos = new int[mobCap];
int[] mobvalue = new int[mobCap];
int[] mobhealth = new int[mobCap];

void drawMobs(){
  for(int o = 0; o < mobCap; o++){
    if(!(abs(mobxpos[o] - xpos) > (width / (xFOV/2)) || abs(mobypos[o] - ypos) > (height / xFOV) || mobzpos[o] != zpos)){
      for(int i = 0; i < (width / xFOV); i++){for(int j = 0; j < (height / xFOV); j++){
        if(mobxpos[o] == xpos+i && mobypos[o] == ypos+j){
          noStroke();
          ellipseMode(CORNER);
          if(mobvalue[o] == 1){
            fill(0,255,0);
          } else if(mobvalue[o] == 2){
            fill(0,155,255);
          } else if(mobvalue[o] == 3){
            fill(255,50,0);
          } else if(mobvalue[o] == 4){
            fill(200,25,255);
          } else if(mobvalue[o] == 5){
            fill(63,82,61);
          } else if(mobvalue[o] == 6){
            fill(117,96,28);
          } else {
            noFill();
          }
          if(framecounter % 2 == 1 && attack && ((i == (width/xFOV/2) - 1 && j == (height/xFOV/2)) || (i == (width/xFOV/2) && j == (height/xFOV/2) - 1) || (i == (width/xFOV/2) + 1 && j == (height/xFOV/2)) || (i == (width/xFOV/2) && j == (height/xFOV/2) + 1))){
            stroke(255,0,0);
            mobhealth[o]-= attackPower;
            if(mobhealth[o] < 1){
              if(mobvalue[o] == 1){
                inventory[26]++;
              }else if(mobvalue[o] == 2){
                inventory[27]++;
              }else if(mobvalue[o] == 3){
                inventory[28]++;
              }else if(mobvalue[o] == 4){
                inventory[29]++;
              }else if(mobvalue[o] == 5){
                inventory[2]++;
              }else if(mobvalue[o] == 6){
                caves();
                tState = 2;
                objectxpos[objCap - 6] = tX + 10;
                objectypos[objCap - 6] = tY + 1;
                objectzpos[objCap - 6] = 1;
                objectvalue[objCap - 6] = -1;
                objectxpos[objCap - 5] = tX + 10;
                objectypos[objCap - 5] = tY + 1;
                objectzpos[objCap - 5] = 1;
                objectvalue[objCap - 5] = -1;
                objectxpos[objCap - 4] = tX + 10;
                objectypos[objCap - 4] = tY + 1;
                objectzpos[objCap - 4] = 1;
                objectvalue[objCap - 4] = -1;
                objectxpos[objCap - 3] = tX + 10;
                objectypos[objCap - 3] = tY + 1;
                objectzpos[objCap - 3] = 1;
                objectvalue[objCap - 3] = -1;
                objectxpos[objCap - 2] = tX + 10;
                objectypos[objCap - 2] = tY + 1;
                objectzpos[objCap - 2] = 1;
                objectvalue[objCap - 2] = -1;
                objectxpos[objCap - 1] = tX + 10;
                objectypos[objCap - 1] = tY + 1;
                objectzpos[objCap - 1] = 1;
                objectvalue[objCap - 1] = -1;
              }
            }
          }else{
            stroke(0);
          }
          if(i == (width/xFOV/2) && j == (height/xFOV/2) && mobvalue[o] > 0){
            if(framecounter % 2 == 0){
              if(playerColor != 6){
                doDamage();
                if(random(1) > .5){
                  if(random(1) > .5){
                    mobxpos[o]++;
                  }else{
                    mobypos[o]++;
                  }
                }else{
                  if(random(1) > .5){
                    mobxpos[o]--;
                  }else{
                    mobypos[o]--;
                  }
                }
              }else{
                mobhealth[o]--;
              }
            }
          } else {  
            if(mobvalue[o] < 5){
              ellipse(i * xFOV,j * xFOV,xFOV,xFOV/2);
            }else if(mobvalue[o] == 5){
              ellipse(i * xFOV+1,j * xFOV,xFOV-2,xFOV);
            }else if(mobvalue[o] == 6){
              ellipse(i * xFOV-1,j * xFOV,xFOV+2,xFOV-2);
            }
          }
          if(mobhealth[o] < 1){
            mobxpos[o] = 0;
            mobypos[o] = 0;
            mobzpos[o] = 0;
            mobvalue[o] = 0;
          }
        }
      }}
    }else if((abs(mobxpos[o] - xpos) > (width / (xFOV/2)) * 2 || abs(mobypos[o] - ypos) > (height / xFOV) * 2 || mobzpos[o] != zpos) && mobvalue[o] != 6){
      mobxpos[o] = 0;
      mobypos[o] = 0;
      mobzpos[o] = 0;
      mobvalue[o] = 0;
    }
  }
  noStroke();
}

void moveMobs(){
  int newx; int newy;
  for(int o = 0; o < mobCap; o++){
    newx = mobxpos[o];
    newy = mobypos[o];
    if(mobvalue[o] != 0){
      float randa = random(1);
      float randb = random(1);
      if(mobvalue[o] < 5){
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
      }else if(mobvalue[o] == 5){
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
      }else if(mobvalue[o] == 6){
        if(!(abs(mobxpos[o] - xpos) > (width / (xFOV/2)) || abs(mobypos[o] - ypos) > (height / xFOV) || mobzpos[o] != zpos)){
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
            objectxpos[objCap - 6] = tX + int(random(1,20));
            objectypos[objCap - 6] = tY + int(random(1,20));
            objectzpos[objCap - 6] = 1;
            objectvalue[objCap - 6] = 7;
            objectxpos[objCap - 5] = tX + int(random(1,20));
            objectypos[objCap - 5] = tY + int(random(1,20));
            objectzpos[objCap - 5] = 1;
            objectvalue[objCap - 5] = 7;
            objectxpos[objCap - 4] = tX + int(random(1,20));
            objectypos[objCap - 4] = tY + int(random(1,20));
            objectzpos[objCap - 4] = 1;
            objectvalue[objCap - 4] = 7;
            objectxpos[objCap - 3] = tX + int(random(1,20));
            objectypos[objCap - 3] = tY + int(random(1,20));
            objectzpos[objCap - 3] = 1;
            objectvalue[objCap - 3] = 7;
            objectxpos[objCap - 2] = tX + int(random(1,20));
            objectypos[objCap - 2] = tY + int(random(1,20));
            objectzpos[objCap - 2] = 1;
            objectvalue[objCap - 2] = 7;
            objectxpos[objCap - 1] = tX + int(random(1,20));
            objectypos[objCap - 1] = tY + int(random(1,20));
            objectzpos[objCap - 1] = 1;
            objectvalue[objCap - 1] = 7;
          }
        }
      }
      if(mobvalue[o] == 1){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] <= 6 || (map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] >= 16 && map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] < 18))){
          mobxpos[o] = newx;
          mobypos[o] = newy;
        }
      }else if(mobvalue[o] == 2){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] <= 6 || (map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] > 16 && map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] < 18))){
          mobxpos[o] = newx;
          mobypos[o] = newy;
        }
      }else if(mobvalue[o] == 3){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] <= 6 || (map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] >= 16 && map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] < 18))){
          mobxpos[o] = newx;
          mobypos[o] = newy;
        }
      }else if(mobvalue[o] == 4){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] <= 1)){
          mobxpos[o] = newx;
          mobypos[o] = newy;
        }
      }else if(mobvalue[o] == 5){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] < 0)){
          mobxpos[o] = newx;
          mobypos[o] = newy;
        }
      }else if(mobvalue[o] == 6){
        if(!(map[abs(newx % mapSize)][abs(newy % mapSize)][zpos] < 0)){
          mobxpos[o] = newx;
          mobypos[o] = newy;
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
    if(mobvalue[o] == 0 && zpos == 0){
      mobvalue[o] = int(random(1,4.3));
      test = true;
      mobxpos[o] = xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2);
      mobypos[o] = ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2);
      if(mobvalue[o] == 1){
        mobhealth[o] = 12;
        while(map[abs(mobxpos[o] % mapSize)][abs(mobypos[o] % mapSize)][zpos] <= 6 || (map[abs(mobxpos[o] % mapSize)][abs(mobypos[o] % mapSize)][zpos] >= 16 && map[abs(mobxpos[o] % mapSize)][abs(mobypos[o] % mapSize)][zpos] < 18)){
          mobxpos[o] = xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2);
          mobypos[o] = ypos + (-1 * o % 2) * int(random(20,40)) + (-1 * o % 2) * (height/xFOV/2);
          loopEsc++;
          if(loopEsc > 1000){
            mobvalue[o] = 0;
            break;
          }
        }
      }else if(mobvalue[o] == 2){
        mobhealth[o] = 10;
        while(map[abs(mobxpos[o] % mapSize)][abs(mobypos[o] % mapSize)][zpos] <= 6 || (map[abs(mobxpos[o] % mapSize)][abs(mobypos[o] % mapSize)][zpos] > 16 && map[abs(mobxpos[o] % mapSize)][abs(mobypos[o] % mapSize)][zpos] < 18)){
          mobxpos[o] = xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2);
          mobypos[o] = ypos + (-1 * o % 2) * int(random(20,40)) + (-1 * o % 2) * (height/xFOV/2);
          loopEsc++;
          if(loopEsc > 1000){
            mobvalue[o] = 0;
            break;
          }
        }
      }else if(mobvalue[o] == 3){
        mobhealth[o] = 15;
        while(map[abs(mobxpos[o] % mapSize)][abs(mobypos[o] % mapSize)][zpos] <= 6 || (map[abs(mobxpos[o] % mapSize)][abs(mobypos[o] % mapSize)][zpos] >= 16 && map[abs(mobxpos[o] % mapSize)][abs(mobypos[o] % mapSize)][zpos] < 18)){
          mobxpos[o] = xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2);
          mobypos[o] = ypos + (-1 * o % 2) * int(random(20,40)) + (-1 * o % 2) * (height/xFOV/2); 
          loopEsc++;
          if(loopEsc > 1000){
            mobvalue[o] = 0;
            break;
          }
        }
      }else if(mobvalue[o] == 4){
        mobhealth[o] = 20;
        while(map[abs(mobxpos[o] % mapSize)][abs(mobypos[o] % mapSize)][zpos] <= 1){
          mobxpos[o] = xpos + (-1 * framecounter % 2) * int(random(1,20)) + (-1 * framecounter % 2) * (width/xFOV/2);
          mobypos[o] = ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2);
          loopEsc++;
          if(loopEsc > 1000){
            mobvalue[o] = 0;
            break;
          }
        }
      }
    }else if(mobvalue[o] == 0 && zpos == 1){
      mobvalue[o] = 5;
      test = true;
      mobxpos[o] = xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2);
      mobypos[o] = ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2);
      if(mobvalue[o] == 5){
      mobhealth[o] = 30;
        while(map[abs(mobxpos[o] % mapSize)][abs(mobypos[o] % mapSize)][zpos] < 0){
          mobxpos[o] = xpos + (-1 * framecounter % 2) * int(random(1,20)) + (-1 * framecounter % 2) * (width/xFOV/2);
          mobypos[o] = ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2);
          loopEsc++;
          if(loopEsc > 1000){
            mobvalue[o] = 0;
            break;
          }
        }
      }
    }else if(mobvalue[o] == 0 && zpos == 2){
      mobvalue[o] = 5;
      test = true;
      mobxpos[o] = xpos + (-1 * framecounter % 2) * int(random(20,40)) + (-1 * framecounter % 2) * (width/xFOV/2);
      mobypos[o] = ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2);
      if(mobvalue[o] == 5){
      mobhealth[o] = 70;
        while(map[abs(mobxpos[o] % mapSize)][abs(mobypos[o] % mapSize)][zpos] < 0){
          mobxpos[o] = xpos + (-1 * framecounter % 2) * int(random(1,20)) + (-1 * framecounter % 2) * (width/xFOV/2);
          mobypos[o] = ypos + (-1 * o % 2) * int(random(1,20)) + (-1 * o % 2) * (height/xFOV/2);
          loopEsc++;
          if(loopEsc > 1000){
            mobvalue[o] = 0;
            break;
          }
        }
      }
    }
    if(mobvalue[o] != 0 && test){
      mobzpos[o] = zpos;
      break;
    }
  }
}
