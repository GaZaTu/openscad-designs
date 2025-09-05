include <../BOSL2/std.scad>
include <../BOSL2/hinges.scad>

$fn=32;

box_wall = 2;
box_width = 20;
box_length = 30;
box_height = 15;

xrot(270)
knuckle_hinge(length=25, segs=13, offset=1+0.2, in_place=true, inner=true, knuckle_diam=2, clearance=-1, clip=1, arm_angle=45, gap=0.2) {
  // attach(BOTTOM, TOP, align=BACK+RIGHT)
  position(BOT)
  // rotate([0, -90, 90])
  diff()
    cuboid([30, 14, 15], anchor=TOP+BACK, rounding=0) {
      attach(TOP, TOP, inside=true, align=CENTER, shiftout=6)
        cube([26, 10, 20]) {
          // attach(BOTTOM, CENTER, inside=true, align=FWD+RIGHT, shiftout=0.1)
          //   move([0, 10, 10])
          //     rotate([0, 90, 0])
          //       cylinder(box_wall, r = 6);
        }
    }

  color("lightblue")
    up(0.2)
    attach(BOT, TOP, inside=true)
    xrot(0, cp=[0,-1,1])
      knuckle_hinge(length=25, segs=13, offset=1+0.2, in_place=true, inner=false, knuckle_diam=2, clearance=-1, clip=1, arm_angle=45, gap=0.2)
        position(BOT)
          cuboid([30, 2, 11.5], anchor=TOP+BACK, edges=[BOT+LEFT,BOT+RIGHT], rounding=0);
}
