void stopmusic(){
  if(music1 != null){
    music1.stop();
  }
}

void music1(){
  music1.play();
}

void loadMusic(){
  byte b[];
  b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music/MrJoCrafter%20-%20Wandering%20A.mp3");
  if(isOSX){
    saveBytes("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/MrJoCrafter - Wandering A.mp3", b);
  }else{
    saveBytes("music/MrJoCrafter - Wandering A.mp3", b);
  }
  if(isOSX){
      music1 = new SoundFile(this,"/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/MrJoCrafter - Wandering A.mp3");
    }else{
      music1 = new SoundFile(this,"music/MrJoCrafter - Wandering A.mp3");
  }
}
