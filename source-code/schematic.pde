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
  c = loadStrings(filePath() + "schematics/lowering.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/lowering.slschem");
    saveStrings(filePath() + "schematics/lowering.slschem",updates);
  }
  c = loadStrings(filePath() + "schematics/oceanruin1.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/oceanruin1.slschem");
    saveStrings(filePath() + "schematics/oceanruin1.slschem",updates);
  }
  c = loadStrings(filePath() + "schematics/oceanruin2.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/oceanruin2.slschem");
    saveStrings(filePath() + "schematics/oceanruin2.slschem",updates);
  }
  c = loadStrings(filePath() + "schematics/grotto.slschem");
  if(c == null){
    updates = loadStrings("https://github.com/TeamCstudios/SecretLands/raw/master/public-schematics/grotto.slschem");
    saveStrings(filePath() + "schematics/grotto.slschem",updates);
  }
}
