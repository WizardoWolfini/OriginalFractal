class Hexagon_Locations {
  private float x;
  private float y;
  private boolean marked;
  public Hexagon_Locations(float x2, float y2) {
    x = x2;
    y = y2;
    marked = false;
  }
  public void drawPoint() {
    if (marked) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    ellipse(x, y, 5, 5);
  }
  public void checkHex() {
    int numHexs = 0;
    for (Hexagon_Locations hexpoint : HexPoints) {
     if (marked == false) {
        if (dist(x, y, hexpoint.getX(), hexpoint.getY()) < 50 && hexpoint.checkMarked() == true) {
          numHexs++;
        }
      }
    }
    if (numHexs == 6) {
      fill(255,255,0);
      beginShape();
      for (int i = 0; i < 6; i++) {
        float newx = x + 44 * cos(i * 2 * (float)Math.PI/(6));
        float newy = y + 44 * sin( i * 2 * (float)Math.PI/(6));
        vertex(newx, newy);
      }
      endShape();
      println("yay");
    }
  }
  public int getX() {
    return (int)x;
  }
  public int getY() {
    return (int)y;
  }
  public boolean checkMarked() {
    return marked;
  }
  public void mark() {
    marked = !marked;
  }
}
