void saveWorld(){
  String[] save = new String[mapSize * 1000];
  for(int i = 0; i < save.length / 1000; i++){
    for(int j = 0; j < 1000; j++){
      save[i * 1000 + j] = "" + map[i][j][0];
    }
  }
  if(isOSX){
    saveStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + "-0.slsav", save);
  }else{
    saveStrings("saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + "-0.slsav", save);  
  }
  String[] save1 = new String[mapSize * 1000];
  for(int i = 0; i < save1.length / 1000; i++){
    for(int j = 0; j < 1000; j++){
      save1[i * 1000 + j] = "" + map[i][j][1];
    }
  }
  if(isOSX){
    saveStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + "-1.slsav", save1);
  }else{
    saveStrings("saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + "-1.slsav", save1);  
  }
  String[] save2 = new String[objCap * 4 + inventory.length + 10];
  for(int i = 0; i < save2.length - 8; i++){
    if(i < objCap){
      save2[i] = "" + objectxpos[i % objCap];
    } else if(i < objCap * 2){
      save2[i] = "" + objectypos[i % objCap];
    } else if(i < objCap * 3){
      save2[i] = "" + objectzpos[i % objCap];
    } else if(i < objCap * 4){
      save2[i] = "" + objectvalue[i % objCap];
    } else if(i < objCap * 4 + inventory.length){
      save2[i] = "" + inventory[i - objCap * 4];
    }else{
      save2[objCap * 4 + inventory.length] = "" + xpos;
      save2[objCap * 4 + inventory.length + 1] = "" + ypos;
      save2[objCap * 4 + inventory.length + 2] = "" + zpos;
      save2[objCap * 4 + inventory.length + 3] = "" + xm;
      save2[objCap * 4 + inventory.length + 4] = "" + ym;
      save2[objCap * 4 + inventory.length + 5] = "" + health;
      save2[objCap * 4 + inventory.length + 6] = "" + cSpeed;
      save2[objCap * 4 + inventory.length + 7] = "" + playerColor;
      save2[objCap * 4 + inventory.length + 8] = "" + countdown;
      save2[objCap * 4  + inventory.length + 9] = worldName;
    }
  }
  if(isOSX){
    saveStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + ".sldat", save2);
  }else{  
    saveStrings("saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + ".sldat", save2);
  }
}

void loadWorld(){
  String[] worldsave;
  String[] worldsave1;
  String[] datasave;
  if(isOSX){
    worldsave = loadStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + "-0.slsav");
    worldsave1 = loadStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + "-1.slsav");
    datasave = loadStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".sldat");
  }else{
    worldsave = loadStrings("saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + "-0.slsav");
    worldsave1 = loadStrings("saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + "-1.slsav");
    datasave = loadStrings("saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".sldat");
  }
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
    for(int i = 0; i < datasave.length - 8; i++){
      if(i < objCap){
        objectxpos[i] = int(datasave[i]);
      } else if(i < objCap * 2){
        objectypos[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 3){
        objectzpos[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 4){
        objectvalue[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 4 + inventory.length){
        inventory[i - objCap * 4] = int(datasave[i]);
      }else{
        xpos = int(datasave[objCap * 4 + inventory.length]);
        ypos = int(datasave[objCap * 4 + inventory.length + 1]);
        zpos = int(datasave[objCap * 4 + inventory.length + 2]);
        xm = int(datasave[objCap * 4 + inventory.length + 3]);
        ym = int(datasave[objCap * 4 + inventory.length + 4]);
        health = int(datasave[objCap * 4 + inventory.length + 5]);
        cSpeed = int(datasave[objCap * 4 + inventory.length + 6]);
        playerColor = int(datasave[objCap * 4 + inventory.length + 7]);
        countdown = int(datasave[objCap * 4 + inventory.length + 8]);
        worldName = datasave[objCap * 4 + inventory.length + 9];
        i++;
      }
    }
    saveWorld();
    loadWorldButGangsterThisTime();
  }
}

void loadWorldButGangsterThisTime(){
  String[] worldsave;
  String[] worldsave1;
  String[] datasave;
  if(isOSX){
    worldsave = loadStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + "-0.slsav");
    worldsave1 = loadStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + "-1.slsav");
    datasave = loadStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".sldat");
  }else{
    worldsave = loadStrings("saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + "-0.slsav");
    worldsave1 = loadStrings("saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + "-1.slsav");
    datasave = loadStrings("saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".sldat");
  }
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
    for(int i = 0; i < datasave.length - 7; i++){
      if(i < objCap){
        objectxpos[i] = int(datasave[i]);
      } else if(i < objCap * 2){
        objectypos[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 3){
        objectzpos[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 4){
        objectvalue[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 4 + inventory.length){
        inventory[i - objCap * 4] = int(datasave[i]);
      }else{
        xpos = int(datasave[objCap * 4 + inventory.length]);
        ypos = int(datasave[objCap * 4 + inventory.length + 1]);
        zpos = int(datasave[objCap * 4 + inventory.length + 2]);
        xm = int(datasave[objCap * 4 + inventory.length + 3]);
        ym = int(datasave[objCap * 4 + inventory.length + 4]);
        health = int(datasave[objCap * 4 + inventory.length + 5]);
        cSpeed = int(datasave[objCap * 4 + inventory.length + 6]);
        playerColor = int(datasave[objCap * 4 + inventory.length + 7]);
        countdown = int(datasave[objCap * 4 + inventory.length + 8]);
        worldName = datasave[objCap * 4 + inventory.length + 9];
        i++;
      }
    }
    scene = 3;
    drawTerrain();
  }  

}
