void loadSchematic(String schematicName, int sX, int sY, int sZ){
  String[] schematic;
  schematic = loadStrings(filePath() + "schematics/" + schematicName + ".slschem");
  int schWid = int(schematic[0]);
  int schLen = int(schematic[1]);
  for(int i = 0; i < schWid; i++){
    for(int j = 0; j < schLen; j++){
      map[sX + i][sY + j][sZ] = int(schematic[2 + i * schLen + j]);
    } 
  }
}

void downloadSchematics(){
  String[] updates;
  String[] c;
  c = loadStrings(filePath() + "schematics/temple.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/temple.slschem");
    saveStrings(filePath() + "schematics/temple.slschem",updates);
  }
  loadingPercentage(1);
  c = loadStrings(filePath() + "schematics/lowering.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/lowering.slschem");
    saveStrings(filePath() + "schematics/lowering.slschem",updates);
  }
  loadingPercentage(1);
  c = loadStrings(filePath() + "schematics/lowering2.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/lowering2.slschem");
    saveStrings(filePath() + "schematics/lowering2.slschem",updates);
  }
  loadingPercentage(1);
  c = loadStrings(filePath() + "schematics/oceanruin1.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/oceanruin1.slschem");
    saveStrings(filePath() + "schematics/oceanruin1.slschem",updates);
  }
  loadingPercentage(1);
  c = loadStrings(filePath() + "schematics/oceanruin2.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/oceanruin2.slschem");
    saveStrings(filePath() + "schematics/oceanruin2.slschem",updates);
  }
  loadingPercentage(1);
  c = loadStrings(filePath() + "schematics/grotto.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/grotto.slschem");
    saveStrings(filePath() + "schematics/grotto.slschem",updates);
  }
  loadingPercentage(1);
  c = loadStrings(filePath() + "schematics/castlebase.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/castlebase.slschem");
    saveStrings(filePath() + "schematics/castlebase.slschem",updates);
  }
  loadingPercentage(1);
  c = loadStrings(filePath() + "schematics/castlebaseruined.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/castlebaseruined.slschem");
    saveStrings(filePath() + "schematics/castlebaseruined.slschem",updates);
  }
  loadingPercentage(1);
  c = loadStrings(filePath() + "schematics/mountainbastion.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/mountainbastion.slschem");
    saveStrings(filePath() + "schematics/mountainbastion.slschem",updates);
  }
  loadingPercentage(1);
}

void renderSchematics(){
  int loopEsc=0;
  int stX;
  int stY;
  for(int i = 0; i < 7; i++){
    stX = int(random(mapSize - 200) + 100);
    stY = int(random(mapSize - 200) + 100);
    loopEsc = 0;
    while(!(map[stX][stY][1] == 7 || map[stX][stY][1] == 6 && map[stX][stY + 7][2] == 7)){
      stX = int(random(mapSize - 200) + 100);
      stY = int(random(mapSize - 200) + 100);
      loopEsc++;
      if(loopEsc > 100000){
        break;
      }
    }
    if(loopEsc < 100001){
      generateLoweringDungeon(stX,stY,i);
    }
  }
  for(int i = 0; i < 4; i++){
    stX = int(random(mapSize - 200) + 100);
    stY = int(random(mapSize - 200) + 100);
    loopEsc = 0;
    while(!(map[stX][stY][2] == 7 || map[stX][stY][2] == 6 && map[stX][stY + 7][3] == 7)){
      stX = int(random(mapSize - 200) + 100);
      stY = int(random(mapSize - 200) + 100);
      loopEsc++;
      if(loopEsc > 100000){
        break;
      }
    }
    if(loopEsc < 100001){
      generateLoweringDungeon2(stX,stY,i+7);
    }
  }
  tX = int(random(mapSize - 200) + 100);
  tY = int(random(mapSize - 200) + 100);
  loopEsc = 0;
  while(!(map[tX][tY][0] == 8 || map[tX][tY][0] == 9)){
    tX = int(random(mapSize - 200) + 100);
    tY = int(random(mapSize - 200) + 100);
    loopEsc++;
    if(loopEsc > 100000){
      break;
    }
  }
  if(loopEsc < 100001){
    generateTemple();
  }
  for(int i = 0; i < 5; i++){
    stX = int(random(mapSize - 200) + 100);
    stY = int(random(mapSize - 200) + 100);
    loopEsc = 0;
    while(!(map[stX][stY][0] == 16)){
      stX = int(random(mapSize - 200) + 100);
      stY = int(random(mapSize - 200) + 100);
      loopEsc++;
      if(loopEsc > 100000){
        break;
      }
    }
    if(loopEsc < 100001){
      if(loopEsc % 2 == 0){
        loadSchematic("oceanruin1",stX,stY,0);
      }else{
        loadSchematic("oceanruin2",stX,stY,0);
      }
    }
  }
  for(int i = 0; i < 4; i++){
    stX = int(random(mapSize - 200) + 100);
    stY = int(random(mapSize - 200) + 100);
    loopEsc = 0;
    while(!(map[stX][stY][0] == 8 || map[stX][stY][0] == 9)){
      stX = int(random(mapSize - 200) + 100);
      stY = int(random(mapSize - 200) + 100);
      loopEsc++;
      if(loopEsc > 100000){
        break;
      }
    }
    if(loopEsc < 100001){
      if(loopEsc % 7 == 5){
        loadSchematic("castlebaseruined",stX,stY,0);
      }else{
        loadSchematic("castlebase",stX,stY,0);
      }
    }
  }
  for(int i = 0; i < 2; i++){
    stX = int(random(mapSize - 200) + 100);
    stY = int(random(mapSize - 200) + 100);
    loopEsc = 0;
    while(!(map[stX][stY][0] > 1 && map[stX][stY][0] < 8 && map[stX+40][stY+40][0] > 1 && map[stX+40][stY+40][0] < 8)){
      stX = int(random(mapSize - 200) + 100);
      stY = int(random(mapSize - 200) + 100);
      loopEsc++;
      if(loopEsc > 100000){
        break;
      }
    }
    if(loopEsc < 100001){
      loadSchematic("mountainbastion",stX,stY,0);
    }
  }
  stX = int(random(mapSize - 200) + 100);
  stY = int(random(mapSize - 200) + 100);
  loadSchematic("grotto",stX,stY,2);
  stX = int(random(mapSize - 200) + 100);
  stY = int(random(mapSize - 200) + 100);
  loadSchematic("grotto",stX,stY,2);
}

void generateTemple(){
  loadSchematic("temple",tX-1,tY-1,1);
  objects[objCap - 9] = new Object(tX + 1,tY + 1,1,12);
  objects[objCap - 8] = new Object(tX,tY,1,11);
}

void generateLoweringDungeon(int stX, int stY, int inc){
  loadSchematic("lowering",stX-6,stY,1);
  objects[objCap - 10 - inc] = new Object(stX - 1,stY + 5,2,11);
}

void generateLoweringDungeon2(int stX, int stY, int inc){
  loadSchematic("lowering2",stX-5,stY,2);
  objects[objCap - 10 - inc] = new Object(stX - 1,stY + 4,3,11);
}
