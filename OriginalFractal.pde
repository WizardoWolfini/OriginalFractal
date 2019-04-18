ArrayList<Hexagon_Locations> HexPoints = new ArrayList<Hexagon_Locations>();
ArrayList<Integer[]> coordsused = new ArrayList<Integer[]>();
public void setup() {
  size(1200, 1200);
  for (int i = 0; i < 6; i++) {
    float newx = 600 +  8 * 45 * cos(i * 2 * (float)Math.PI/(6));
    float newy = 600 +  8 * 45 * sin( i * 2 * (float)Math.PI/(6));
    createHex(newx, newy, 1);
  }
  createHex(600, 600, 0);
  int num = 0;
  for (Integer[] intarr : coordsused) {
    HexPoints.add(new Hexagon_Locations(intarr[0], intarr[1]));
  }
}
public void draw() {
  background(125);
  for (Hexagon_Locations point : HexPoints) {
    point.drawPoint();
    point.checkHex();
  }
}
public void mousePressed() {
  for (Hexagon_Locations hexpoint : HexPoints) {
    if (dist(mouseX, mouseY, hexpoint.getX(), hexpoint.getY()) < 20) {
      hexpoint.mark();
    }
  }
}
public void createHex(float x, float y, int hexmax) {
  hexmax++;
  Integer[] newintarr = {(int)x, (int)y};
  boolean used = false;
  for (Integer[] intarr : coordsused) {
    if ((intarr[0] >= x - 2 && intarr[0] <= x + 2 )&& (intarr[1] >= y - 2 && intarr[1] <= y + 2 )) {
      used = true;
    }
  }
  if (used == false) {
    coordsused.add(newintarr);
  }
  if (hexmax <= 6) {
    for (int i = 0; i < 6; i++) {
      float newx = x + 45 * cos(i * 2 * (float)Math.PI/(6));
      float newy = y + 45 * sin( i * 2 * (float)Math.PI/(6));
      createHex(newx, newy, hexmax);
    }
  }
}
