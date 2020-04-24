/*
            Terrain Generator
    Created by Yoctobyte and MrJoCrafter

                  Presets
0: Normal
1: Southwestern Europe
2: Hyrule
3: Middle East
4: Indonesia
5: Desert Archipelago
6: Winter Wonderland
7: China
8: Random
*/

final int xFOV = 10;
int preset = 0;
float s = 1;
float l = 0.5;
float cxl = 0.499;
float bc = 0.04;
float speed = mapSize * 1000;
float x = 0;
float y = -s;
float t0 = 1;
float t1 = 1;
float r0 = 1;
float c0 = 0.01;
float c1 = 0.01;
float br0 = 1;
float bt0 = 2;
float bt1 = 2;
float bc0 = 0.01;
float bc1 = 0.01;
float bl = 0.6;
float bb = 0.01;
float wr0 = 1;
float wt0 = 5;
float wt1 = 5;
float wc0 = 0.01;
float wc1 = 0.01;
float wl = 0.50;
float wb = 0.05;
float tr0 = 1;
float tt0 = 10;
float tt1 = 10;
float tc0 = 0.01;
float tc1 = 0.01;
float tl = 0.5;
float fc = 1;
float rbnd = 0;

//Set the window size and certain other parameters

void terrainGenSetup() {
  x = 0;
  y = -s;
  noStroke(); 
  l = 0.5; bl = 0.6; tl = 0.5; wl = 0.50; bc = 0.04;
  if (preset == 1){l = 0.299;tl = 0.6;} 
  else if (preset == 2){l =  0.189;tl = 0.6;} 
  else if (preset == 3){l = 0.45;tl = 0.9;wl = 0.2;bc = 0.1;bl = 0.8;} 
  else if (preset == 4){l = 0.6;tl = 0.8;wl = 0.7;bl = 0.3;} 
  else if (preset == 5){l = 0.8;tl = 0.9;wl = 0.2;bl = 0.9;bc = 0.1;} 
  else if (preset == 6){wl = 0.2;tl = 0.1;l = .4;bl = 0.7;} 
  else if (preset == 7){l = .4;wl = 0.8;tl = 0.5;bl = 0.55;} 
  else if (preset == 8){l = random(1);wl = random(1);tl = random(1);bl = random(1);bc = random(.5);} 
  else if (preset == 9){wl = 0.2;tl = 0.001;l = .6;bl = 0.9;bc = 0.01;} 
  else if (preset == 10){l = x1;wl = x3;tl = x2;bl = x4;bc = x5 * 0.1;} 
}

//Generate the terrain
void terrainGenDraw() { 
  int z = 0; for(int i = 0; i < speed; i ++) {
  r0 = noise(t0,t1); 
  br0 = noise(bt0,bt1);
  wr0 = noise(wt0,wt1); 
  tr0 = noise(tt0,tt1);
  if(r0 > l*2.1 && wr0 > wl && br0 > bl){
    // Volcano
    z = 1;
  }else if(r0 > l*2){
    // Mountain
    z = 2;
  }else if(r0 > l*1.9){
    // Mountain
    z = 3;
  }else if(r0 > l*1.8){
    // Mountain
    z = 4; 
  }else if(r0 > l*1.7){
    // Mountain
    z = 5;
  }else if(r0 > l*1.6){
    // Mountain
    z = 6;
  }else if(r0 > l*1.5){
    // Mountain
    z = 7;
  }else if(r0 > l ){ 
    // Plains Biome
    z = 8;
    if(tr0 < tl-.1){
      if(wr0 > wl){ 
      // Desert Biome
      z = 10; 
      } 
      if(wr0 > wl-wb && wr0 < wl){ 
      // Desert Transition Biome
      z = 11; 
      } 
    }else if(tr0 > tl+.1){
      if(wr0 > wl){ 
      // Winter Biome
      z = 12; 
      } else if(wr0 > wl-wb && wr0 < wl){ 
      // Winter Transition Biome
      z = 13; 
      }
    }else{
      // Darkgrass Biome
      z = 9;
    }
    if(br0 > bl){ 
    // Forest Biome
    z = 14;
    } 
    if(br0 > bl-bb && br0 < bl){ 
    // Forest Transition
    z = 15;
    } 
  }else if(r0 > (l-bc) && r0 < l){ 
    // Beach
    z = 11; 
  }else if(r0 < l*0.5){
    // Deep Ocean
    z = 17;
  }else{
    if(tr0 > tl+.2){
      //Frozen Ocean
      z = 18;
    }else{
      // Ocean
      z = 16;
    }
  }
  map[int(x)][int(y) + 1][0] = z; 
  x += s;
  if(x > mapSize) { x = 0; y += s; t0 = 1;  t1 += c1; bt1 += bc1; bt0 = 1; wt1 += wc1; wt0 = 1; tt1 += tc1; tt0 = 1;}
  t0 += c0; bt0 += bc0; wt0 += wc0; tt0 += tc0;}
}

void terrainGenDrawCaves() { 
  x = 0;
  y = -s;
  int z = 0; for(int i = 0; i < speed; i ++) {
  r0 = noise(t0,t1);
  if(r0 > cxl*2.1){
    // Volcano
    z = 1;
  }else if(r0 > cxl && r0 < cxl*1.1){ 
    // Stone
    z = 6;
  }else if(r0 < cxl){
    // Floors
    z = 7;
  }else{
    //Cave Walls
    z = 0;
  }
  map[int(x)][int(y) + 1][1] = z; 
  x += s;
  if(x > mapSize) { x = 0; y += s; t0 = 1;  t1 += c1; bt1 += bc1; bt0 = 1; wt1 += wc1; wt0 = 1; tt1 += tc1; tt0 = 1;}
  t0 += c0; bt0 += bc0; wt0 += wc0; tt0 += tc0;}
}
