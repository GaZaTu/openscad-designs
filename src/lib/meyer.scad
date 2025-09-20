include <../../BOSL2/std.scad>
include <../../BOSL2/walls.scad>

use <avita.outline-black.otf> // "Avita Outline:style=Outline Black"
use <aileron.black.otf> // "Aileron:style=Black"

$fn = 32;

module meyer_logo()
  scale([2, 2, 2])
  cuboid([40, 40, 1.5], chamfer=0.75, edges=[BOT]) {
    attach(TOP, TOP, align=LEFT)
      color("white")
      resize([35.2, 0, 0])
      move([13.5, 6, 0])
      zrot(180)
      linear_extrude(1)
      text("M", 25, "Avita Outline:style=Outline Black");
    attach(TOP, TOP, align=LEFT)
      color("white")
      move([6.3, -12, 0])
      zrot(180)
      linear_extrude(1)
      text("meyer", 9.1, "Aileron:style=Black", spacing=0.9);
  }

module meyer_logo_face(cube_face)
  attach(cube_face, BACK, align=CENTER, shiftout=-1.5)
  move([0, 47, 0])
  xrot(90)
  meyer_logo();

module meyer_cube(partial)
  diff()
  cuboid([120, 120, 140], chamfer=16, edges=[BOT, LEFT+FRONT, RIGHT+FRONT, LEFT+BACK, RIGHT+BACK]) {
    tag(partial ? "remove" : "")
    meyer_logo_face(LEFT);
    tag(partial ? "remove" : "")
    meyer_logo_face(RIGHT);
    tag(partial ? "remove" : "")
    meyer_logo_face(FRONT);
    tag(partial ? "remove" : "")
    meyer_logo_face(BACK);

    tag("remove")
    attach(TOP, TOP, align=CENTER, inside=true, shiftout=32)
    cuboid([108, 108, 120], chamfer=12);
  }
