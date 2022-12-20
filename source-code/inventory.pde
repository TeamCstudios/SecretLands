int[] inventory = new int[30];
int craftingSelection = 0;

/*
Inventory:
0: 
1: Wood
2: Stone
3: Coal
4: Apple
5: Copper
6: Iron
7: Tin
8: Osmium
9: Uranium
10: Gold
11-19:
20: Normal Form
21: Swimmer Form
22: Climber Form
23: Sprinter Form
24: Iceman Form
25: Super Form
26: Green Gel
27: Blue Gel
28: Red Gel
29: Purple Gel
*/
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
  text("Tin:",120,120);
  text("Osmium:",120,140);
  text("Uranium:",120,160);
  text("Gold:",120,180);
  text("" + inventory[7],170,120);
  text("" + inventory[8],180,140);
  text("" + inventory[9],185,160);
  text("" + inventory[10],175,180);
  text("Gel:",20,257);
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
    text("Passive Ability: Navigate mountains or cave walls.",500,130);
    text("Active Ability (E): Get stone from a mountain or cave.",500,145);
  }else if(playerColor == 4){
    text("Sprinter",500,110);
    text("Passive Ability: Double your speed.",500,130);
    text("Active Ability (E): Get wood in a forest.",500,145);
  }else if(playerColor == 5){
    text("Iceman",500,110);
    text("Passive Ability: Freeze water into ice.",500,130);
  }else if(playerColor == 6){
    text("Super",500,110);
    text("Passive Ability 1: Become invincible.",500,130);
    text("Passive Ability 2: Freeze lava into stone.",500,145);
    text("Passive Ability 3: Navigate anywhere except Deep Water.",500,160);
    text("Passive Ability 4: Double your speed.",500,175);
  }
  stroke(0);
  noFill();
  rectMode(CORNER);
  rect(300,300,300,50);
  rect(300,400,300,50);
  rect(300,500,300,50);
  noStroke();
  if(craftingSelection == 0){
    text("<- Craft Normal Form ->",305,315);
    text("[15 Wood, 1 Green Gel]",305,340);
  }else if(craftingSelection == 1){
    text("<- Craft Swim Form ->",305,315);
    text("[5 Copper, 5 Blue Gel]",305,340);
  }else if(craftingSelection == 2){
    text("<- Craft Climb Form ->",305,315);
    text("[10 Coal, 5 Red, 5 Green Gel]",305,340);
  }else if(craftingSelection == 3){
    text("<- Craft Sprint Form ->",305,315);
    text("[5 Iron, 10 Green Gel]",305,340);
  }else if(craftingSelection == 4){
    text("<- Craft Ice Form ->",305,315);
    text("[10 Osmium, 10 Blue Gel]",305,340);
  }else if(craftingSelection == 5){
    text("<- Craft Super Form ->",305,315);
    text("[10 Uranium, 5 Red, 15 Purple Gel]",305,340);
  }/*else if(craftingSelection == 6){
    text("<- Craft Golden Apple ->",305,315);
    text("[1 Apple, 4 Gold]",305,340);
  }*/
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
    text("[Upgrade: 5 Tin, 10 Copper]",305,530);
  }else if(attackPower == 8){
    text("Bronze Sword",305,515);
    text("[Upgrade: 15 Iron,15 Coal]",305,540);
  }else if(attackPower == 9){
    text("Steel Sword",305,515);
    text("[Upgrade: 15 Iron,25 Coal, 5 Uranium]",305,540);
  }else if(attackPower == 10){
    text("Greensteel Sword",305,515);
    //text("[Upgrade: 15 Iron,\n25 Coal, 5 Uranium]",305,540);
  }
  if(armorPower == 0){
    text("No Armor",305,415);
    text("[Upgrade: 50 Wood]",305,440);
  }else if(armorPower == 2){
    text("Thatched Armor",305,415);
    text("[Upgrade: 20 Copper,5 Tin]",305,430);
  }else if(armorPower == 4){
    text("Bronze Armor",305,415);
    text("[Upgrade: 20 Iron,25 Coal]",305,430);
  }else if(armorPower == 6){
    text("Steel Armor",305,415);
    text("[Upgrade: 20 Osmium]",305,430);
  }else if(armorPower == 8){
    text("Iridosule Armor",305,415);
    //text("[Upgrade: 20 Osmium]",305,430);
  }
  textSize(16);
  ellipseMode(CORNER);
  text("Normal Form: " + inventory[20],10,580);
  fill(200,215,255);
  ellipse(10,610,50,50);
  fill(155);
  text("Press [1]",10,675);
  text("Water Form: " + inventory[21],140,600);
  fill(50,50,200);
  ellipse(140,610,50,50);
  fill(155);
  text("Press [2]",140,675);
  text("Climber Form: " + inventory[22],270,580);
  fill(50,100,50);
  ellipse(270,610,50,50);
  fill(155);
  text("Press [3]",270,675);
  text("Sprinter Form: " + inventory[23],400,600);
  fill(150,255,150);
  ellipse(400,610,50,50);
  fill(155);
  text("Press [4]",400,675);
  text("Iceman Form: " + inventory[24],530,580);
  fill(0,255,255);
  ellipse(530,610,50,50);
  fill(155);
  text("Press [5]",530,675);
  text("Super Form: " + inventory[25],660,600);
  fill(117,16,163);
  ellipse(660,610,50,50);
  fill(155);
  text("Press [6]",660,675);
}

