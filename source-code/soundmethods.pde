float soundVolume = 1.0; Sound sound = new Sound(this);
SoundFile music1; SoundFile music2;SoundFile music3;SoundFile music4;SoundFile music5;SoundFile music6;SoundFile music7;
void stopmusic(){
  if(music1.isPlaying()){music1.stop();}
  if(music2.isPlaying()){music2.stop();}
  if(music3.isPlaying()){music3.stop();}
  if(music4.isPlaying()){music4.stop();}
  if(music5.isPlaying()){music5.stop();}
  if(music6.isPlaying()){music6.stop();}
  if(music7.isPlaying()){music7.stop();}
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

void caves3(){
  stopmusic();
  music7.play();
  sound.volume(abs(soundVolume));
}

void whyDoIHearBossMusic(){
  stopmusic();
  music5.play();
  sound.volume(abs(soundVolume));
}

void doPlayMusic(){
  if(!(music1.isPlaying()) && !(music2.isPlaying()) && !(music3.isPlaying()) && zpos == 0){
      if(random(1) > .98){
        wandering();
      }
    }
    if(!(music4.isPlaying()) && !(music5.isPlaying()) && zpos == 1){
      if(random(1) > .98){
        caves();
      }
    }
    if(!(music6.isPlaying()) && zpos == 2){
      if(random(1) > .98){
        caves2();
      }
    }
    if(!(music7.isPlaying()) && zpos == 3){
      if(random(1) > .98){
        caves3();
      }
    }
}

void lm1(){
  music1 = new SoundFile(this,filePath() + "music/Safe.wav",false);
  try{
    music1.play();
  }catch (NullPointerException e){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music3/safe.wav");
    saveBytes(filePath() + "music/Safe.wav", b);
    music1 = new SoundFile(this,filePath() + "music/Safe.wav",false);
  }
}
void lm2(){
  music2 = new SoundFile(this,filePath() + "music/Triumphant.wav",false);
  try{
    music2.play();
  }catch (NullPointerException e){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music3/triumphant.wav");
    saveBytes(filePath() + "music/Triumphant.wav", b);
    music2 = new SoundFile(this,filePath() + "music/Triumphant.wav",false);
  }
}
void lm3(){
  music3 = new SoundFile(this,filePath() + "music/Funderar.wav",false);
  try{
    music3.play();
  }catch (NullPointerException e){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music3/funderar.wav");
    saveBytes(filePath() + "music/Funderar.wav", b);
    music3 = new SoundFile(this,filePath() + "music/Funderar.wav",false);
  }
}
void lm4(){
  music4 = new SoundFile(this,filePath() + "music/Enter the Depths.wav",false);
  try{
    music4.play();
  }catch (NullPointerException e){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music3/enter-the-depths.wav");
    saveBytes(filePath() + "music/Enter the Depths.wav", b);
    music4 = new SoundFile(this,filePath() + "music/Enter the Depths.wav",false);
  }
}
void lm5(){
  music5 = new SoundFile(this,filePath() + "music/Mummy.wav",false);
  try{
    music5.play();
  }catch (NullPointerException e){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music3/mummy.wav");
    saveBytes(filePath() + "music/Mummy.wav", b);
    music5 = new SoundFile(this,filePath() + "music/Mummy.wav",false);
  }
}
void lm6(){
  music6 = new SoundFile(this,filePath() + "music/Stalagmites and Stalactites.wav",false);
  try{
    music6.play();
  }catch (NullPointerException e){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music3/stalagmites-and-stalactites.wav");
    saveBytes(filePath() + "music/Stalagmites and Stalactites.wav", b);
    music6 = new SoundFile(this,filePath() + "music/Stalagmites and Stalactites.wav",false);
  }
}
void lm7(){
  music7 = new SoundFile(this,filePath() + "music/Hypercurian.wav",false);
  try{
    music7.play();
  }catch (NullPointerException e){
    byte b[];
    b = loadBytes("https://github.com/TeamCstudios/SecretLands/raw/master/music3/hypercurian.wav");
    saveBytes(filePath() + "music/Hypercurian.wav", b);
    music7 = new SoundFile(this,filePath() + "music/Hypercurian.wav",false);
  }
}
