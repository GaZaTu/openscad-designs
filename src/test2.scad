include <../BOSL2/std.scad>
include <../BOSL2/hinges.scad>

$fn=32;
thickness=2;
seg_gap = 0.2;
end_space = 0.3;
ang=$preview ? 0 : 0;
module myhinge(inner)
  knuckle_hinge(length=25, segs=13,offset=thickness/2+end_space, inner=inner, clearance=-thickness/2, knuckle_diam=thickness,
                 arm_angle=45, gap=seg_gap, in_place=true, clip=thickness/2)
                 children();
module leaf() cuboid([25,thickness,15],anchor=TOP+BACK, rounding=7, edges=[BOT+LEFT,BOT+RIGHT]);
xrot(90)
  myhinge(true){
    position(BOT) leaf();
    color("lightblue")
      up(end_space) attach(BOT,TOP,inside=true)
      tag("")  // cancel default "remove" tag
      xrot(-ang,cp=[0,-thickness/2,thickness/2]) myhinge(false)
        position(BOT) leaf();
  }
