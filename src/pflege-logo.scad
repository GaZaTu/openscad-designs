include <lib/pflege.scad>

difference() {
  pflege_logo();
  move([0, 0, 2])
  cuboid([120, 80, 2]);
}

difference() {
  pflege_logo();
  move([0, 0, 0])
  cuboid([120, 80, 2]);
  move([51.5, 0, 2])
  cuboid([120, 80, 2]);
}

difference() {
  pflege_logo();
  move([0, 0, 0])
  cuboid([120, 80, 2]);
  move([-68.5, 0, 2])
  cuboid([120, 80, 2]);
}
