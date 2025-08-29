include <../BOSL2/std.scad>

box_wall = 3;
box_width = 140;
box_length = 80;
box_height = 40;

diff()
  cube([box_width, box_length, box_height]) {
    attach(TOP, TOP, inside=true, align=CENTER, shiftout=6)
      cube([box_width - box_wall, box_length - box_wall, box_height]) {
        attach(BOTTOM, CENTER, inside=true, align=FWD+RIGHT, shiftout=0.1)
          move([0, 10, 10])
            rotate([0, 90, 0])
              cylinder(box_wall, r = 6);
      }
  }
