/*
Mountains:
1: Volcano (250,10,10)
2-4: Mountain Peak (60) (70) (80)
5-6: Mountain (95) (110)
7: Foothills (155)

Plains:
8: Grasslands (0,255,0)
9: Dark Grasslands (0,245,0)

Desert:
10: Desert (255,255,80)
11: Desert Transition (240,240,100)
11: Beach (240,240,100)

Tundra:
12: Tundra (255)
13: Tundra Transition (225,235,245)

Forest:
14: Forest (0,180,0)
15: Forest Transition (0,220,0)

Ocean:
16: Ocean (0,0,255)
17: Deep Ocean (0,0,240)
*/

final int mapSize = 4000;
int[][] map = new int[mapSize + 1][mapSize + 1];

void drawTerrain(){
  int value = 0;
  for(int i = 0; i < (width / xFOV); i++){for(int j = 0; j < (height / xFOV); j++){
    if(xpos+i > mapSize || xpos+i < 1 || ypos+j > mapSize || ypos+j < 1 || ypos+j > 990){
      fill(0,0,240);
      value = 17;
    }else{
      value = map[xpos+i][ypos+j];
    }
    if(value == 1){fill(250,10,10);}
    else if(value == 2){fill(60);}
    else if(value == 3){fill(70);}
    else if(value == 4){fill(80);}
    else if(value == 5){fill(95);}
    else if(value == 6){fill(110);}
    else if(value == 7){fill(155);}
    else if(value == 8){fill(0,255,0);}
    else if(value == 9){fill(0,245,0);}
    else if(value == 10){fill(255,255,80);}
    else if(value == 11){fill(240,240,100);}
    else if(value == 12){fill(255);}
    else if(value == 13){fill(225,235,245);}
    else if(value == 14){fill(0,180 - 20 * (i % 2) - 20 * (j % 2),0);}
    else if(value == 15){fill(0,220 - 20 * (j % 2) - 20 * (i % 2),0);}
    else if(value == 16){fill(0,0,255);}
    else if(value == 17){fill(0,0,240);}
    else if(value == 18){fill(0,255,255);}
    rectMode(CORNER);
    if(i == (width/xFOV/2) && j == (height/xFOV/2)){
      tileValue = value;
      if(playerColor == 1){  
        fill(255,0,0);
        rect(i * xFOV,j * xFOV,xFOV,xFOV);
        textSize(10);
        fill(100,50,50);
        text("N",i * xFOV + xFOV * .1,j * xFOV + xFOV * .85);
        textSize(36);
        cSpeed = 1;
      } else if(playerColor == 2){  
        fill(50,50,255);
        rect(i * xFOV,j * xFOV,xFOV,xFOV);
        textSize(10);
        fill(50,50,80);
        text("W",i * xFOV,j * xFOV + xFOV * .85);
        textSize(36);
        cSpeed = 1;
      } else if(playerColor == 3){  
        fill(50,89,50);
        rect(i * xFOV,j * xFOV,xFOV,xFOV);
        textSize(10);
        fill(170,180,50);
        text("M",i * xFOV,j * xFOV + xFOV * .85);
        textSize(36);
        cSpeed = 1;
      } else if(playerColor == 4){  
        fill(100,255,100);
        rect(i * xFOV,j * xFOV,xFOV,xFOV);
        textSize(10);
        fill(170,200,170);
        text("S",i * xFOV,j * xFOV + xFOV * .85);
        textSize(36);
        cSpeed = 2;
      } else if(playerColor == 5){  
        fill(0,255,255);
        rect(i * xFOV,j * xFOV,xFOV,xFOV);
        textSize(10);
        fill(200,255,255);
        text(" I",i * xFOV,j * xFOV + xFOV * .85);
        textSize(36);
        cSpeed = 1;
      }
    }else{
      rect(i * xFOV,j * xFOV,xFOV,xFOV);
    }}
}}