import processing.pdf.*;

public void settings() {
  size(800, 600);
}

void setup() {
  background(0);
  beginRecord(PDF, "visualization.pdf");  
  
  for(int i = 1; i < 10000; i++) {
    IntList sequence = new IntList();
    int n = i;
    //int steps = 0;
    
    do {    // Generate the nums and put em in a list
      sequence.append(n);
      n = collatz(n);
      //steps++;
    } while(n != 1);
    
    sequence.append(1); // add one to the end as well
    sequence.reverse();
    
    resetMatrix();
    translate(0, height/2);
    float len = 5;
    float angle = 0.2;
    
    // Pick color for it 
    if( i % 4 == 0) {
      stroke(102, 102, 255, 50);
    } else if(i % 4 == 1) {
      stroke(102, 102, 153, 50);
    } else if(i % 4 == 2) {
      stroke(255, 0, 102, 50);
    } else {
      stroke(0, 255, 255, 50);
    }
     
    // vis the reversed list
    for(int j = 0; j < sequence.size(); j++) {
      int val = sequence.get(j);
      // Do transform step for each val in the list for the ith collatz #
      if(val % 2 == 0) { rotate(angle); } 
      else             { rotate(-angle); }
      
      strokeWeight(3);
      line(0, 0, len, 0);
      translate(len, 0);
    }
  }
  println("finished");
  endRecord();
}

int collatz(int n) {
 if(n % 2 == 0) {
   return n / 2;
 } else {
   return (n*3+1)/2; // Alternatively, (n*3+1)/1
 }
}
