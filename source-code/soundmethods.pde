void stopmusic(){
  if(music1 != null){
    music1.stop();
  }
}

void music1(){
  if(music1 == null){
    if(isOSX){
      music1 = new SoundFile(this,"/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/MrJoCrafter - Wandering A.mp3");
    }else{
      music1 = new SoundFile(this,"music/MrJoCrafter - Wandering A.mp3");
    }
    xm = 0;
    ym = 0;
  }
  music1.play();
}
