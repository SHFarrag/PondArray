//SHFarrag
// Oct 2023

ArrayList<Tadpole> tadpoles = new ArrayList<Tadpole>();

void setup() {
  size(500, 500);
  for (int i = 0; i < 120; i++) {
    tadpoles.add(new Tadpole());
  }
  noStroke();
}

void draw() {
  background(255);
  for (int i = 0; i < 120; i += 1) {
    tadpoles.get(i).update();
    tadpoles.get(i).display();
  }
}

class Tadpole {
  float t, ts;
  PVector pos;
  PVector[] prev = new PVector[10];

  Tadpole() {
    t = random(10000);
    ts = random(100);
    for (int i = 0; i < 10; i++) {
      prev[i] = new PVector(0, 0);
    }
  }

  void update() {
    pos = new PVector(
      noise(t + ts) * width,
      noise(t + ts + 100) * height
    );
    t += 0.005;
  }

  void display() {
    fill(0);
    ellipse(pos.x, pos.y, 4, 4);

    for (int i = 9; i > 0; i--) {
      prev[i].set(prev[i - 1]);
      fill(20, 50, 0, 10);
      ellipse(prev[i].x, prev[i].y, 14 - i, 14 - i);
    }
    prev[0].set(pos);
  }
}
