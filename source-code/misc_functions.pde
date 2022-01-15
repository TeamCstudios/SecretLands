void initialize(){
  xpos = mapSize / 2;
  ypos = mapSize / 2;
  xm = 0;
  ym = 0;
  zpos = 0;
  tX = 0;
  tY = 0;
  tState = 0;
  attackPower = 1;
  armor = 0;
  armorPower = 0;
  selection = 0;
  playerColor = 1;
  for(int i = 0; i < 30; i++){
    inventory[i] = 0;
  }
  countdown = 0;
  health = 16;
}

void changeSelection(){
  selection++;
  if(selection == 3){
    selection = 5;
  }
  if(selection == 1){
    if(inventory[1] < 20){
      changeSelection();
    }
  } else if(selection == 2){
    if(inventory[2] < 20){
      changeSelection();
    }
  }else if(selection == 5){
    if(inventory[5] < 20){
      changeSelection();
    }
  }else if(selection == 6){
    if(inventory[6] < 20){
      changeSelection();
    }
  }else if(selection == 7){
    if(inventory[7] < 20){
      changeSelection();
    }
  }else if(selection == 8){
    if(inventory[8] < 20){
      changeSelection();
    }
  }else if(selection == 9){
    if(inventory[9] < 20){
      changeSelection();
    }
  }else if(selection == 10){
    selection = 0;
  }
}
void loadingPercentage(int add){
  loadingPercentage+=add;
  fill(255,0,0);
  background(105,55,155);
  textSize(36);
  fill(0);
  text("Loading files from the cloud...",10,450);
  rect(10,480,loadingPercentage*17.3913043478,30);
}

void framecounter(){
  //if(millis() % 1000 == 0){
    //timeStorage++;
    //frameStorage = frameCount;
  //}
  if(framecounter < 5){
    framecounter++;
  }else if(framecounter == 5){
    framecounter = 0;
    frameruleCounter++;
  }
  if(frameruleCounter % 2 == 0 && framecounter == 0){
    if(attack){
      attack = false;
    }
  }
  if(frameruleCounter % 13 == 0 && framecounter == 1){
    if(armor < armorPower){
      armor++;
    }
  }
  if(frameruleCounter % 7 == 0){
    progress = 0;
    for(int i = 0;i < 30;i++){
      progress+=inventory[i];
    }
    progress+=attackPower*20+armorPower*25;
  }
  if(framecounter == 0){
    framerate = int((frameCount/* - frameStorage */) / ((millis()/* - 1000 * timeStorage */) / 1000));
  }
}

void worldnames(){
  String[] updates;
  String lol = worldName;
  updates = loadStrings(filePath() + "profile/worldnames.sldat");
  if(updates == null){
    String[] newU = new String[1];
    newU[newU.length - 1] = lol;
    saveStrings(filePath() + "profile/worldnames.sldat",newU);
  }else{
    String[] newU = new String[updates.length + 1];
    for(int i = 0; i < newU.length - 1; i++){
      newU[i] = updates[i];
    }
    newU[newU.length - 1] = lol;
    saveStrings(filePath() + "profile/worldnames.sldat",newU);
  }
}

void loadSettings(){
  String[] settings;
  settings = loadStrings(filePath() + "profile/settings.sldat");
  if(settings == null){
    String[] newU = new String[1];
    newU[newU.length - 1] = nf(soundVolume, 0, 1);
    saveStrings(filePath() + "profile/settings.sldat",newU);
  }else{
    soundVolume = int(settings[0]);
  }
}

void setSettings(){
  String[] newU = new String[1];
  newU[0] = nf(soundVolume, 0, 1);
  saveStrings(filePath() + "profile/settings.sldat",newU);
}

String filePath(){
  if(isOSX){
    return "/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/";
  }else{
    return "";
  }
}
void versionz(){
  String[] updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/updates.sldat");
  String latestUpdateCode = "";
  if(updates[0].contains("Omega")){
    latestUpdateCode = "o";
  }else if(updates[0].contains("Alpha")){
    latestUpdateCode = "a";
  }else if(updates[0].contains("Beta")){
    latestUpdateCode = "b";
  }else if(updates[0].contains("Release")){
    latestUpdateCode = "v";
  }
  latestUpdateCode = latestUpdateCode + updates[1] + updates[2] + updates[3];
  if(latestUpdateCode.equals(verCode)){
    isLatestRelease = true;
  }else{
    isLatestRelease = false;
  }
  test = updates[0] + " " + updates[1] + "." + updates[2] + "." + updates[3];
}
void nameWorld(){
  if(preset == 0){
    worldName = "default" + int(random(8999) + 1000);
  }else if(preset == 1){
    worldName = "europe" + int(random(8999) + 1000);
  }else if(preset == 2){
    worldName = "barriers" + int(random(8999) + 1000);
  }else if(preset == 3){
    worldName = "desert" + int(random(8999) + 1000);
  }else if(preset == 4){
    worldName = "indonesia" + int(random(8999) + 1000);
  }else if(preset == 5){
    worldName = "desert-islands" + int(random(8999) + 1000);
  }else if(preset == 6){
    worldName = "winter" + int(random(8999) + 1000);
  }else if(preset == 7){
    worldName = "china" + int(random(8999) + 1000);
  }else if(preset == 8){
    worldName = "chaos" + int(random(8999) + 1000);
  }else if(preset == 9){
    worldName = "europa" + int(random(8999) + 1000);
  }else if(preset == 10){
    worldName = "customized" + int(random(8999) + 1000);
  }
}

void countdown(){
  if(countdown >= 0){
    countdown--;
  }
  if(countdown == 0){
    playerColor = 1;
  }
}

String difficultyWorded(){
  if(difficulty == 1){
    return "Easy";
  }else if(difficulty == 2){
    return "Normal";
  }else if(difficulty == 3){
    return "Hard";
  }else if(difficulty == 4){
    return "Lunatic";
  }
  return null;
}
