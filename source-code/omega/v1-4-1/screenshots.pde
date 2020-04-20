void takeScreenshot(){
  PImage img = createImage(width, height, RGB);
  img.loadPixels();
  for(int i = 0; i < (width / xFOV); i++){for(int j = 0; j < (height / xFOV); j++){
    for(int vx = 0; vx < xFOV; vx++){for(int yx = 0; yx < xFOV; yx++){
      //img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0, 90, 102); 
      if(map[xpos + i][ypos + j] == 1){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(250,10,10);}
      else if(map[xpos + i][ypos + j] == 2){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(60);}
      else if(map[xpos + i][ypos + j] == 3){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(70);}
      else if(map[xpos + i][ypos + j] == 4){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(80);}
      else if(map[xpos + i][ypos + j] == 5){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(95);}
      else if(map[xpos + i][ypos + j] == 6){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(110);}
      else if(map[xpos + i][ypos + j] == 7){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(155);}
      else if(map[xpos + i][ypos + j] == 8){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,255,0);}
      else if(map[xpos + i][ypos + j] == 9){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,245,0);}
      else if(map[xpos + i][ypos + j] == 10){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(255,255,80);}
      else if(map[xpos + i][ypos + j] == 11){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(240,240,100);}
      else if(map[xpos + i][ypos + j] == 12){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(255);}
      else if(map[xpos + i][ypos + j] == 13){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(225,235,245);}
      else if(map[xpos + i][ypos + j] == 14){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,180 - 20 * (i % 2) - 20 * (j % 2),0);}
      else if(map[xpos + i][ypos + j] == 15){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,220 - 20 * (j % 2) - 20 * (i % 2),0);}
      else if(map[xpos + i][ypos + j] == 16){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,0,255);}
      else if(map[xpos + i][ypos + j] == 17){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,0,240);}
      else if(map[xpos + i][ypos + j] == 18){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0,255,255);}
      if(vx == 0 || vx == xFOV || yx == 0 || yx == xFOV){
        if(map[xpos + i][ypos + j] == -1){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0);}
        if(map[xpos + i][ypos + j] == -2){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(0);}
      }else{
        if(map[xpos + i][ypos + j] == -1){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(145,99,7);}
        if(map[xpos + i][ypos + j] == -2){img.pixels[((j*xFOV+yx)*width) + i * xFOV + vx] = color(160);} 
      }
    }}
  }}
  img.updatePixels();
  img.save("screenshots/screenshot-" + (frameruleCounter * 5 + framecounter * (preset + 4) * 17) + ".png");
}
