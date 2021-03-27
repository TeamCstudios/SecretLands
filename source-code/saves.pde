void saveWorld(){
  String[] save = new String[mapSize * 1000];
  for(int i = 0; i < save.length / 1000; i++){
    for(int j = 0; j < 1000; j++){
      save[i * 1000 + j] = "" + map[i][j][0];
    }
  }
  saveStrings(filePath() + "saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + "-0.slsav", save);
  save = new String[mapSize * 1000];
  for(int i = 0; i < save.length / 1000; i++){
    for(int j = 0; j < 1000; j++){
      save[i * 1000 + j] = "" + map[i][j][1];
    }
  }
  saveStrings(filePath() + "saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + "-1.slsav", save);
  save = new String[mapSize * 1000];
  for(int i = 0; i < save.length / 1000; i++){
    for(int j = 0; j < 1000; j++){
      save[i * 1000 + j] = "" + map[i][j][2];
    }
  }
  saveStrings(filePath() + "saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + "-2.slsav", save);
  String[] save2 = new String[objCap * 4 + mobCap * 5 + inventory.length + 16];
  for(int i = 0; i < save2.length - 8; i++){
    if(i < objCap){
      save2[i] = "" + objectxpos[i % objCap];
    } else if(i < objCap * 2){
      save2[i] = "" + objectypos[i % objCap];
    } else if(i < objCap * 3){
      save2[i] = "" + objectzpos[i % objCap];
    } else if(i < objCap * 4){
      save2[i] = "" + objectvalue[i % objCap];
    } else if(i < objCap * 4 + mobCap){
      save2[i] = "" + mobxpos[i % mobCap];
    } else if(i < objCap * 4 + mobCap * 2){
      save2[i] = "" + mobypos[i % mobCap];
    } else if(i < objCap * 4 + mobCap * 3){
      save2[i] = "" + mobzpos[i % mobCap];
    } else if(i < objCap * 4 + mobCap * 4){
      save2[i] = "" + mobvalue[i % mobCap];
    } else if(i < objCap * 4 + mobCap * 5){
      save2[i] = "" + mobhealth[i % mobCap];
    } else if(i < objCap * 4 + mobCap * 5 + inventory.length){
      save2[i] = "" + inventory[i - objCap * 4 - mobCap * 5];
    }else{
      save2[objCap * 4 + mobCap * 5 + inventory.length] = "" + xpos;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 1] = "" + ypos;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 2] = "" + zpos;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 3] = "" + xm;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 4] = "" + ym;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 5] = "" + health;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 6] = "" + cSpeed;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 7] = "" + playerColor;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 8] = "" + countdown;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 9] = "" + attackPower;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 10] = "" + armor;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 11] = "" + armorPower;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 12] = "" + tX;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 13] = "" + tY;
      save2[objCap * 4 + mobCap * 5 + inventory.length + 14] = "" + tState;
      save2[objCap * 4  + mobCap * 5 + inventory.length + 15] = worldName;
    }
  }
  saveStrings(filePath() + "saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + ".sldat", save2);
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
  String[] worldsave1;
  String[] worldsave2;
  String[] datasave;
  worldsave = loadStrings(filePath() + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + "-0.slsav");
  worldsave1 = loadStrings(filePath() + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + "-1.slsav");
  worldsave2 = loadStrings(filePath() + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + "-2.slsav");
  datasave = loadStrings(filePath() + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".sldat");
  if(worldsave == null || datasave == null){
    textEntry = "";
  }else{
    for(int i = 0; i < worldsave.length / 1000; i++){
      for(int j = 0; j < 1000; j++){
        map[j][i][0] = int(worldsave[j + i * 1000]);
      }
    }
    for(int i = 0; i < worldsave1.length / 1000; i++){
      for(int j = 0; j < 1000; j++){
        map[j][i][1] = int(worldsave1[j + i * 1000]);
      }
    }
    for(int i = 0; i < worldsave2.length / 1000; i++){
      for(int j = 0; j < 1000; j++){
        map[j][i][2] = int(worldsave2[j + i * 1000]);
      }
    }
    for(int i = 0; i < datasave.length - 8; i++){
      if(i < objCap){
        objectxpos[i] = int(datasave[i]);
      } else if(i < objCap * 2){
        objectypos[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 3){
        objectzpos[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 4){
        objectvalue[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 4 + mobCap){
        mobxpos[i % mobCap] = int(datasave[i]);
      } else if(i < objCap * 4 + mobCap * 2){
        mobypos[i % mobCap] = int(datasave[i]);
      } else if(i < objCap * 4 + mobCap * 3){
        mobzpos[i % mobCap] = int(datasave[i]);
      } else if(i < objCap * 4 + mobCap * 4){
        mobvalue[i % mobCap] = int(datasave[i]);
      } else if(i < objCap * 4 + mobCap * 5){
        mobhealth[i % mobCap] = int(datasave[i]);
      } else if(i < objCap * 4 + mobCap * 5 + inventory.length){
        inventory[i - objCap * 4] = int(datasave[i]);
      } else{
        xpos = int(datasave[objCap * 4 + mobCap * 5 + inventory.length]);
        ypos = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 1]);
        zpos = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 2]);
        xm = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 3]);
        ym = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 4]);
        health = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 5]);
        cSpeed = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 6]);
        playerColor = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 7]);
        countdown = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 8]);
        attackPower = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 9]);
        armor = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 10]);
        armorPower = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 11]);
        tX = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 11]);
        tY = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 12]);
        tState = int(datasave[objCap * 4 + mobCap * 5 + inventory.length + 14]);
        worldName = datasave[objCap * 4 + mobCap * 5 + inventory.length + 15];
        i++;
      }
    }
  }
}
