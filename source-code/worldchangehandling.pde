int worldEvent = 0;
String[] worldEventNames = {"None","Bountiful Harvest","Beta Heatwave"};

void handleWorldChanges(){
  killCacti();
  if (worldEvent==0) {
    if(framecounter % 3 == 0 && random(1) > .88){
      thawIce(9900);
    }
    if(framecounter % 4 == 0 && random(1) > .88){
      regrowForest(4500,0.625);
    }
    if(framecounter % 5 == 0 && random(1) > .66){
      growApples(4500);
    }
  }else if (worldEvent==1) {
    if(framecounter % 3 == 0 && random(1) > .88){
      thawIce(9900);
    }
    if(framecounter % 4 == 0 && random(1) > .76){
      regrowForest(75000,0.375);
    }
    if(framecounter % 5 == 0 && random(1) > .66){
      growApples(9000);
    }
  }else if (worldEvent==2) {
    if(framecounter % 3 == 0 && random(1) > .88){
      thawIce(19900);
    }
    if(framecounter % 4 == 0 && random(1) > .78){
      witherForest(15000,0.625);
    }
  }
}

void witherForest(int iterations,float sensitivity){
  int o;int p;
  for(int i = 0; i < iterations; i++){
    o = int(random(mapSize));
    p = int(random(mapSize));
    if(map[o][p][0] == 14 && evaluateSurroundings(14,o,p,0) < sensitivity){
      map[o][p][0] = 15;
      //System.out.println("Regrew Forest at ("+ o + "," + p + ",0).");
    }else if(map[o][p][0] == 15 && evaluateSurroundings(14,o,p,0) < sensitivity){
      map[o][p][0] = 9;
      //System.out.println("Regrew Forest at ("+ o + "," + p + ",0).");
    }
  }
}

void regrowForest(int iterations,float sensitivity){
  int o;int p;
  for(int i = 0; i < iterations; i++){
    o = int(random(mapSize));
    p = int(random(mapSize));
    if((map[o][p][0] == 8 || map[o][p][0] == 9 || map[o][p][0] == 15)&& evaluateSurroundings(14,o,p,0) > sensitivity){
      map[o][p][0] = 14;
      //System.out.println("Regrew Forest at ("+ o + "," + p + ",0).");
    }
  }
}

void growApples(int iterations){
  int o;int p;
  for(int i = 0; i < iterations; i++){
    o = int(random(mapSize));
    p = int(random(mapSize));
    if(map[o][p][0] == 14 && evaluateSurroundings(-8,o,p,0) > 0.0){
      createSpecificObject(o,p,0,6);
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
