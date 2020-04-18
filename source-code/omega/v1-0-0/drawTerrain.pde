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

int[][] map = new int[2001][2001];

void drawTerrain(){
  int value;
  for(int i = 0; i < (width / 10); i++){for(int j = 0; j < (height / 10); j++){
    
    value = map[abs((xpos+i) % 2000)][abs((ypos+j) % 2001)];
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
    rectMode(CORNER);
    if(i == (width/20) && j == (height/20)){
      tileValue = value;
      fill(255,0,0);
    }
    rect(i * 10,j * 10,10,10);
    
  }}
}