void mouseClicked(){
  if(scene == 4 && mouseX < 600 && mouseX > 300 && mouseY > 300 && mouseY < 350){
    if(craftingSelection == 0){
      if(inventory[1] > 14 && inventory[26] > 0){
        inventory[1]-=15;
        inventory[26]--;
        inventory[20]++;
      }
    }else if(craftingSelection == 1){
      if(inventory[5] > 4 && inventory[27] > 5){
        inventory[5]-=5;
        inventory[27]-=5;
        inventory[21]++;
      }
    }else if(craftingSelection == 2){
      if(inventory[3] > 9 && inventory[26] > 5 && inventory[26] > 5){
        inventory[3]-=10;
        inventory[26]-=5;
        inventory[28]-=5;
        inventory[22]++;
      }
    }else if(craftingSelection == 3){
      if(inventory[8] > 9 && inventory[27] > 9){
        inventory[8]-=10;
        inventory[27]-=10;
        inventory[23]++;
      }
    }else if(craftingSelection == 4){
      if(inventory[9] > 9 && inventory[28] > 4 && inventory[29] > 14){
        inventory[9]-=10;
        inventory[28]-=5;
        inventory[29]-=15;
        inventory[24]++;
      }
    }
  }
  if(scene == 4 && mouseX < 600 && mouseX > 300 && mouseY > 500 && mouseY < 550){
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
    }else if(attackPower == 7){
      if(inventory[5] > 9 && inventory[7] > 4){
        inventory[5]-=10;
        inventory[7]-=5;
        attackPower = 8;
      }
    }else if(attackPower == 8){
      if(inventory[6] > 14 && inventory[3] > 14){
        inventory[3]-=15;
        inventory[6]-=15;
        attackPower = 9;
      }
    }else if(attackPower == 9){
      if(inventory[6] > 14 && inventory[3] > 24 && inventory[9] > 4){
        inventory[6]-=15;
        inventory[3]-=25;
        inventory[9]-=5;
        attackPower = 10;
      }
    }
  }
  if(scene == 4 && mouseX < 600 && mouseX > 300 && mouseY > 400 && mouseY < 450){
    if(armorPower == 0){
      if(inventory[1] > 49){
        inventory[1]-=50;
        armorPower = 2;
      }
    }else if(armorPower == 2){
      if(inventory[5] > 19 && inventory[7] > 4){
        inventory[5]-=20;
        inventory[7]-=5;
        armorPower = 4;
      }
    }else if(armorPower == 4){
      if(inventory[6] > 19 && inventory[3] > 24){
        inventory[6]-=20;
        inventory[3]-=25;
        armorPower = 6;
      }
    }else if(armorPower == 6){
      if(inventory[7] > 19){
        inventory[7]-=20;
        armorPower = 8;
      }
    }
  }
}
