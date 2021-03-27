void takeScreenshot(){
  PImage img = createImage(width, height, RGB);
  img.loadPixels();
  for(int i = 0; i < (width / xFOV); i++){for(int j = 0; j < (height / xFOV); j++){
    for(int vx = 0; vx < xFOV; vx++){for(int yx = 0; yx < xFOV; yx++){
      //img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0, 90, 102); 
      if(map[xpos + i][ypos + j][zpos] == 1){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(250,10,10);}
      else if(map[xpos + i][ypos + j][zpos] == 2){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(60);}
      else if(map[xpos + i][ypos + j][zpos] == 3){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(70);}
      else if(map[xpos + i][ypos + j][zpos] == 4){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(80);}
      else if(map[xpos + i][ypos + j][zpos] == 5){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(95);}
      else if(map[xpos + i][ypos + j][zpos] == 6){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(110);}
      else if(map[xpos + i][ypos + j][zpos] == 7){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(155);}
      else if(map[xpos + i][ypos + j][zpos] == 8){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,255,0);}
      else if(map[xpos + i][ypos + j][zpos] == 9){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,245,0);}
      else if(map[xpos + i][ypos + j][zpos] == 10){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(255,255,80);}
      else if(map[xpos + i][ypos + j][zpos] == 11){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(240,240,100);}
      else if(map[xpos + i][ypos + j][zpos] == 12){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(255);}
      else if(map[xpos + i][ypos + j][zpos] == 13){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(225,235,245);}
      else if(map[xpos + i][ypos + j][zpos] == 14){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,180 - 20 * (i % 2) - 20 * (j % 2),0);}
      else if(map[xpos + i][ypos + j][zpos] == 15){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,220 - 20 * (j % 2) - 20 * (i % 2),0);}
      else if(map[xpos + i][ypos + j][zpos] == 16){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,0,255);}
      else if(map[xpos + i][ypos + j][zpos] == 17){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,0,240);}
      else if(map[xpos + i][ypos + j][zpos] == 18){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,255,255);}
      if(vx == 0 || vx == xFOV || yx == 0 || yx == xFOV){
        if(map[xpos + i][ypos + j][zpos] == -1){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0);}
        if(map[xpos + i][ypos + j][zpos] == -2){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0);}
        if(map[xpos + i][ypos + j][zpos] == -5){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0);}
        if(map[xpos + i][ypos + j][zpos] == -6){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0);}
        if(map[xpos + i][ypos + j][zpos] == -7){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0);}
        if(map[xpos + i][ypos + j][zpos] == -8){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0);}
        if(map[xpos + i][ypos + j][zpos] == -31){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0);}
      }else{
        if(map[xpos + i][ypos + j][zpos] == -1){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(145,99,7);}
        if(map[xpos + i][ypos + j][zpos] == -2){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(160);}
        if(map[xpos + i][ypos + j][zpos] == -5){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(245,149,98);}
        if(map[xpos + i][ypos + j][zpos] == -6){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(209,194,182);}
        if(map[xpos + i][ypos + j][zpos] == -7){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(111,125,113);}
        if(map[xpos + i][ypos + j][zpos] == -8){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(84,109,133);}
        if(map[xpos + i][ypos + j][zpos] == -31){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(117,96,28);}
      }
    }}
  }}
  img.updatePixels();
  img.save(filePath() + "screenshots/screenshot-" + (frameruleCounter * 5 + framecounter * (preset + 4) * 17) + ".png");
}
