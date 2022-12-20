void thawIce(int iterations){
  int o;int p;
  for(int i = 0; i < iterations; i++){
    o = int(random(mapSize));
    p = int(random(mapSize));
    if(map[o][p][0] == 18 && evaluateSurroundings(18,o,p,0) < 0.5){
      map[o][p][0] = 16;
      //System.out.println("Melted ice at ("+ o + "," + p + ",0).");
    }
  }
}

void regrowForest(int iterations){
  int o;int p;
  for(int i = 0; i < iterations; i++){
    o = int(random(mapSize));
    p = int(random(mapSize));
    if((map[o][p][0] == 8 || map[o][p][0] == 9 || map[o][p][0] == 15)&& evaluateSurroundings(14,o,p,0) > 0.625){
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

float evaluateSurroundings(int tileType, int x, int y, int z){
  float perc = 0.0;
  int[] surroundings = returnSurroundings(x,y,z);
  for(int i = 0; i < 8; i++){
    if(surroundings[i] == tileType){
      perc += 0.125;
    }
  }
  return perc;
}

int[] returnSurroundings(int x, int y, int z){
  int[] surroundings = new int[8];
  if(x > mapSize || x < 0 || y > mapSize || y < 0 || z < 0 || z > 3){
    return null;
  }
  if(x+1 > mapSize){
    surroundings[0] = 17;
  }else{
    surroundings[0] = map[x+1][y][z];
  }
  if(x-1 < 0){
    surroundings[1] = 17;
  }else{
    surroundings[1] = map[x-1][y][z];
  }
  if(y+1 > mapSize){
    surroundings[2] = 17;
  }else{
    surroundings[2] = map[x][y+1][z];
  }
  if(y-1 < 0){
    surroundings[3] = 17;
  }else{
    surroundings[3] = map[x][y-1][z];
  }
  if(x+1 > mapSize || y+1 > mapSize){
    surroundings[4] = 17;
  }else{
    surroundings[4] = map[x+1][y+1][z];
  }
  if(x-1 < 0 || y+1 > mapSize){
    surroundings[5] = 17;
  }else{
    surroundings[5] = map[x-1][y+1][z];
  }
  if(y-1 < 0 || x+1 > mapSize){
    surroundings[6] = 17;
  }else{
    surroundings[6] = map[x+1][y-1][z];
  }
  if(y-1 < 0 || x-1 < 0){
    surroundings[7] = 17;
  }else{
    surroundings[7] = map[x-1][y-1][z];
  }
  return surroundings;
}
