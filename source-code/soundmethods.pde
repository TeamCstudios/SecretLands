SoundFile music1; SoundFile music2; SoundFile music3; SoundFile music4; SoundFile music5; 
void stopmusic(){
  if(music1 != null){
    music1.stop();
    music2.stop();
    music3.stop();
    music4.stop();
    music5.stop();
  }
}

void wandering(){
  float rand = random(1);
  if(rand > .65){
    music1.stop();
    music3.stop();
    music4.stop();
    music5.stop();
    music2.play();
  }else if(rand > .30){
    music1.stop();
    music2.stop();
    music4.stop();
    music5.stop();
    music3.play();
  }else{
    music3.stop();
    music2.stop();
    music4.stop();
    music5.stop();
    music1.play();
  }
}

void caves(){
  music1.stop();
  music2.stop();
  music3.stop();
  music5.stop();
  music4.play();
}

void whyDoIHearBossMusic(){
  music1.stop();
  music2.stop();
  music3.stop();
  music4.stop();
  music5.stop();
  music5.play();
}

void loadMusic(){
  if(isOSX){
      music1 = new SoundFile(this,"/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/MrJoCrafter - Wandering A.mp3");
    }else{
      music1 = new SoundFile(this,"music/MrJoCrafter - Wandering A.mp3");
  }
  if(music1 != null){
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
  
  
  if(isOSX){
      music2 = new SoundFile(this,"/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/Takijana - Wandering B.mp3");
    }else{
      music2 = new SoundFile(this,"music/Takijana - Wandering B.mp3");
  }
  if(music2 != null){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music/Takijana%20-%20Wandering%20B.mp3");
    if(isOSX){
      saveBytes("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/Takijana - Wandering B.mp3", b);
    }else{
      saveBytes("music/Takijana - Wandering B.mp3", b);
    }
    if(isOSX){
        music2 = new SoundFile(this,"/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/Takijana - Wandering B.mp3");
      }else{
        music2 = new SoundFile(this,"music/Takijana - Wandering B.mp3");
    }
  }
  
  if(isOSX){
      music3 = new SoundFile(this,"/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/MrJoCrafter - Wandering C.mp3");
    }else{
      music3 = new SoundFile(this,"music/MrJoCrafter - Wandering C.mp3");
  }
  if(music3 != null){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music/MrJoCrafter%20-%20Wandering%20C.mp3");
    if(isOSX){
      saveBytes("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/MrJoCrafter - Wandering C.mp3", b);
    }else{
      saveBytes("music/MrJoCrafter - Wandering C.mp3", b);
    }
    if(isOSX){
        music3 = new SoundFile(this,"/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/MrJoCrafter - Wandering C.mp3");
      }else{
        music3 = new SoundFile(this,"music/MrJoCrafter - Wandering C.mp3");
    }
  }
  
  if(isOSX){
      music4 = new SoundFile(this,"/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/Takijana - Temple.mp3");
    }else{
      music4 = new SoundFile(this,"music/Takijana - Temple.mp3");
  }
  if(music4 != null){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music/Takijana%20-%20Temple.mp3");
    if(isOSX){
      saveBytes("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/Takijana - Temple.mp3", b);
    }else{
      saveBytes("music/Takijana - Temple.mp3", b);
    }
    if(isOSX){
        music4 = new SoundFile(this,"/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/Takijana - Temple.mp3");
      }else{
        music4 = new SoundFile(this,"music/Takijana - Temple.mp3");
    }
  }
  
  if(isOSX){
      music5 = new SoundFile(this,"/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/MrJoCrafter - A Real Threat.mp3");
    }else{
      music5 = new SoundFile(this,"music/MrJoCrafter - A Real Threat.mp3");
  }
  if(music5 != null){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music/MrJoCrafter%20-%20A%20Real%20Threat.mp3");
    if(isOSX){
      saveBytes("/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/MrJoCrafter - A Real Threat.mp3", b);
    }else{
      saveBytes("music/MrJoCrafter - A Real Threat.mp3", b);
    }
    if(isOSX){
        music5 = new SoundFile(this,"/Users/" + System.getProperty("user.name") + "/Library/Application Support/TeamCstudios/SecretLands/" + "music/MrJoCrafter - A Real Threat.mp3");
      }else{
        music5 = new SoundFile(this,"music/MrJoCrafter - A Real Threat.mp3");
    }
  }
}
