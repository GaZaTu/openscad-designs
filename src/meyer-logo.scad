include <lib/meyer.scad>

difference() {
  meyer_logo();
  move([0, 0, 2])
  cuboid([80, 80, 2]);
}

difference() {
  meyer_logo();
  move([0, 0, 0])
  cuboid([80, 80, 2]);
}
