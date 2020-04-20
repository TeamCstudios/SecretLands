void initialize(){
  xpos = mapSize / 2;
  ypos = mapSize / 2;
  selection = 0;
  playerColor = 1;
  for(int i = 0; i < 30; i++){
    inventory[i] = 0;
  }
  countdown = 0;
}

void framecounter(){
  if(framecounter < 5){
    framecounter++;
  }else if(framecounter == 5){
    framecounter = 0;
    frameruleCounter++;
  }
}
