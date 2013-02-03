class OscTool {

  PVector p, s;
  int numTraces = int(timeToTrace*fps);
  PVector[] traces = new PVector[numTraces];
  int tracerCount=0;
  boolean show = false;
  int idTool = 0;
  int idHand = 0;
  
  PFont font;
  String fontFace = "Arial";
  int fontSize = 12;
  int fontOverSample = 1;

  color fillColor2 = color(50, 250, 50); //tool = green

  OscTool() {
    p = new PVector(0, 0, 0);
    s = new PVector(20, 20);
    
    font = createFont(fontFace, fontOverSample*fontSize);
    textFont(font, fontSize);
    
    for (int i=0;i<traces.length;i++) {
      traces[i] = new PVector(0, 0, 0);
    }
  }

  void update() {
    if (show) {
      traces[tracerCount] = p;
      if (tracerCount<traces.length-1) {
        tracerCount++;
      }
      else {
        tracerCount=0;
      }
    }
  }

  void draw() {
    strokeWeight(2);
    for (int i=0;i<traces.length;i++) {
      if (i<traces.length-1 && traces[i] != p) {
        stroke(fillColor2, 100);
        if(showTraces) line(traces[i].x, traces[i].y, traces[i].z, traces[i+1].x, traces[i+1].y, traces[i+1].z);
      }
    }
    if (show) {
      ellipseMode(CENTER);
      fill(fillColor2);
      pushMatrix();
      translate(p.x, p.y, p.z);
      noStroke();
      ellipse(0, 0, s.x, s.y);
      fill(0);
      textAlign(CENTER);
      text(idHand + "." + idTool, 0, 3);
      popMatrix();
    }
  }

  void run() {
    update();
    if(debug) draw();
  } 
}

