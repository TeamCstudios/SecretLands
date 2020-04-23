void initialize(){
  xpos = mapSize / 2;
  ypos = mapSize / 2;
  selection = 0;
  playerColor = 1;
  for(int i = 0; i < 30; i++){
    inventory[i] = 0;
  }
  countdown = 0;
  health = 16;
}

void framecounter(){
  if(millis() % 1000 == 0){
    //timeStorage++;
    //frameStorage = frameCount;
  }
  if(framecounter < 5){
    framecounter++;
  }else if(framecounter == 5){
    framecounter = 0;
    frameruleCounter++;
  }
  if(framecounter == 0){
    framerate = int((frameCount/* - frameStorage */) / ((millis()/* - 1000 * timeStorage */) / 1000));
  }
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
