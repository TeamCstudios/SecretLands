int[] inventory = new int[30];

void inventory(){
  fill(155);
  textSize(36);
  text("Items",20,50);
  text("Current Form:",500,50);
  textSize(14);
  text("Wood:",20,120);
  text("Stone:",20,140);
  text("Apple [B]:",20,180);
  text("Coal:",20,160);
  text("Copper:",20,200);
  text("Iron:",20,220);
  text("" + inventory[1],70,120);
  text("" + inventory[2],70,140);
  text("" + inventory[4],70,160);
  text("" + inventory[3],90,180);
  text("" + inventory[5],90,200);
  text("" + inventory[6],90,220);
  text("Gel:",20,260);
  text("Green:",40,270);
  text("Blue:",40,285);
  text("Red:",40,300);
  text("Purple:",40,315);
  text("" + inventory[26],90,270);
  text("" + inventory[27],90,285);
  text("" + inventory[28],90,300);
  text("" + inventory[29],90,315);
  textSize(14);
  if(playerColor == 1){
    text("Normal",500,110);
    text("Passive Ability: None",500,130);
    text("Active Ability (E): Get wood in a forest.",500,145);
  }else if(playerColor == 2){
    text("Swimmer",500,110);
    text("Passive Ability: Navigate shallow water.",500,130);
  }else if(playerColor == 3){
    text("Climber",500,110);
    text("Passive Ability: Navigate mountains.",500,130);
    text("Active Ability (E): Get stone from a mountain.",500,145);
  }else if(playerColor == 4){
    text("Sprinter",500,110);
    text("Passive Ability: Double your speed.",500,130);
    text("Active Ability (E): Get wood in a forest.",500,145);
  }else if(playerColor == 5){
    text("Iceman",500,110);
    text("Passive Ability: Freeze water into ice.",500,130);
  }
  stroke(0);
  noFill();
  rectMode(CORNER);
  rect(300,500,150,50);
  noStroke();
  if(attackPower == 1){
    text("Fists",305,515);
    text("[Upgrade: 100 Wood]",305,540);
  }else if(attackPower == 2){
    text("Wood Sword",305,515);
    text("[Upgrade: 60 Stone]",305,540);
  }else if(attackPower == 3){
    text("Stone Sword",305,515);
    text("[Upgrade: 15 Copper]",305,540);
  }else if(attackPower == 5){
    text("Copper Sword",305,515);
    text("[Upgrade: 12 Iron]",305,540);
  }else if(attackPower == 7){
    text("Iron Sword",305,515);
    //text("[Upgrade: 12 Iron]",305,540);
  }
  textSize(16);
  ellipseMode(CORNER);
  text("Normal Form: " + inventory [20],10,600);
  fill(200,215,255);
  ellipse(10,610,50,50);
  fill(155);
  text("Press [1]",10,675);
  text("Water Form: " + inventory [21],140,600);
  fill(50,50,200);
  ellipse(140,610,50,50);
  fill(155);
  text("Press [2]",140,675);
  text("Climber Form: " + inventory [22],270,600);
  fill(50,100,50);
  ellipse(270,610,50,50);
  fill(155);
  text("Press [3]",270,675);
  text("Sprinter Form: " + inventory [23],400,600);
  fill(150,255,150);
  ellipse(400,610,50,50);
  fill(155);
  text("Press [4]",400,675);
  text("Iceman Form: " + inventory [24],530,600);
  fill(0,255,255);
  ellipse(530,610,50,50);
  fill(155);
  text("Press [5]",530,675);
}

void mouseClicked(){
  if(scene == 4 && mouseX < 500 && mouseX > 300 && mouseY > 500 && mouseY < 550){
    if(attackPower == 1){
      if(inventory[1] > 99){
        inventory[1]-=100;
        attackPower = 2;
      }
    }else if(attackPower == 2){
      if(inventory[2] > 59){
        inventory[2]-=60;
        attackPower = 3;
      }
    }else if(attackPower == 3){
      if(inventory[5] > 14){
        inventory[5]-=15;
        attackPower = 5;
      }
    }else if(attackPower == 5){
      if(inventory[6] > 11){
        inventory[6]-=12;
        attackPower = 7;
      }
    }
  }
}
