void loadSchematic(String schematicName, int sX, int sY, int sZ){
  String[] schematic;
  if(isOSX){
    schematic = loadStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "schematics/" + schematicName + ".slschem");
  }else{
    schematic = loadStrings("schematics/" + schematicName + ".slschem");
  }
  int schWid = int(schematic[0]);
  int schLen = int(schematic[1]);
  for(int i = 0; i < schWid; i++){
    for(int j = 0; j < schLen; j++){
      map[sX + i][sY + j][sZ] = int(schematic[2 + i * schLen + j]);
    } 
  }
}

void downloadSchematics(){
  String[] updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/temple.slschem");
  if(isOSX){
    saveStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "schematics/temple.slschem",updates);
  }else{
    saveStrings("schematics/temple.slschem",updates);
  }
  updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/lowering.slschem");
  if(isOSX){
    saveStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "schematics/lowering.slschem",updates);
  }else{
    saveStrings("schematics/lowering.slschem",updates);
  }
  updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/oceanruin1.slschem");
  if(isOSX){
    saveStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "schematics/oceanruin1.slschem",updates);
  }else{
    saveStrings("schematics/oceanruin1.slschem",updates);
  }
  updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/oceanruin2.slschem");
  if(isOSX){
    saveStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "schematics/oceanruin2.slschem",updates);
  }else{
    saveStrings("schematics/oceanruin2.slschem",updates);
  }
  updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/grotto.slschem");
  if(isOSX){
    saveStrings("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "schematics/grotto.slschem",updates);
  }else{
    saveStrings("schematics/grotto.slschem",updates);
  }
}
