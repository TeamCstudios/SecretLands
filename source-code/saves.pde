void saveWorld(){
  compressMap(map);
  String[] save2 = new String[objCap + mobCap + inventory.length + 17];
  for(int i = 0; i < save2.length - 8; i++){
    if(i < objCap){
      save2[i] = objects[i].returnObjectDataAsString();
    } else if(i < objCap + mobCap){
      save2[i] = mobs[i - objCap].returnMobDataAsString();
    } else if(i < objCap + mobCap + inventory.length){
      save2[i] = "" + inventory[i - objCap - mobCap];
    }else{
      save2[objCap + mobCap + inventory.length] = "" + xpos;
      save2[objCap + mobCap + inventory.length + 1] = "" + ypos;
      save2[objCap + mobCap + inventory.length + 2] = "" + zpos;
      save2[objCap + mobCap + inventory.length + 3] = "" + xm;
      save2[objCap + mobCap + inventory.length + 4] = "" + ym;
      save2[objCap + mobCap + inventory.length + 5] = "" + health;
      save2[objCap + mobCap + inventory.length + 6] = "" + cSpeed;
      save2[objCap + mobCap + inventory.length + 7] = "" + playerColor;
      save2[objCap + mobCap + inventory.length + 8] = "" + countdown;
      save2[objCap + mobCap + inventory.length + 9] = "" + attackPower;
      save2[objCap + mobCap + inventory.length + 10] = "" + armor;
      save2[objCap + mobCap + inventory.length + 11] = "" + armorPower;
      save2[objCap + mobCap + inventory.length + 12] = "" + tX;
      save2[objCap + mobCap + inventory.length + 13] = "" + tY;
      save2[objCap + mobCap + inventory.length + 14] = "" + tState;
      save2[objCap + mobCap + inventory.length + 15] = "" + difficulty;
      save2[objCap  + mobCap + inventory.length + 16] = worldName;
    }
  }
  saveStrings(filePath() + "saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + ".sldat", save2);
}

void compressMap(int[][][] xmap) {
  StringBuilder sb = new StringBuilder();
  for (int i = 0; i < xmap.length; i++) {
    for (int j = 0; j < xmap[i].length; j++) {
      for (int k = 0; k < xmap[i][j].length; k++) {
        sb.append(xmap[i][j][k]);
        sb.append(" ");
      }
      sb.append("\n");
    }
  }
  String[] xz = (sb.toString()).split("\n");
  saveStrings(filePath() + "saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + ".slsav2",xz);
}

void decompressMap(String filePath) {
  String[] xz = loadStrings(filePath);
  String[] lz;
  int idx = 0;
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map[i].length; j++) {
      lz = xz[idx].split(" ");
      for (int k = 0; k < map[i][j].length; k++) {
        map[i][j][k] = Integer.parseInt(lz[k]);
        
      }
      idx++;
    }
  }
}
void loadWorldFull(){
  loadWorld();
  if(textEntry != ""){
    saveWorld();
    loadWorld();
    scene = 3;
    drawTerrain();
  }
}

void loadWorld(){
  String[] worldsave;
  String[] datasave;
  worldsave = loadStrings(filePath() + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".slsav2");
  datasave = loadStrings(filePath() + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".sldat");
  if(worldsave == null || datasave == null){
    textEntry = "";
  }else{
    decompressMap(filePath() + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".slsav2");
    for(int i = 0; i < datasave.length - 8; i++){
      if(i < objCap){
        objects[i] = new Object(datasave[i]);
      } else if(i < objCap + mobCap){
        mobs[i - objCap] = new Mob(datasave[i]);
      } else if(i < objCap + mobCap + inventory.length){
        inventory[i - objCap - mobCap] = int(datasave[i]);
      } else{
        xpos = int(datasave[objCap + mobCap + inventory.length]);
        ypos = int(datasave[objCap + mobCap + inventory.length + 1]);
        zpos = int(datasave[objCap + mobCap + inventory.length + 2]);
        xm = int(datasave[objCap + mobCap + inventory.length + 3]);
        ym = int(datasave[objCap + mobCap + inventory.length + 4]);
        health = int(datasave[objCap + mobCap + inventory.length + 5]);
        cSpeed = int(datasave[objCap + mobCap + inventory.length + 6]);
        playerColor = int(datasave[objCap + mobCap + inventory.length + 7]);
        countdown = int(datasave[objCap + mobCap + inventory.length + 8]);
        attackPower = int(datasave[objCap + mobCap + inventory.length + 9]);
        armor = int(datasave[objCap + mobCap + inventory.length + 10]);
        armorPower = int(datasave[objCap + mobCap + inventory.length + 11]);
        tX = int(datasave[objCap + mobCap + inventory.length + 11]);
        tY = int(datasave[objCap + mobCap + inventory.length + 12]);
        tState = int(datasave[objCap + mobCap + inventory.length + 14]);
        difficulty = int(datasave[objCap + mobCap + inventory.length + 15]);
        worldName = datasave[objCap + mobCap + inventory.length + 16];
        i++;
      }
    }
  }
}
