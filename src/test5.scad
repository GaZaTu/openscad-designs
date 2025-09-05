include <../BOSL2/std.scad>
include <../BOSL2/screws.scad>

$fn = 32;

xrot(180)
  screw("m2", l=6, head="button", drive="t6", anchor=TOP);
