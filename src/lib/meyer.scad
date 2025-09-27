include <../../BOSL2/std.scad>

use <avita.outline-black.otf> // "Avita Outline:style=Outline Black"
use <aileron.black.otf> // "Aileron:style=Black"

module sparse_wall_inverted(h=50, l=100, thick=4, maxang=30, strut=5, max_bridge=20, anchor=CENTER, spin=0, orient=UP)
  tag_scope("sparse_wall_inverted")
  diff()
  cube([thick, l, h])
    tag("remove")
    attach(FWD, FWD, align=CENTER, inside=true)
    sparse_wall(h, l, thick, maxang, strut, max_bridge, anchor, spin, orient);

$fn = 32;

module meyer_logo()
  cuboid([50, 52, 2], chamfer=1.8, edges=[BOT]) {
    attach(TOP, BOT, align=LEFT)
      color("white")
      resize([47.5, 0, 0])
      move([-17.2, -26, 0])
      linear_extrude(1.4)
      text("M", 34, "Avita Outline:style=Outline Black");
    attach(TOP, BOT, align=LEFT)
      color("white")
      resize([47.5, 0, 0])
      move([-6, -27, 0])
      linear_extrude(1.4)
      text("meyer", 12.4, "Aileron:style=Black", spacing=0.9);
  }

module meyer_logo_face(cube_face)
  attach(cube_face, BACK, align=CENTER, shiftout=-1)
  move([0, 28, 0])
  xrot(90)
  meyer_logo();

module meyer_cube(partial)
  diff()
  cuboid([64, 64, 80], chamfer=6, edges=[BOT, LEFT+FRONT, RIGHT+FRONT, LEFT+BACK, RIGHT+BACK]) {
    tag(partial ? "remove" : "")
    meyer_logo_face(LEFT);
    tag(partial ? "remove" : "")
    meyer_logo_face(RIGHT);
    tag(partial ? "remove" : "")
    meyer_logo_face(FRONT);
    tag(partial ? "remove" : "")
    meyer_logo_face(BACK);

    tag("remove")
    attach(TOP, TOP, align=CENTER, inside=true, shiftout=24)
    cuboid([56, 56, 100], chamfer=4);
  }
