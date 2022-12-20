String parseCommand(String command){
  String[] args = split(command," ");
  if(args[0].equals("heal")){
    health = 16;
    return "Healed successfully!";
  }else if(args.length < 2){
    return "Too few arguments.";
  }
  if(args[0].equals("settile")){
    if(args.length > 5){
      return "Too many arguments.";
    }else if(args.length < 5){
      return "Too few arguments.";
    }
    if(!(int(args[1]) > 0 && int(args[1]) < mapSize)){
      return "Error: invalid coordinate position (" + args[1] + "," + args[2] + "," + args[3] + ")";
    }
    if(!(int(args[2]) > 0 && int(args[2]) < mapSize)){
      return "Error: invalid coordinate position (" + args[1] + "," + args[2] + "," + args[3] + ")";
    }
    if(!(int(args[3]) > -1 && int(args[3]) < 4)){
      return "Error: invalid coordinate position (" + args[1] + "," + args[2] + "," + args[3] + ")";
    }
    if(args[4].equals("0") || args[4].equals("cave-barrier")){
      map[int(args[1])][int(args[2])][int(args[3])] = 0;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("1") || args[4].equals("lava")){
      map[int(args[1])][int(args[2])][int(args[3])] = 1;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("2") || args[4].equals("mountain-peak-a")){
      map[int(args[1])][int(args[2])][int(args[3])] = 2;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("3") || args[4].equals("mountain-peak-b")){
      map[int(args[1])][int(args[2])][int(args[3])] = 3;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("4") || args[4].equals("mountain-peak-c")){
      map[int(args[1])][int(args[2])][int(args[3])] = 4;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("5") || args[4].equals("mountain-a")){
      map[int(args[1])][int(args[2])][int(args[3])] = 5;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("6") || args[4].equals("mountain-b") || args[4].equals("cave-walls")){
      map[int(args[1])][int(args[2])][int(args[3])] = 6;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("7") || args[4].equals("foothills") || args[4].equals("cave-floor")){
      map[int(args[1])][int(args[2])][int(args[3])] = 7;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("8") || args[4].equals("grasslands")){
      map[int(args[1])][int(args[2])][int(args[3])] = 8;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("9") || args[4].equals("dark-grasslands")){
      map[int(args[1])][int(args[2])][int(args[3])] = 9;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("10") || args[4].equals("desert")){
      map[int(args[1])][int(args[2])][int(args[3])] = 10;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("11") || args[4].equals("desert-transition") || args[4].equals("beach")){
      map[int(args[1])][int(args[2])][int(args[3])] = 11;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("12") || args[4].equals("tundra")){
      map[int(args[1])][int(args[2])][int(args[3])] = 12;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("13") || args[4].equals("tundra-transition")){
      map[int(args[1])][int(args[2])][int(args[3])] = 13;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("14") || args[4].equals("forest")){
      map[int(args[1])][int(args[2])][int(args[3])] = 14;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("15") || args[4].equals("forest-transition")){
      map[int(args[1])][int(args[2])][int(args[3])] = 15;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("16") || args[4].equals("ocean")){
      map[int(args[1])][int(args[2])][int(args[3])] = 16;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("17") || args[4].equals("deep-ocean")){
      map[int(args[1])][int(args[2])][int(args[3])] = 17;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("-1") || args[4].equals("wood-block")){
      map[int(args[1])][int(args[2])][int(args[3])] = -1;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("-2") || args[4].equals("stone-block")){
      map[int(args[1])][int(args[2])][int(args[3])] = -2;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("-5") || args[4].equals("copper-block")){
      map[int(args[1])][int(args[2])][int(args[3])] = -5;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("-6") || args[4].equals("iron-block")){
      map[int(args[1])][int(args[2])][int(args[3])] = -6;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("-7") || args[4].equals("tin-block")){
      map[int(args[1])][int(args[2])][int(args[3])] = -7;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("-8") || args[4].equals("osmium-block")){
      map[int(args[1])][int(args[2])][int(args[3])] = -8;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("-9") || args[4].equals("uranium-block")){
      map[int(args[1])][int(args[2])][int(args[3])] = -9;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("-10") || args[4].equals("gold-block")){
      map[int(args[1])][int(args[2])][int(args[3])] = -10;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else if(args[4].equals("-31") || args[4].equals("sandstone-block")){
      map[int(args[1])][int(args[2])][int(args[3])] = -31;
      return "Set tile at (" + args[1] + "," + args[2] + "," + args[3] + ") to " + args[4];
    }else{
      return "Error! Invalid tile type " + args[4];
    }
  }if(args[0].equals("fill")){
    if(args.length > 7){
      return "Too many arguments.";
    }else if(args.length < 7){
      return "Too few arguments.";
    }
    if(!(int(args[1]) > 0 && int(args[1]) < mapSize)){
      return "Error: invalid fill selection (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ")";
    }
    if(!(int(args[2]) > 0 && int(args[2]) < mapSize)){
      return "Error: invalid fill selection (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ")";
    }
    if(!(int(args[3]) > 0 && int(args[3]) < mapSize && int(args[3]) > int(args[1]))){
      return "Error: invalid fill selection (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ")";
    }
    if(!(int(args[4]) > 0 && int(args[4]) < mapSize && int(args[4]) > int(args[2]))){
      return "Error: invalid fill selection (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ")";
    }
    if(!(int(args[5]) > -1 && int(args[5]) < 4)){
      return "Error: invalid fill selection (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ")";
    }
    if(args[6].equals("0") || args[6].equals("cave-barrier")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 0;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("1") || args[6].equals("lava")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 1;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("2") || args[6].equals("mountain-peak-a")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 2;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("3") || args[6].equals("mountain-peak-b")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 3;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("4") || args[6].equals("mountain-peak-c")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 4;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("5") || args[6].equals("mountain-a")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 5;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("6") || args[6].equals("mountain-b") || args[6].equals("cave-walls")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 6;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("7") || args[6].equals("foothills") || args[6].equals("cave-floor")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 7;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("8") || args[6].equals("grasslands")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 8;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("9") || args[6].equals("dark-grasslands")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 9;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("10") || args[6].equals("desert")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 10;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("11") || args[6].equals("desert-transition") || args[6].equals("beach")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 11;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("12") || args[6].equals("tundra")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 12;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("13") || args[6].equals("tundra-transition")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 13;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("14") || args[6].equals("forest")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 14;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("15") || args[6].equals("forest-transition")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 15;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("16") || args[6].equals("ocean")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 16;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("17") || args[6].equals("deep-ocean")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = 17;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("-1") || args[6].equals("wood-block")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = -1;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("-2") || args[6].equals("stone-block")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = -2;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("-5") || args[6].equals("copper-block")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = -5;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("-6") || args[6].equals("iron-block")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = -6;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("-7") || args[6].equals("tin-block")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = -7;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("-8") || args[6].equals("osmium-block")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = -8;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("-9") || args[6].equals("uranium-block")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = -9;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("-10") || args[6].equals("gold-block")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = -10;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else if(args[6].equals("-31") || args[6].equals("sandstone-block")){
      for(int i = 0;i < (int(args[3]) - int(args[1]));i++){
        for(int j = 0;j < (int(args[4]) - int(args[2]));j++){
          map[int(args[1])+i][int(args[2])+j][int(args[5])] = -31;
        }
      }
      return "Set selection at (" + args[1] + "," + args[2] + "," + args[5] + ")-(" + args[1] + "," + args[2] + "," + args[5] + ") to " + args[4];
    }else{
      return "Error! Invalid tile type " + args[4];
    }
  }else if(args[0].equals("summonmob")){
    if(args.length > 5){
      return "Too many arguments.";
    }else if(args.length < 5){
      return "Too few arguments.";
    }
    if(!(int(args[1]) > 0 && int(args[1]) < mapSize)){
      return "Error: invalid coordinate position (" + args[1] + "," + args[2] + "," + args[3] + ")";
    }
    if(!(int(args[2]) > 0 && int(args[2]) < mapSize)){
      return "Error: invalid coordinate position (" + args[1] + "," + args[2] + "," + args[3] + ")";
    }
    if(!(int(args[3]) > -1 && int(args[3]) < 4)){
      return "Error: invalid coordinate position (" + args[1] + "," + args[2] + "," + args[3] + ")";
    }
    if(args[4].equals("1") || args[4].equals("green-slime")){
      spawnSpecificMob(int(args[1]),int(args[2]),int(args[3]),1);
      return "Green Slime successfully summoned!"; 
    }else if(args[4].equals("2") || args[4].equals("blue-slime")){
      spawnSpecificMob(int(args[1]),int(args[2]),int(args[3]),2);
      return "Blue Slime successfully summoned!"; 
    }else if(args[4].equals("3") || args[4].equals("red-slime")){
      spawnSpecificMob(int(args[1]),int(args[2]),int(args[3]),3);
      return "Red Slime successfully summoned!"; 
    }else if(args[4].equals("4") || args[4].equals("purple-slime")){
      spawnSpecificMob(int(args[1]),int(args[2]),int(args[3]),4);
      return "Purple Slime successfully summoned!"; 
    }else if(args[4].equals("5") || args[4].equals("cave-demon")){
      spawnSpecificMob(int(args[1]),int(args[2]),int(args[3]),5);
      return "Cave Demon successfully summoned!"; 
    }else if(args[4].equals("6") || args[4].equals("mummy-boss")){
      spawnSpecificMob(int(args[1]),int(args[2]),int(args[3]),5);
      return "Mummy Boss successfully summoned!"; 
    }
  }else if(args[0].equals("summonobject")){
    if(args.length > 5){
      return "Too many arguments.";
    }else if(args.length < 5){
      return "Too few arguments.";
    }
    if(!(int(args[1]) > 0 && int(args[1]) < mapSize)){
      return "Error: invalid coordinate position (" + args[1] + "," + args[2] + "," + args[3] + ")";
    }
    if(!(int(args[2]) > 0 && int(args[2]) < mapSize)){
      return "Error: invalid coordinate position (" + args[1] + "," + args[2] + "," + args[3] + ")";
    }
    if(!(int(args[3]) > -1 && int(args[3]) < 4)){
      return "Error: invalid coordinate position (" + args[1] + "," + args[2] + "," + args[3] + ")";
    }
    if(args[4].equals("-1") || args[4].equals("super-form")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),-1);
      return "Object successfully summoned.";
    }else if(args[4].equals("1") || args[4].equals("water-form")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),1);
      return "Object successfully summoned.";
    }else if(args[4].equals("2") || args[4].equals("sprinter-form")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),2);
      return "Object successfully summoned.";
    }else if(args[4].equals("3") || args[4].equals("climber-form")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),3);
      return "Object successfully summoned.";
    }else if(args[4].equals("4") || args[4].equals("normal-form")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),4);
      return "Object successfully summoned.";
    }else if(args[4].equals("5") || args[4].equals("iceman-form")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),5);
      return "Object successfully summoned.";
    }else if(args[4].equals("6") || args[4].equals("apple")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),6);
      return "Object successfully summoned.";
    }else if(args[4].equals("7") || args[4].equals("cactus")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),7);
      return "Object successfully summoned.";
    }else if(args[4].equals("8") || args[4].equals("coal-ore")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),8);
      return "Object successfully summoned.";
    }else if(args[4].equals("9") || args[4].equals("copper-ore")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),9);
      return "Object successfully summoned.";
    }else if(args[4].equals("10") || args[4].equals("iron-ore")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),10);
      return "Object successfully summoned.";
    }else if(args[4].equals("11") || args[4].equals("elevator")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),11);
      return "Object successfully summoned.";
    }else if(args[4].equals("12") || args[4].equals("boss-sound-check")){
      return "Error: only one (1) of this object may exist at a time.";
    }else if(args[4].equals("13") || args[4].equals("tin-ore")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),13);
      return "Object successfully summoned.";
    }else if(args[4].equals("14") || args[4].equals("osmium-ore")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),14);
      return "Object successfully summoned.";
    }else if(args[4].equals("15") || args[4].equals("uranium-ore")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),15);
      return "Object successfully summoned.";
    }else if(args[4].equals("16") || args[4].equals("gold-ore")){
      createSpecificObject(int(args[1]),int(args[2]),int(args[3]),16);
      return "Object successfully summoned.";
    }else{
      return "Error: invalid object identifier '" + args[4] + "'";
    }
  }else if(args[0].equals("teleport")){
    if(args.length > 4){
      return "Too many arguments.";
    }else if(args.length < 4){
      return "Too few arguments.";
    }
    if(!(int(args[1]) > 0 && int(args[1]) < mapSize)){
      return "Error: invalid coordinate position (" + args[1] + "," + args[2] + "," + args[3] + ")";
    }
    if(!(int(args[2]) > 0 && int(args[2]) < mapSize)){
      return "Error: invalid coordinate position (" + args[1] + "," + args[2] + "," + args[3] + ")";
    }
    if(!(int(args[3]) > -1 && int(args[3]) < 4)){
      return "Error: invalid coordinate position (" + args[1] + "," + args[2] + "," + args[3] + ")";
    }
    xpos = int(args[1]) - (width/xFOV/2);
    ypos = int(args[2]) - (height/xFOV/2);
    zpos = int(args[3]);
    return "Teleported to (" + args[1] + "," + args[2] + "," + args[3] + ")";
  }else if(args[0].equals("renameworld")){
    if(args.length > 2){
      return "Too many arguments.";
    }
    worldName = args[1];
    worldnames();
    return "Renamed world to '" + args[1] + "'! [SAVE YOUR GAME]";
  }else if(args[0].equals("setarmor")){
    if(args.length > 2){
      return "Too many arguments.";
    }
    if(args[1].equals("0") || args[1].equals("fists")){
      armorPower = 0;
      return "Set armor to None.";
    }else if(args[1].equals("1") || args[1].equals("thatched")){
      armorPower = 2;
      return "Set armor to Thatched Armor.";
    }else if(args[1].equals("2") || args[1].equals("bronze")){
      armorPower = 4;
      return "Set armor to Bronze Armor.";
    }else if(args[1].equals("3") || args[1].equals("steel")){
      armorPower = 6;
      return "Set armor to Steel Armor.";
    }else if(args[1].equals("4") || args[1].equals("iridosule")){
      armorPower = 8;
      return "Set armor to Iridosule Armor.";
    }else{
      return "Invalid argument: '" + args[1] + "'";
    }
  }else if(args[0].equals("difficulty")){
    if(args.length > 2){
      return "Too many arguments.";
    }
    if(args[1].equals("1") || args[1].equals("easy")){
      difficulty = 1;
      return "Set difficulty to Easy.";
    }else if(args[1].equals("2") || args[1].equals("normal")){
      difficulty = 2;
      return "Set difficulty to Normal.";
    }else if(args[1].equals("3") || args[1].equals("hard")){
      difficulty = 3;
      return "Set difficulty to Hard.";
    }else if(args[1].equals("4") || args[1].equals("lunatic")){
      difficulty = 4;
      return "Set difficulty to Lunatic.";
    }else{
      return "Invalid argument: '" + args[1] + "'";
    }
  }else if(args[0].equals("give")){
    if(args.length > 3){
      return "Too many arguments.";
    }else if(args.length < 3){
      return "Too few arguments.";
    }
    if(!((int(args[1]) > 0 && int(args[1]) < 11) || (int(args[1]) < 30 && int(args[1]) > 19))){
      return "Error: Invalid item ID " + args[1];
    }else if(!(int(args[2]) < 0 || int(args[2]) > 10000)){
      inventory[int(args[1])]+=int(args[2]);
      return "Given " + args[2] + "of item #" + args[1];
    }else{
      return "Error: Invalid amount " + args[2];
    }
  }else if(args[0].equals("setweapon")){
    if(args.length > 2){
      return "Too many arguments.";
    }
    if(args[1].equals("0") || args[1].equals("fists")){
      attackPower = 1;
      return "Set weapon to Fists.";
    }else if(args[1].equals("1") || args[1].equals("wood")){
      attackPower = 2;
      return "Set weapon to Wood Sword.";
    }else if(args[1].equals("2") || args[1].equals("stone")){
      attackPower = 3;
      return "Set weapon to Stone Sword.";
    }else if(args[1].equals("3") || args[1].equals("copper")){
      attackPower = 5;
      return "Set weapon to Copper Sword.";
    }else if(args[1].equals("4") || args[1].equals("iron")){
      attackPower = 7;
      return "Set weapon to Iron Sword.";
    }else if(args[1].equals("5") || args[1].equals("bronze")){
      attackPower = 8;
      return "Set weapon to Bronze Sword.";
    }else if(args[1].equals("6") || args[1].equals("steel")){
      attackPower = 9;
      return "Set weapon to Steel Sword.";
    }else if(args[1].equals("7") || args[1].equals("greensteel")){
      attackPower = 10;
      return "Set weapon to Greensteel Sword.";
    }else{
      return "Invalid argument: '" + args[1] + "'";
    }
  }else if(args[0].equals("setform")){
    if(args.length > 2){
      return "Too many arguments.";
    }
    if(args[1].equals("1") || args[1].equals("normal")){
      countdown = -1;
      playerColor = 1;
      return "Set to Normal Form.";
    }else if(args[1].equals("2") || args[1].equals("swimmer")){
      countdown = 2144;
      playerColor = 2;
      return "Set to Swimmer Form.";
    }else if(args[1].equals("3") || args[1].equals("climber")){
      countdown = 1926;
      playerColor = 3;
      return "Set to Climber Form.";
    }else if(args[1].equals("4") || args[1].equals("sprinter")){
      countdown = 515;
      playerColor = 4;
      return "Set to Sprinter Form.";
    }else if(args[1].equals("5") || args[1].equals("iceman")){
      countdown = 569;
      playerColor = 5;
      return "Set to Iceman Form.";
    }else if(args[1].equals("6") || args[1].equals("super")){
      countdown = 433;
      playerColor = 6;
      return "Set to Super Form.";
    }else{
      return "Invalid argument: '" + args[1] + "'";
    }
  }
  return "Invalid command.";
}
