//Valtozok
PImage originalImage;
PImage showedImage;
color copiedColor;
float brightnessOfCopiedColor;
int numberOfPixels;
float tolerance=20;
float currentBrightness;
color currentColor;

void setup(){
  //A kiindulasi kep
  originalImage=loadImage("mng_1.jpg");
  
  //A megjelenitett kep
  size(1200,982);
  numberOfPixels=width*height;
}

void draw(){
  colorMode(HSB);
  copiedColor=originalImage.get(mouseX,mouseY);
  brightnessOfCopiedColor=brightness(copiedColor);
  //println(brightnessOfCopiedColor);
  loadPixels();
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      pixels[i+j*width]=originalImage.get(i,j);
    }
  }
  for(int i=0;i<numberOfPixels;i++){
    currentBrightness=brightness(pixels[i]);
    if(abs(brightnessOfCopiedColor-brightness(pixels[i]))>tolerance){
      currentBrightness=currentBrightness*0.9;
      currentColor=color(hue(pixels[i]),saturation(pixels[i]),currentBrightness-50);
      pixels[i]=(currentColor);
    }
  }
  updatePixels();
}