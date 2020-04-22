void saveWorld(){
  String[] save = new String[mapSize * 1000];
  for(int i = 0; i < save.length / 1000; i++){
    for(int j = 0; j < 1000; j++){
      save[i * 1000 + j] = "" + map[i][j];
    }
  }
  if(isOSX){
    saveStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + ".slsav", save);
  }else{
    saveStrings("saves/" + worldName + "-" + verCode + "/" + worldName + "-" + verCode + ".slsav", save);  
  }
  String[] save2 = new String[objCap * 3 + inventory.length + 9];
  for(int i = 0; i < save2.length - 8; i++){
    if(i < objCap){
      save2[i] = "" + objectxpos[i % objCap];
    } else if(i < objCap * 2){
      save2[i] = "" + objectypos[i % objCap];
    } else if(i < objCap * 3){
      save2[i] = "" + objectvalue[i % objCap];
    } else if(i < objCap * 3 + inventory.length){
      save2[i] = "" + inventory[i - objCap * 3];
    }else{
      save2[objCap * 3 + inventory.length] = "" + xpos;
      save2[objCap * 3 + inventory.length + 1] = "" + ypos;
      save2[objCap * 3 + inventory.length + 2] = "" + xm;
      save2[objCap * 3 + inventory.length + 3] = "" + ym;
      save2[objCap * 3 + inventory.length + 4] = "" + health;
      save2[objCap * 3 + inventory.length + 5] = "" + cSpeed;
      save2[objCap * 3 + inventory.length + 6] = "" + playerColor;
      save2[objCap * 3 + inventory.length + 7] = "" + countdown;
      save2[objCap * 3 + inventory.length + 8] = worldName;
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
  String[] datasave;
  if(isOSX){
    worldsave = loadStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".slsav");
    datasave = loadStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".sldat");
  }else{
    worldsave = loadStrings("saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".slsav");
    datasave = loadStrings("saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".sldat");
  }
  if(worldsave == null || datasave == null){
    textEntry = "";
  }else{
    for(int i = 0; i < worldsave.length / 1000; i++){
      for(int j = 0; j < 1000; j++){
        map[j][i] = int(worldsave[j + i * 1000]);
      }
    }
    for(int i = 0; i < datasave.length - 7; i++){
      if(i < objCap){
        objectxpos[i] = int(datasave[i]);
      } else if(i < objCap * 2){
        objectypos[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 3){
        objectvalue[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 3 + inventory.length){
        inventory[i - objCap * 3] = int(datasave[i]);
      }else{
        xpos = int(datasave[objCap * 3 + inventory.length]);
        ypos = int(datasave[objCap * 3 + inventory.length + 1]);
        xm = int(datasave[objCap * 3 + inventory.length + 2]);
        ym = int(datasave[objCap * 3 + inventory.length + 3]);
        health = int(datasave[objCap * 3 + inventory.length + 4]);
        cSpeed = int(datasave[objCap * 3 + inventory.length + 5]);
        playerColor = int(datasave[objCap * 3 + inventory.length + 6]);
        countdown = int(datasave[objCap * 3 + inventory.length + 7]);
        worldName = datasave[objCap * 3 + inventory.length + 8];
        i++;
      }
    }
    saveWorld();
    loadWorldButGangsterThisTime();
  }
}

void loadWorldButGangsterThisTime(){
  String[] worldsave;
  String[] datasave;
  if(isOSX){
    worldsave = loadStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".slsav");
    datasave = loadStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".sldat");
  }else{
    worldsave = loadStrings("saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".slsav");
    datasave = loadStrings("saves/" + textEntry +  "-" + verCode + "/" + textEntry + "-" + verCode + ".sldat");
  }
  if(worldsave == null || datasave == null){
    textEntry = "";
  }else{
    for(int i = 0; i < worldsave.length / 1000; i++){
      for(int j = 0; j < 1000; j++){
        map[j][i] = int(worldsave[j + i * 1000]);
      }
    }
    for(int i = 0; i < datasave.length - 7; i++){
      if(i < objCap){
        objectxpos[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 2){
        objectypos[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 3){
        objectvalue[i % objCap] = int(datasave[i]);
      } else if(i < objCap * 3 + inventory.length){
        inventory[i - objCap * 3] = int(datasave[i]);
      }else{
        xpos = int(datasave[objCap * 3 + inventory.length]);
        ypos = int(datasave[objCap * 3 + inventory.length + 1]);
        xm = int(datasave[objCap * 3 + inventory.length + 2]);
        ym = int(datasave[objCap * 3 + inventory.length + 3]);
        health = int(datasave[objCap * 3 + inventory.length + 4]);
        cSpeed = int(datasave[objCap * 3 + inventory.length + 5]);
        playerColor = int(datasave[objCap * 3 + inventory.length + 6]);
        countdown = int(datasave[objCap * 3 + inventory.length + 7]);
        worldName = datasave[objCap * 3 + inventory.length + 8];
        i++;
      }
    }
    scene = 3;
  }  

}
