class agentes {
  
  // Tracking localition, vel and accelaration of each Agent
  PVector local;
  PVector vel;
  PVector acc;
  
   float perlinX, perlinY;
   int topspeed;
   
   int life;
   int colorine;
   
   int rand;
 
   //  constructor, 
  agentes (float tempX, float tempY) {
   
  local=new PVector(tempX,tempY);
  //  local=new PVector(0,0);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    topspeed=10;
    //the color variation of the particles
    colorine=int(random(180,210));

//how long will the particle live. random betwwen 70-300
  life=int(random(70,300));  
  // here I divide de particles group in four smaller ones (nr 1, nr2,nr3 and nr4) that will have direfent acelaration possibilities
   rand=int(random(1,4));

 }
 
  void update () {
  
   //random accelaration for each group of particles. play here with the random possibilities to change the forces
  if(rand==1 ){
  acc.x=random(-0.11,0.14);
  acc.y=random(-0.12,0.11);
  }
    if(rand==2 ){
  acc.x=random(-0.11,0.13);
  acc.y=random(-0.12,0.11);
  }
    if(rand>=3){
  acc.x=random(-0.12,0.15);
  acc.y=random(-0.11,0.11);
  }
   
   vel.add(acc);
   vel.limit(topspeed);
   local.add(vel);
   life--;
   
  }
 
 void display () {
 colorMode(HSB, 360,100,100);
 colorine++;
 fill(colorine,20,20, 100);
 stroke(colorine,0,0, 100);
 if(life>0) point(local.x,local.y);

 }
   
   
}
