float soundVolume = 1.0; Sound sound = new Sound(this);
SoundFile music1; SoundFile music2; SoundFile music3; SoundFile music4; SoundFile music5; SoundFile music6; 
void stopmusic(){
  if(music1 != null){
    music1.stop();
    music2.stop();
    music3.stop();
    music4.stop();
    music5.stop();
    music6.stop();
  }
}

void wandering(){
  float rand = random(1);
  if(rand > .65){
    stopmusic();
    music2.play();
    sound.volume(abs(soundVolume));
  }else if(rand > .30){
    stopmusic();
    music3.play();
    sound.volume(abs(soundVolume));
  }else{
    stopmusic();
    music1.play();
    sound.volume(abs(soundVolume));
  }
}

void caves(){
  stopmusic();
  music4.play();
  sound.volume(abs(soundVolume * 0.6));
}

void caves2(){
  stopmusic();
  music6.play();
  sound.volume(abs(soundVolume));
}

void whyDoIHearBossMusic(){
  stopmusic();
  music5.play();
  sound.volume(abs(soundVolume));
}

void loadMusic(){
  lm1();
  lm2();
  lm3();
  lm4();
  lm5();
  lm6();
}


void lm1(){
  music1 = new SoundFile(this,filePath() + "music/MrJoCrafter - Wandering.mp3");
  if(music1 != null){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music2/wandering.mp3");
    saveBytes(filePath() + "music/MrJoCrafter - Wandering.mp3", b);
    music1 = new SoundFile(this,filePath() + "music/MrJoCrafter - Wandering.mp3");
  }
}
void lm2(){
  music2 = new SoundFile(this,filePath() + "music/Takijana - Flutter.mp3");
  if(music2 != null){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music2/flutter.mp3");
    saveBytes(filePath() + "music/Takijana - Flutter.mp3", b);
    music2 = new SoundFile(this,filePath() + "music/Takijana - Flutter.mp3");
  }
}
void lm3(){
  music3 = new SoundFile(this,filePath() + "music/MrJoCrafter - Insane Slimes.mp3");
  if(music3 != null){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music2/insaneslimes.mp3");
    saveBytes(filePath() + "music/MrJoCrafter - Insane Slimes.mp3", b);
    music3 = new SoundFile(this,filePath() + "music/MrJoCrafter - Insane Slimes.mp3");
  }
}
void lm4(){
  music4 = new SoundFile(this,filePath() + "music/Takijana - Temple.mp3");
  if(music4 != null){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music2/temple.mp3");
    saveBytes(filePath() + "music/Takijana - Temple.mp3", b);
    music4 = new SoundFile(this,filePath() + "music/Takijana - Temple.mp3");
  }
}
void lm5(){
  music5 = new SoundFile(this,filePath() + "music/MrJoCrafter - A Real Threat.mp3");
  if(music5 != null){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music2/arealthreat.mp3");
    saveBytes(filePath() + "music/MrJoCrafter - A Real Threat.mp3", b);
    music5 = new SoundFile(this,filePath() + "music/MrJoCrafter - A Real Threat.mp3");
  }
}
void lm6(){
  music6 = new SoundFile(this,filePath() + "music/MrJoCrafter - A Real Threat.mp3");
  if(music6 != null){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music2/yetdeeper.mp3");
    saveBytes(filePath() + "music/MrJoCrafter - Yet Deeper.mp3", b);
    music6 = new SoundFile(this,filePath() + "music/MrJoCrafter - Yet Deeper.mp3");
  }
}
