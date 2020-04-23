int leSelection = 1; float x1 = 0.3; float x2 = 0.6; float x3  = 0.5; float x4  = 0.6; float x5  = 0.1;
void customMenu(){
  background(100);
  fill(185);
  textSize(20);
  if(leSelection == 1){
    text("<-[" + "Land = " + nf(x1, 0, 1) + "]->" + "\nLower = More Land, Higher = Less land.",10,50);
  }else{
    text("Land = " + nf(x1, 0, 1) + "\nLower = More Land, Higher = Less land.",10,50);
  }
  if(leSelection == 2){
    text("<-[" + "Temperature Extremity = " + nf(x2, 0, 1)  + "]->" + "\nLower = More Extreme Hot/Cold, Higher = Less extreme Hot/Cold.",10,110);
  }else{
    text("Temperature Extremity = " + nf(x2, 0, 1) + "\nLower = More Extreme Hot/Cold, Higher = Less extreme Hot/Cold.",10,110);
  }
  if(leSelection == 3){
    text("<-[" + "Temperature = " + nf(x3, 0, 1)  + "]->" + "\nLower = Colder, Higher = Warmer.",10,170);
  }else{
    text("Temperature = " + nf(x3, 0, 1)  + "\nLower = Colder, Higher = Warmer.",10,170);
  }
  if(leSelection == 4){
    text("<-[" + "Forest = " + nf(x4, 0, 1)   + "]->" + "\nLower = More Forest, Higher = Less Forest.",10,230);
  }else{
    text("Forest = " + nf(x4, 0, 1)  + "\nLower = More Forest, Higher = Less Forest.",10,230);
  }
  if(leSelection == 5){
    text("<-[" + "Beach = " + nf(x5, 0, 1)  + "]->" + "\nLower = Less Beach, Higher = More Beach.",10,290);
  }else{
    text("Beach = " + nf(x5, 0, 1)  + "\nLower = Less Beach, Higher = More Beach.",10,290);
  }
}
